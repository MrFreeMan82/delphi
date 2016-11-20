<DIV id="atsStatfilter">
			<TABLE class="customtable">
				<THEAD align="center">
					<TR><TD>Дата</TD><TD>Время</TD><TD>Дли-сть</TD><TD>Отдел</TD></TR>
				</THEAD>
				<TBODY>
					<TR>
						<TD>
							C&nbsp;&nbsp;&nbsp;<INPUT type="text" id="ds" maxlength="15" size="10" value="{$ds_def}" onclick="NewCssCal('ds','ddmmyyyy','arrow');"/>		
						</TD>
						<TD>
							<INPUT type="text" id="ts" maxlength="10" size="5" value="{$ts_def}"/>
						</TD>
						<TD>
							<INPUT type="text" id="durs" maxlength="10" size="5" value="{$durs_def}"/>
						</TD>
						<TD>
							<SELECT id="dept">
								{foreach $dept as $item}
									{if $dept_selected == $item.dept_id}
										<OPTION selected value="{$item.dept_id}">{$item.dept_name}</OPTION>
									{else}
										<OPTION value="{$item.dept_id}">{$item.dept_name}</OPTION>
									{/if}	
								{/foreach}
							</SELECT>
						</TD>						
					</TR>
					<TR>
						<TD>		
							По&nbsp;<INPUT type="text" id="de" maxlength="15" size="10" value="{$de_def}" onclick="NewCssCal('de','ddmmyyyy','arrow');"/>
						</TD>
						<TD>
							<INPUT type="text" id="te" maxlength="10" size="5" value="{$te_def}"/>
						</TD>
						<TD>
							<INPUT type="text" id="dure" maxlength="10" size="5" value="{$dure_def}"/>
						</TD>
						<TD><INPUT type="button" value="Показать" style="float:right" onclick="onClickshowATSStat('showATSStat');"/></TD>
					</TR>
				</TBODY>
			</TABLE>			
</DIV>
<HR>   		
<DIV id="atsStatleftcol">
			<TABLE class="outputtable">
					<THEAD align="center">
						<TR><TD style="width:10px"></TD><TD>Телефон</TD><TD>ФИО</TD><TD>Исх.(R)</TD><TD>Исх.(N)</TD><TD>Вх.</TD></TR>
					</THEAD>
					<TBODY>
						{if isset($ats_stat)}
							{foreach $ats_stat as $item}
								<TR><TD><INPUT type="checkbox"/></TD><TD>{$item.AB_NUM}</TD><TD>{$item.AB_NAME}</TD><TD>{$item.REAL_COUNT_NUM}</TD><TD>{$item.COUNT_NUM}</TD><TD>{$item.AB_INCOMING}</TD></TR>	
							{/foreach}
						{/if}
					</TBODY>
			</TABLE>
</DIV>
<BR>
<DIV id="atsStatfooter">	
   			{if isset($enableBackward)}
   				<A href ="#" onclick="onClickshowATSStat('atsstatBackward');">&lt;-- Назад</A>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
   			{/if}	
   			
   			{if isset($enableForward)}
   				<A href ="#" onclick="onClickshowATSStat('atsstatForward');">Далее --&gt;</A>
   			{/if}
   			<INPUT type="hidden" id="limit" value="{$limit}"/>
   			<INPUT type="hidden" id="offset" value="{$offset}"/>
</DIV>
<BR><BR>	

<DIV id="modal_form"><!-- Само окно --> 
      <SPAN id="modal_close"></SPAN> <!-- Кнопка закрыть --> 
      <!-- Тут любое содержимое -->
      <P>Пожалуйста подождите...</P>
</DIV>
<DIV id="overlay"></DIV><!-- Подложка -->	