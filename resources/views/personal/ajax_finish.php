
<style>
	#next,
	#finish {
		display:none;
	}
</style>

<div class="test-result">

	<h2>Результаты теста</h2>

	<?php 
		$percent = (int)$params['right']*100/(int)$params['count'];
		if ($percent > 70) {
			echo '<p class="oktext">Поздравляем, Вы прошли тест !</p>';										
		}
		else {
			echo '<p class="errortext">Увы, Вы не прошли тест</p>';										
		}
	?>
	<table>
		<tbody>
			<tr>
				<th>Количество вопросов</th>
				<td><?=$params['count']; ?></td>
			</tr>
			<tr>
				<th>Количество правильных ответов</th>
				<td><?=$params['right']; ?> (<?=number_format($percent, 2); ?>%)</td>
			</tr>
		</tbody>
	</table>																							</tbody></table>
</div>



