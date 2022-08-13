@extends('layouts.voyager')

@section('page_title','Резюме')

@section('content')

<div class="container-fluid">
    <div class="row">
        <div class="col-md-12">
            <div class="panel panel-bordered">
                <div class="panel-body">
<div class="resume">
    <h2><?php 
        $str_fio = "Неизвестный";
        if ($person && $person->surname && $person->name) {
            $str_fio = $person->surname." ".$person->name;
        } 
        echo $str_fio;
    ?></h2>

        <div class="resume-header">
            <p><span><?php 
                $str_gender="Пол не указан";
                if ($person) {
                    if ($person->gender) { $str_gender="Мужчина"; } 
                        else { $str_gender="Женщина"; }
                } 
            ?></span>
            <?php 
                $str_birth = 'дата рождения';
                $str_date = 'неизвестна';
                if ($person) {
                    if ($person->gender) {
                        $str_birth = 'родился';
                    }
                    else
                        $str_birth = 'родилась';

                    if ($person->birthday) {
                        $date = new \DatetIme($person->birthday);
                        $str_date = $date->format('j.m.Y');    
                    }
                }
                echo $str_gender.', '.$str_birth.' '.$str_date;    
            ?>            
            </p>
            <p>
            <?php 
                $str_country = 'Страна неизвестна';
                $str_city = 'Город неизвестен';
                if ($person) {
                    if ($person->national) {
                        $str_country = $person->national;
                    }
                    if ($person->city) {
                        $str_city = $person->city;    
                    }
                }
                echo $str_country.', '.$str_city;    
            ?>    
            </p>
        </div>
        <div class="resume-contacts">
            <p class="resume-contacts-title">Контакты</p>
            <p>Телефон: <span><?php if ($person) { echo $person->phone;} ?></span></p>
            <p>Email: <a href="mailto:<?=$user->email; ?>"><span><?=$user->email; ?></span></a></p>
        </div>
        <h3><?php 
            $str_prof = "Профессия неизвестна";
            if ($person && $person->profession) { 
                $str_prof = $person->profession;
            } 
            echo $str_prof;
        ?></h3>
        <p>Портфолио</p>
        <?php
            if ($person && $person->portfolio) {
                $arr_files = explode(';',$person->portfolio); 
                foreach($arr_files as $filename) {
                    $arr_name = explode('/',$filename);
                    echo "<a href='".$filename."'>".$arr_name[count($arr_name)-1]."</a><br>";
                }
            }
        ?>
        <p class="resume-contacts-title">Дополнительно сообщаю</p>
        <p><?php 
            $str_info = 'Дополнительно ничего не известно';
            if ($person && $person->info) {
                $str_info = $person->info;
            } 
            echo $str_info;
        ?></p>
    </div>

                </div>
            </div>
        </div>
    </div>
</div>

@endsection
