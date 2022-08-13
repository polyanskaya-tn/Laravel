
    <div class="test">
        <div class="pag">
            <span>Вопрос</span>
            <ul>
                <?php
                    for ($i = 1; $i <= $params['count']; $i++) {
                        echo '<li ';
                        echo ($params['number'] == $i) ? 'class="active"':'';
                        echo '>'.$i.'</li>';                        
                    }
                ?>

<!--
               <li <?php if ($params['number'] == 1) echo 'class="active"'; ?> >1</li>
                <li <?php if ($params['number'] == 2) echo 'class="active"'; ?> >2</li>
                <li <?php if ($params['number'] == 3) echo 'class="active"'; ?> >3</li>
                <li <?php if ($params['number'] == 4) echo 'class="active"'; ?> >4</li>
                <li <?php if ($params['number'] == 5) echo 'class="active"'; ?> >5</li>
                <li <?php if ($params['number'] == 6) echo 'class="active"'; ?> >6</li>
                <li <?php if ($params['number'] == 7) echo 'class="active"'; ?> >7</li>
                <li <?php if ($params['number'] == 8) echo 'class="active"'; ?> >8</li>
                <li <?php if ($params['number'] == 9) echo 'class="active"'; ?> >9</li>
                <li <?php if ($params['number'] == 10) echo 'class="active"'; ?> >10</li>
-->
            </ul>
        </div>
<!--
        <p class="question"><span>Вопрос:</span> Сегодня прекрасный день — у вас начинается отпуск, скоро увидите море. Кстати, куда едете?</p>

        <p><input name="answer" value="13427" type="radio">В Азию, конечно: Мальдивы, Филиппины. Разумеется, пять звезд — и пусть весь мир подождет!</p>

        <p><input name="answer" value="13427" type="radio">Нашел отличный дом на итальянском острове — почти как любимая дача, только со свежими морепродуктами. Выезжаю! </p>

        <p><input name="answer" value="13427" type="radio">За пару дней до отпуска перехватил симпатичный горячий тур. Всегда так делаю!</p>

        <p><input name="answer" value="13427" type="radio">В Краснодарский край, нам чужого моря не надо, свое есть! </p>
-->

        <p class="question"><span>Вопрос:</span> <?=$data->value; ?></p>

        <?php
            //answers
            foreach($data->answers as $answer) {
                //var_dump($answer);
                echo '<p><input name="answer" value="'.$answer->id.'" type="radio">'.$answer->value.'</p>';
                //var_dump($answer->value);
            }
        ?>

        <input id="tid" type="hidden" name="tid" value="<?=$params['test_id']; ?>">
        <input id="qid" type="hidden" name="qid" value="<?=$data->id; ?>">
        <input id="num" type="hidden" name="num" value="<?=$params['number']; ?>">    
        <input id="count" type="hidden" name="count" value="<?=$params['count']; ?>">    
    </div>
