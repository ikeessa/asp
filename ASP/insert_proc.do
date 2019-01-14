	<!--#include virtual="/common/const.do"-->
	<%

	Dim wtype : wtype = Func_filter("wtype")
	Dim idx : idx = Func_filter("idx")
	Dim inhtml,row1,row2,row3,row4,arr_list1,arr_list2,arr_list3,subsql2,subsql3,srs2,srs3,procount,recount,objTextFile,objFSO,ForReading,arrLine,row,arrTap

	Dim textarea : textarea = Func_filter("textarea")
	Dim rp : rp = Func_filter("rp")
	

		If wtype = "insert" Then 
			arrLine = Split(textarea,CHR(10))
			For row =0 To Ubound(arrLine,1)-1
				arrTap=Split(arrLine(row),CHR(9))
				Response.write arrTap(0)
				
				SQL="INSERT INTO TBL_VAL_TEST (LINE_NAME,SYSTEM_NAME,SYSTEM_UNIT,DOC_GBN,DOC_TYPE,DOC_NO,DOC_REV,DOC_PAGE,DOC_FROM,DOC_TO,DOC_APPROVAL,DOC_TITLE,DOC_TEAM,DOC_MAN,DOC_BINDER,DOC_FILENAME,DOC_REMAKE) VALUES ("_
						&"'"&arrTap(0)&"','"&arrTap(1)&"','"&arrTap(2)&"','"&arrTap(3)&"','"&rp&"','"&arrTap(4)&"','"&arrTap(5)&"','"&arrTap(6)&"','"&arrTap(7)&"','"&arrTap(8)&"','"&arrTap(9)&"','"&arrTap(10)&"','"&arrTap(11)&"',"_
						&"'"&arrTap(12)&"','"&arrTap(13)&"','"&arrTap(14)&"','"&arrTap(15)&"')"
				dbcon.execute(sql)
			next
			
			response.write "<script>"&Chr(13)
			response.write " parent.notify('success', 'Success' , 'Save succeeded');"&Chr(13)
			response.write " parent.location.href='insert.do';" & chr(13)
			response.write "</script>"&Chr(13)

		End If

		
	%>