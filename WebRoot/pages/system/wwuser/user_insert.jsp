<%@ page contentType="text/html;charset=GBK" %>
<%@ include file="/pages/commons/inc.jsp" %>
<%@page import="com.hoson.search.*" %>
<%!

     public static int nameCheck(String name){
             if(name==null){return 0;} 
             return 0;
             
      }
       
%>

<%
String sql = null;
Connection cn = null;
Properties prop = null;
String user_id = null;
String user_name = null;
String user_cn_name = null;
String user_pwd = null;
String user_pwd2 = null;
String station_ids = null;
Map map = null;
String t = "t_sys_ww_user";
String cols="user_id,user_name,user_pwd,user_allname";
String hideCols="page,page_size";
String msg = null;
try{

prop = JspUtil.getReqProp(request);

user_name =prop.getProperty("user_name","");
user_pwd =prop.getProperty("user_pwd","");
user_pwd2 =prop.getProperty("user_pwd2","");
station_ids =prop.getProperty("station_ids","");
System.out.println("station_ids==="+station_ids);
if(user_name.length()<3 || user_name.length()>20){
msg = "用户名长度为3到20个字符";
JspUtil.go2error(request,response,msg);
return;

}


if(user_pwd.length()<5 || user_pwd.length()>20){

msg = "密码长度为5到20个字符";
JspUtil.go2error(request,response,msg);
return;
}

if(!StringUtil.equals(user_pwd,user_pwd2)){
msg = "输入的密码不一致，请重新输入";
JspUtil.go2error(request,response,msg);
return;
}else{
	String md5 = f.cfg("md5","0");
    if(f.eq(md5,"1")){
		prop.setProperty("user_pwd",f.md5(user_pwd));
      }
}

sql="select user_id from t_sys_ww_user where user_name='"+user_name+"'";
cn=DBUtil.getConn(request);
map = DBUtil.queryOne(cn,sql,null);
if(map!=null){
//out.println("用户["+user_name+"]已经存在");
msg = "用户["+user_name+"]已经存在";
JspUtil.go2error(request,response,msg);
return;
}
user_id = DBUtil.getNextId(cn,t,"user_id")+"";
prop.setProperty("user_id",user_id);
DBUtil.insert(cn,t,cols,prop);

}catch(Exception e){

JspUtil.go2error(request,response,e);
return;
}finally{
DBUtil.close(cn);
}

%>

<form name=form1 method="post" action="user_query.jsp">

</form>
<script>
form1.submit();
</script>


