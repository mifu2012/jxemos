<%@ page contentType="text/html;charset=GBK"%>
<%@ include file="/pages/commons/inc_empty.jsp"%>
<%
    BaseAction action = null;
			try {
				action = new FormAction();
				action.run(request, response, "area");

			} catch (Exception e) {
				w.error(e);
				return;
			}
%>
<link rel="stylesheet" href="../../../web/index.css" />
<script type="text/javascript" src="../../../scripts/calendar.js"></script>
<body onload=form1.submit() style="overflow: hidden;">
	<form name=form1 method=post target=q action=02.jsp>
		<input type=hidden name=station_type value='1'>
		<input type=hidden name=ph_col value='val03'>
		<input type=hidden name=cod_col value='val02'>
		<input type=hidden name=q_col value='val04'>

		<input type=hidden name=no_data_string value="--">
		<input type=hidden name=not_config_string value="��">
		<input type=hidden name=offline_string value="��">
		<input type=hidden name=online_string value="��">
		<input type=hidden name='tableName'
			value='<%=request.getParameter("tableName")%>'>

		<div class="frame-main-content"
			style="left: 0; top: 0; position: static;">
			<div class="nt">
				<p class="tiaojiao-p">
					<select name=area_id onchange=form1.submit() class="selectoption">
						<%=w.get("areaOption")%>
					</select>
				</p>
				<p class="tiaojiao-p">
					<input type=text class=c1 name=date1 value='<%=w.get("date1")%>'
						onclick="new Calendar().show(this);">
				</p>
				<input type=button value='�鿴' onclick=form1.submit()
					class="tiaojianbutton">
			</div>
		</div>
		<iframe name=q frameborder=0 width=100% height=90%></iframe>
		</table>
	</form>


	<script>
function f_save(){
    var obj = window.frames["q"].window.document.getElementById('div_excel_content');
   //alert(obj);
    form2.txt_excel_content.value=obj.innerHTML;
    
    form2.action='/<%=ctx%>/pages/commons/save2excel.jsp';
		form2.submit();
	}
</script>