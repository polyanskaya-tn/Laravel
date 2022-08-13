@extends('layouts.voyager')

@section('page_title','Тест')

@section('page_header')
    <div class="container-fluid">
        <h1 class="page-title"> <i class="voyager-study"></i> Тест </h1>
    </div>
@stop

@section('head')
    <script src="{{ asset('js/jquery.js') }}"></script>
@endsection

@section('content')
<div class="container-fluid">
    <div class="row">
        <div class="col-md-12">
            <div class="panel panel-bordered">
                <div class="panel-body">
<!--
<pre>
<?php

//var_dump($data);

//var_dump($data->answers);

?>
</pre>
-->

<form id="test" novalidate method="POST" action="" autocomplete="off">
    @csrf
    <div class="test-form">
        <div id="ajax_test">

@include('personal.ajax_form')

        </div>
        <a id="next" class="button first" href="#">Далее</a>
        <a id="finish" class="button" href="#">Завершить</a>
    </div>

</form>

                </div>
            </div>
        </div>
    </div>
</div>

<script type="text/javascript">

    jQuery(document).ready( function ($) {

        $.ajaxSetup({
          headers: {
            'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
          }
        });

        function add_ajax_click() {
            $('#next').bind('click', function(event) {
                event.preventDefault();
                $('.app-container').hide();
                $('#voyager-loader').show();
                $.ajax({
                    type: 'POST',
                    url: '/user/ajax',
                    data: {
                        tid: $('#tid').val(),
                        qid: $('#qid').val(),
                        num: $('#num').val(),
                        count: $('#count').val(),
                        answer: $('input[name="answer"]:checked').val(),
                    },
                    success: function(res) {
                        $('#voyager-loader').hide();
                        $('.app-container').show();

                        console.log(res);
                        $('#ajax_test').html(res);
                    },
                    error: function() {
                        alert('Ошибка ajax');
                    }
                });
            }); 
        }
        add_ajax_click();

        function add_finish_click() {
            $('#finish').bind('click', function(event) {
                event.preventDefault();
                $.ajax({
                    type: 'POST',
                    url: '/user/result',
                    data: {
//                        qid: $('#qid').val(),
//                        num: $('#num').val(),
                        tid: $('#tid').val(),
                        count: $('#count').val(),
                    },
                    success: function(res) {
                        console.log(res);
                        $('#ajax_test').html(res);
                    },
                    error: function() {
                        alert('Ошибка ajax');
                    }
                });
            }); 
        }
        add_finish_click();

    });
    
</script>


@endsection
