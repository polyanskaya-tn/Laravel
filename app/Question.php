<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use App\Answer;



class Question extends Model
{
 
	public function tests()
  	{
    	return $this->belongsToMany('App\Test', 'test_questions');
  	}   

	public function answers() {
		return $this->hasMany('App\Answer');
	}
}
