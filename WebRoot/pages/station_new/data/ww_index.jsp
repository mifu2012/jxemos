<%@ page contentType="text/html;charset=GBK" %>
<%@ include file="/pages/commons/inc.jsp" %>
<%
    String cols = "station_id,data_table,date1,date2,date3,hour1,hour2,hour3,infectant_id,zh_flag";
    String s = null;
    try{
    
      SwjUpdate.ww_data(request);
      s = f.hide(cols,request);
      //f.sop(s);
    }catch(Exception e){
     w.error(e);
     return;
    }
   
%>
<body onload='form1.submit()'>
<form name=form1 method=post action='<%=w.get("url")%>'>
<%=s%>
</form>
</body>