<%@ page contentType="text/html;charset=GBK"%>
<%@ include file="/pages/commons/inc.jsp"%>
<%
    BaseAction action = null;
    try {

        action = new ReportNbAction();
        action.run(request, response, "tj_yue");

    } catch (Exception e) {
        w.error(e);
        return;
    }
    RowSet rs = w.rs("data");
    String year = w.get("year");
    String month = w.get("month");
    int i, num = 0;
    String[] last_day = f.getLastDayOfMonthString(
            Integer.valueOf(year), Integer.valueOf(month)).split("-");
    num = Integer.valueOf(last_day[2]);
%>
<link rel="stylesheet" href="../../../web/index.css" />
<div id='div_excel_content'>
	<!--
<div class=h2 align=right>
报表时间:<%=request.getParameter("date1")%>
</div>
-->

	<table class="nui-table-inner major">
		<thead class="nui-table-head">
			<tr class="nui-table-row">
				<th class="nui-table-cell" style="width:110">
					站位名称
				</th>
				<th class="nui-table-cell" style="width:80">
					地区
				</th>
				<th class="nui-table-cell" style="width:60">
					时间
				</th>
				<%
				    for (i = 1; i <= num; i++) {
				%>
				<th class="nui-table-cell">
					<%=i%>
				</th>
				<%
				    }
				%>
				<th class="nui-table-cell" style="width:50">
					脱机点
				</th>
				<th class="nui-table-cell" style="width:50">
					在线率%
				</th>
			</tr>
		</thead>
		<tbody class="nui-table-body">
			<%
			    while (rs.next()) {
			%>
			<tr>
				<th class="nui-table-cell"><%=rs.get("station_desc")%></th>
				<th class="nui-table-cell"><%=rs.get("area_name")%>
				</th>
				<th class="nui-table-cell"><%=rs.get("m_time")%>
				</th>
				<%
				    for (i = 1; i <= num; i++) {
				%>
				<th class="nui-table-cell"><%=rs.get(i + "")%></th>
				<%
				    }
				%>
				<th class="nui-table-cell"><%=rs.get("off")%></th>
				<th class="nui-table-cell"><%=rs.get("online")%></th>
			</tr>
			<%
			    }
			%>
		</tbody>
	</table>
</div>