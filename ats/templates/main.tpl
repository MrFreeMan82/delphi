		<DIV id="mainheader">{$maincaption}</DIV>
		
		<DIV class="mainmenu">
				{if isset($mainnmenu)}
						{$mainnmenu}
				{/if}	
				<A href="#"  style="float:right; margin-right:10px" onclick="onClickExitSite();">Выход</A>				
		</DIV>
		   		
   		<DIV id="mainleftcol">
   		 		{if isset($mainleftcol)}
					{$mainleftcol}
				{/if}	
   		</DIV>
   		
   		<DIV id="mainfooter">
			&copy; 2014 Работа плюс	
   		</DIV>