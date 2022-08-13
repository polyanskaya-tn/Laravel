@extends('layouts.layout')

@section('content')

<!-- new code -->
<main>
    <div class="container">

<h1>Регистрация</h1>

<form novalidate method="POST" action="{{ route('register') }}" enctype="multipart/form-data">
    @csrf

<!--    <div class="row">
        <a class="photo">
            <svg width="24" height="24" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg" class="icon md-icon md-add-a-photo resume-part-form-photo__no-exists-icon"><path d="M3 4V1h2v3h3v2H5v3H3V6H0V4h3zm3 6V7h3V4h7l1.83 2H21c1.1 0 2 .9 2 2v12c0 1.1-.9 2-2 2H5c-1.1 0-2-.9-2-2V10h3zm7 9c2.76 0 5-2.24 5-5s-2.24-5-5-5-5 2.24-5 5 2.24 5 5 5zm-3.2-5c0 1.77 1.43 3.2 3.2 3.2s3.2-1.43 3.2-3.2-1.43-3.2-3.2-3.2-3.2 1.43-3.2 3.2z"></path></svg> 
            <div class="photo-text">Загрузить<br>фото</div>
        </a> 
    </div>              -->
    <div class="row">
        <div class="col-2">
            <label for="fio_surname">Фамилия <sup>*</sup></label>
            <input id="fio_surname" name="fio_surname" tabindex="0" required="" type="text">
        </div>
        <div class="col-2">
            <label for="fio_name">Имя <sup>*</sup></label>
            <input id="fio_name" name="fio_name" tabindex="1" required="" type="text">
        </div>
    </div>
    <div class="row">
        <div class="col-2">
            <label>Пол</label>
            <div class="gender">
                <a class="gender-button active" id="man" href="#">Мужчина</a> 
                <a class="gender-button" id="woman" href="#">Женщина</a>
                <input type="hidden" name="gender" id="gender" value="man">
            </div> 
        </div>
        <div class="col-2">
            <label for="birthday">Дата рождения</label>
            <input id="birthday" name="birthday" tabindex="2" type="text">
        </div>
        
    </div>
    <div class="row add-margin-top">
        <div class="col-2">
            <label for="profession">Желаемая должность <sup>*</sup> </label>
            <input id="profession" name="profession" tabindex="3" required="" type="text" >
        </div>
    </div>
    <div class="row add-margin-top">
        <div class="col-2">
            <label for="tel">Телефон <sup>*</sup></label>
            <input id="tel" name="tel" tabindex="4" required="" type="text">
        </div>
        <div class="col-2">
            <label for="email">E-mail <sup>*</sup></label>
            <input id="email" name="email" tabindex="5" type="email">
        </div>
    </div>
     @error('email')
        <span class="invalid-feedback" role="alert">
            <strong>{{ $message }}</strong>
        </span>
    @enderror
    <div class="row">
        <div class="col-2">
            <label for="national">Гражданство <sup>*</sup></label>
            <input id="national" name="national" tabindex="6" required="" type="text">
        </div>
        <div class="col-2">
            <label for="city">Город проживания <sup>*</sup></label>
            <input id="city" name="city" tabindex="7" type="text">
        </div>
    </div>
    <div class="row add-margin-top">
        <div class="col-2">
            <label for="name">Логин <sup>*</sup></label>
            <input id="name" name="name" tabindex="8" required="" type="text">
        </div>
        <div class="col-2">
            <label for="password">Пароль <sup>*</sup></label>
            <input id="password" name="password" tabindex="9" required="" type="password">
        </div>
    </div>
    @error('name')
        <span class="invalid-feedback" role="alert">
            <strong>{{ $message }}</strong>
        </span>
    @enderror
    @error('password')
        <span class="invalid-feedback" role="alert">
            <strong>{{ $message }}</strong>
        </span>
    @enderror
    <div class="row add-margin-top">
        <div class="col-2">
            <label>Портфолио</label>
            <div>
            <!--    <a href="#" class="load-button">Загрузить</a> -->
<div style="display: flex; margin: 15px 0 0 0; align-items: center;">
<label for="upload" class="load-button">Загрузить</label><div class="load-button-file"></div>
<input style="opacity: 0; z-index: -1;" type="file" id="upload" name="uploadfile[]" multiple onchange='document.querySelector(".load-button-file").innerHTML = Array.from(this.files).map(f => f.name).join(" | ")'>
</div>
                <p class="load-button-info">загрузить файл (.jpg, .png или .pdf не более 5Мб)</p>

<!--
<style>
    .uploadButton {
        display: block;
        width: 100px;
        background: #3df;
        padding: 10px;
        color: #FFF;
        font-size: 16px;
        font-weight: bold;
        font-family: Tahoma;
        text-align: center;
        border-radius: 10px;
        cursor: pointer;
    }
    .uploadButton:hover {
        background: #3ce;
    }
    .uploadButton div{
      color: #00097d;
    }
</style>


<label for="uploadbtn" class="uploadButton">Загрузить файл<div></div></label>
<input style="opacity: 0; z-index: -1;" multiple type="file" name="upload" id="uploadbtn" onchange='document.querySelector(".uploadButton div").innerHTML = Array.from(this.files).map(f => f.name).join("<br />")' />

-->

            </div>
        </div>
    </div>
    <div class="row">
        <div class="col-2">
            <label for="info">Дополнительно о себе</label>
            <textarea id='info' name='info' style="min-height: 250px;" tabindex="10"></textarea>
        </div>
    </div>
    <input type="submit" value="Сохранить" class="save-button">
    




</form>
    </div>
</main>

<script type="text/javascript">

    jQuery(document).ready( function ($) {

        //datepicker settings
        $("#birthday").datepicker({
            changeMonth:true, 
            changeYear:true,
            yearRange: '1960:2010',

        });
        //russian language for datepicker   
        $.datepicker.regional.ru = {
            closeText: "Закрыть",
            prevText: "&#x3C;Пред",
            nextText: "След&#x3E;",
            currentText: "Сегодня",
            monthNames: [ "Январь","Февраль","Март","Апрель","Май","Июнь",
            "Июль","Август","Сентябрь","Октябрь","Ноябрь","Декабрь" ],
            monthNamesShort: [ "Янв","Фев","Мар","Апр","Май","Июн",
            "Июл","Авг","Сен","Окт","Ноя","Дек" ],
            dayNames: [ "воскресенье","понедельник","вторник","среда","четверг","пятница","суббота" ],
            dayNamesShort: [ "вск","пнд","втр","срд","чтв","птн","сбт" ],
            dayNamesMin: [ "Вс","Пн","Вт","Ср","Чт","Пт","Сб" ],
            weekHeader: "Нед",
            dateFormat: "dd.mm.yy",
            firstDay: 1,
            isRTL: false,
            showMonthAfterYear: false,
            yearSuffix: "" };
        $.datepicker.setDefaults( $.datepicker.regional.ru );

        //change gender
        $('.gender-button').bind('click', function(event) {
            event.preventDefault();
            $('.gender-button').removeClass('active');
            $(this).addClass('active');
            $('#gender').val($(this).attr('id'));
            //this.blur();
            //$(this).attr('id')
            console.log($(this).attr('id'));
        });  

    });
    
</script>

@endsection
