<%@ page contentType="text/html;charset=GBK" %>
<%@ include file="/pages/commons/inc.jsp" %>
<%@page import="com.hoson.f"%>
<%

    try{
    
      SwjUpdate.station_index(request);//初始化页面数据
      
      //w封装了本页的request和response对象。
    
    }catch(Exception e){
     w.error(e);
     return;
    }

    boolean iswry = f.iswry(w.get("station_type"));//是否是污染源
    
    
    RowSet rs = w.rs("flist");
    
    String session_id = (String)session.getAttribute("session_id");
    String user_name = (String)session.getAttribute("user_name");
    String now = StringUtil.getNowDate() + "";
    int year = f.getYear(now);
    int month= f.getMonth(now);
    String season = f.getThisSeasonTime(month);
  // boolean b = zdxUpdate.isReal(user_name,session_id);//需恢复
%>

<style>
.search {font-family: "宋体"; font-size: 12px; BEHAVIOR: url('<%=request.getContextPath() %>/styles/selectBox.htc'); cursor: hand; }
.input {
   border: #ccc 1px solid;
   font-family: "微软雅黑";
   font-size: 13px;
   width: 150px;
   background:expression((this.readOnly &&this.readOnly==true)?"#f9f9f9":"")
}

</style>

<body scroll=no onload='f_r()'>
<form name=form1 method=post action="qsjdkh_list.jsp" target='frm_zw_list'>
<table style='width:100%;height:100%' border=0 cellspacing=0>
   <tr>
     <td style='height:20px' colspan="2">
         
       <table border=0 cellspacing=0>
          <tr>
              <td> 
                      站位类型:<select name=station_type  onchange=f_r() style="width:120px;"  class="search"><%=w.get("stationTypeOption")%></select>

              </td>
 
              <td>
                           地区:<select name=area_id onchange=f_r()  class="search" style="width:120px">
						  <%=w.get("areaOption")%>
						</select>
              </td>

              <td>
                       行业:<select name=trade_id onchange=f_r()  class="search">
					<option value=''>所有
					<%=w.get("tradeOption")%>
					</select>
              </td>
              <td>
                  年份:<select name=year onchange=f_r()  style="width:100px;" class="search">
						
						<%=f.getOption("2007,2008,2009,2010,2011,2012,2013,2014,2015,2016,2017,2018,2019,2020,2021,2022,2023,2024,2025,2026,2027,2028,2029,2030","2007,2008,2009,2010,2011,2012,2013,2014,2015,2016,2017,2018,2019,2020,2021,2022,2023,2024,2025,2026,2027,2028,2029,2030",String.valueOf(year)) %>
					</select>
				季度:<select name=jidu onchange=f_r()  style="width:100px;" class="search">
						
						<%=f.getOption("1,2,3,4","第一季度,第二季度,第三季度,第四季度",season) %>
						</select>
              </td>
              
              <td >
		       站位名称:<input type=text name='station_desc' value='' class="input">
		     <input type=button value='查询' onclick='f_jdkh()' class='btn'>
		    
		     
		  <td>
              
          </tr>
       </table>  
     </td>

     
   
   <tr>
     <td style='height:100%' colspan="2"><%--<div id="topDiv"></div>
      --%><iframe name='frm_zw_list' id='frm_zw_list' width=100% height=100% frameborder=0 allowtransparency="true"></iframe>
 
     <br></td>
   </tr>
   
</table>
</form>
</body>


<script>
function get(zc,yj,bj,tj){ 
	Ob=document.all("zc");
	Ob.innerHTML=zc;
	Ob=document.all("yj");
	Ob.innerHTML=yj;
	Ob=document.all("bj");
	Ob.innerHTML=bj;
	Ob=document.all("tj");
	Ob.innerHTML=tj;
} 

function f_rr(){
 by_excel();
 form1.action='index.jsp';
 form1.target='';
 form1.submit();
}
function f_submit(){
	document.all("frm_real_data_excel").src= "";
	by_excel();
 	form1.submit();
}
function f_r(){
 	form1.submit();
}
 function f_jdkh(){
    	
    	form1.submit();
 }
 
  function f_hour(){
   	form1.data_flag.value= "hour";
   	by_excel();
    form1.submit();
 }
 
  function f_yc(){
	by_excel();
    form1.action='offline.jsp';
    //alert(form1.action);
    form1.submit();
 }
 function f_print(){
  by_excel();
  var obj = getobj("frm_real_data");
  //window.frames["q"].document.execCommand('print');
  obj.document.execCommand('print');
}
 
 function by_excel(){
	form1.action="jdkh_list.jsp";
	form1.target='frm_zw_list';
 }

 
 
 function f_excel(){
    //alert("ddd");
   // alert(form1.data_flag.value);
 	if(form1.data_flag.value=='real'){
		 var r = window.frames["frm_real_data"].window.document.all('station_ids');
		 //alert(r);
		 var str = "";
		 for(var i=0;i<r.length;i++){
		 	if(r[i].checked){
				str = str + r[i].value + ",";
		 	}
		    }
		    form1.station_ids.value = str;
		 	form1.action='select_real.jsp';
		 	form1.target='frm_real_data_excel';
		 	form1.submit();
	}
 }
 function f_hz(){
 	var url = "../map/all_area_info.jsp";
	var width = 1024;
	var height = 668;
	window.open(url,"","scrollbars=yes,resizable=yes"+",height="+height+",width="+width+",left="+(window.screen.width-width)/2+",top="+(window.screen.height-height)/2);
}
 <%--
 Ext.onReady(function(){
  var combo = new Ext.form.ComboBox({
 	emptyText:'请选择',
    mode:'local',
    triggerAction:'all',
    transform:'area_id'
    });
  });
  --%>
</script>


