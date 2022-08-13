<?php

namespace App\Http\Controllers;

use App\Personal;
use App\User;
use App\Question;
use App\TestQuestion;
use App\Test;
use App\Answer;
use App\UsersTest;
use App\UsersProfession;
use App\TestsProfession;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

use Illuminate\Support\Facades\Log;


class PersonalController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */

    public function index()
    {
        $id = Auth::id();
        $user = User::find($id);
        $person = Personal::where('user_id', $user->id)->first();

        return view('personal.index', ['user' => $user, 'person' => $person]);
    }

    public function test($id = 1)
    {
        if (!$id) return;
        //get profession by auth user id
        $user_id = Auth::id();
        $profession = UsersProfession::where('user_id',$user_id)->first();
        if (!$profession) return;
        //get test by profession
        $test = TestsProfession::where('profession_id', $profession->prof_id)->first();
        if (!$test) return;
        
        $id = $test->test_id;
        $count = Test::find($id)->questions()->count();
        $this->save_result($id, true);

        $question = Test::find($id)->questions()->orderBy('num')->first();
        $params = array('number' => 1, 'count' => $count, 'test_id' => $id);

        return view('personal.test', ['data' => $question, 'params' => $params]);
    }

    public function ajax(Request $request)
    {
        //get all questions
        $test_id = (int)$request['tid'];
        $number = (int)$request['num'] + 1;
        $count = (int)$request['count'];
        
        $questions = Test::find($test_id)->questions()->orderBy('num')->get();
 
        $flag = false;
        $cur_question = null;
        foreach ($questions as $key => $question) {
            if ($flag) {
                $cur_question = $question;
                break;
            }

            if ($question->id == $request['qid']) {
                $flag = true;
            }
        }

        $right = 0;
        if ($request['answer'])
            $right = $this->calc_result($test_id, (int)$request['answer']);

        if (($count > 0) && ($number-1 == $count)) {
            if (!$right) {
                //get from bd
                $right = $this->get_result($test_id);
            }
            $params = array('count' => $count, 'right' => $right);
            return view('personal.ajax_finish', ['params' => $params]);
        }
        else {
            $params = array('number' => $number, 'count' => $count, 'test_id' => $test_id);
            return view('personal.ajax_form', ['data' => $cur_question, 'params' => $params]);
        }
    }

    public function testresult(Request $request)
    {
        $count = (int)$request['count'];
        $test_id = (int)$request['tid'];
        $right = $this->get_result($test_id);

        $params = array('count' => $count, 'right' => $right);
        return view('personal.ajax_finish', ['params' => $params]);
    }

    private function get_result($test_id) {
        if (!$test_id) return 0;

        $user_id = Auth::id();
        $res = UsersTest::where('user_id', $user_id)
                ->where('test_id', $test_id)
                ->first();

        if (!$res) return 0;

        return $res->result;        
    }

    private function save_result($test_id, $is_init = false) {
        if (!$test_id) return;

        $user_id = Auth::id();
        $res = UsersTest::where('user_id', $user_id)
                ->where('test_id', $test_id)
                ->first();
        if ($res) {
            //update
            if (!$is_init) {
                $res->result = $res->result + 1;
            }
            else 
                $res->result = 0;
            $res->save();
            return $res->result;
        }
        else {
            //new
            $res = new UsersTest;
            $res->user_id = $user_id;
            $res->test_id = $test_id;
            if (!$is_init) {
                $res->result = 1;
            }
            else
                $res->result = 0;
            $res->save();
            return $res->result;
        }
    }

    private function calc_result($test_id,$answer_id) {
        if (!$answer_id) return 0;
        if (!$test_id) return 0;

        $answer = Answer::find($answer_id);
        if ($answer->right) {
            //add to result in bd
            return $this->save_result($test_id);
        }
        return 0;
    }
}
