<?php

namespace App\Http\Controllers;

use App\Test;
use App\Question;
use App\Answer;
use App\TestQuestion;

use Illuminate\Http\Request;
use TCG\Voyager\Http\Controllers\VoyagerBaseController;
use TCG\Voyager\Facades\Voyager;

use Illuminate\Support\Facades\DB;

use Illuminate\Support\Facades\Log;


class QuestionAdminController extends VoyagerBaseController
{

	public function show(Request $request, $id)
    {
        $slug = $this->getSlug($request);

        $dataType = Voyager::model('DataType')->where('slug', '=', $slug)->first();

        $tests = Test::all();
        $question = Question::find($id);
	    $answers = $question->answers()->get();

		return view('vendor.voyager.questions.edit-add', 
			['edit' => true, 'dataType' => $dataType, 'id' => $id,
			'question' => $question, 'answers' => $answers, 
			'tests' => $tests]);
    }

	public function edit(Request $request, $id) {

		$slug = $this->getSlug($request);
	    $dataType = Voyager::model('DataType')->where('slug', '=', $slug)->first();

	    $tests = Test::all();
	    $question = Question::find($id);
	    $answers = $question->answers()->get();

		return view('vendor.voyager.questions.edit-add', 
			['edit' => true, 'dataType' => $dataType, 'id' => $id,
			'question' => $question, 'answers' => $answers,'tests' => $tests]);
	}
	
	public function update(Request $request, $id)
    {
        $slug = $this->getSlug($request);

        $dataType = Voyager::model('DataType')->where('slug', '=', $slug)->first();

        $question = Question::find($id);
        $question->value = $request['question'];
        $question->num = null;
        $question->save();

        $rel = TestQuestion::where('question_id',$question->id)->first();
        $rel->question_id = $question->id;
        $rel->test_id = $request['test'];
        $rel->save();

		$inputs = $request->all();
		foreach ($inputs as $key => $value) {
			$num = $this->getNumber($key);
			if ($num) {
				$this->updateAnswer($question->id, $value, 
					$request['check_'.$num], $num);
			}
			else {
				$num = $this->getNewNumber($key);
				if ($num) 
					$this->newAnswer($question->id, $value, 
						$request['check_new_'.$num]);
			}
		}

        $redirect = redirect()->route("voyager.{$dataType->slug}.index");
        return $redirect->with([
            'message'    => __('voyager::generic.successfully_updated')." {$dataType->getTranslatedAttribute('display_name_singular')}",
            'alert-type' => 'success',
        ]);
    }

	public function create(Request $request)
    {
        $slug = $this->getSlug($request);

        $dataType = Voyager::model('DataType')->where('slug', '=', $slug)->first();
        $tests = Test::all();

        return view('vendor.voyager.questions.edit-add', 
			['edit' => false, 'dataType' => $dataType,'tests' => $tests]);
    }

/* -- Request --
	'question' => '11',
  	'answer_new_1' => '22',
  	'answer_new_2' => '33',
  	'answer_new_3' => '44', 
*/
	public function store(Request $request)
    {
        $slug = $this->getSlug($request);

        $dataType = Voyager::model('DataType')->where('slug', '=', $slug)->first();

        Log::info($request);

        //new
        $question = new Question;
        $question->value = $request['question'];
        $question->num = null;
        $question->save();

        $rel = new TestQuestion;
        $rel->question_id = $question->id;
        $rel->test_id = $request['test'];
        $rel->save();

		$inputs = $request->all();
		foreach ($inputs as $key => $value) {
			$num = $this->getNewNumber($key);
			if ($num) 
				$this->newAnswer($question->id, $value, 
					$request['check_new_'.$num]);
		}

        $redirect = redirect()->route("voyager.{$dataType->slug}.index");
        return $redirect->with([
                    'message'    => __('voyager::generic.successfully_added_new')." {$dataType->getTranslatedAttribute('display_name_singular')}",
                    'alert-type' => 'success',
                ]);
    }

    private function getNumber($key) {

		$pattern = '/^answer_(\d+)$/';
		if ( preg_match($pattern, $key, $matches) ) {
			return $matches[1];
		}
		return 0;
    }

    private function getNewNumber($key) {

		$pattern = '/^answer_new_(\d+)$/';
		if ( preg_match($pattern, $key, $matches) ) {
			return $matches[1];
		}
		return 0;
    }

    private function newAnswer($qid, $value, $right) {
    	$answer = new Answer;
        $answer->question_id = $qid;
        $answer->value = $value;
        $answer->right = $right;
        $answer->save();
    }

    private function updateAnswer($qid, $value, $right, $answ_id) {
    	$answer = Answer::find($answ_id);
        $answer->question_id = $qid;
        $answer->value = $value;
        $answer->right = $right;
        $answer->save();
    }

	public function destroy(Request $request, $id)
    {
        $slug = $this->getSlug($request);

        $dataType = Voyager::model('DataType')->where('slug', '=', $slug)->first();

        //delete answers
       	$answer = Answer::where('question_id', $id)->delete();
       	$relation = TestQuestion::where('question_id',$id)
       		->delete();
       	//delete question
		$res = Question::destroy($id);

		$displayName = $dataType->getTranslatedAttribute('display_name_singular');
    	$data = $res
            ? [
                'message'    => __('voyager::generic.successfully_deleted')." {$displayName}",
                'alert-type' => 'success',
            ]
            : [
                'message'    => __('voyager::generic.error_deleting')." {$displayName}",
                'alert-type' => 'error',
            ];

        return redirect()->route("voyager.{$dataType->slug}.index")->with($data);
    }

}
