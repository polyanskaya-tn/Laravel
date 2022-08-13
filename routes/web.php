<?php

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

Route::get('/', function () {
    return view('welcome');
});

Route::group(['prefix' => 'admin'], function () {
    Voyager::routes();
});

Route::get('login', 'Auth\LoginController@showLoginForm')->name('login');
Route::post('login', 'Auth\LoginController@login');
Route::post('logout', 'Auth\LoginController@logout')->name('logout');

Route::get('register', 'Auth\RegisterController@showRegistrationForm')->name('register');
Route::post('register', 'Auth\RegisterController@register');

Route::group(['middleware' => 'admin.user'], function () {
    Route::get('/user', ['uses' => 'PersonalController@index', 'as' => 'user.index']);
    Route::get('/user/tests', ['uses' => 'PersonalController@test', 'as' => 'user.tests']);
    Route::post('/user/ajax', ['uses' => 'PersonalController@ajax', 'as' => 'user.ajax']);
    Route::post('/user/result', ['uses' => 'PersonalController@testresult', 'as' => 'user.result']);
});

Route::get('/home', 'HomeController@index')->name('home');
