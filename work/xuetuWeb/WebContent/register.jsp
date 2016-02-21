<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Frameset//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-frameset.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" lang="zh-CN">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <link rel="stylesheet" type="text/css" href="./Style/skin.css" />
</head>
<script src="jquery-1.11.1.js"></script>
<script>
 function Submit(){
	var insertForm = document.getElementsByName("registerForm")[0];
	insertForm.action ="/xuetuWeb/RegisterServlet";
	insertForm.submit();
} 
/* function Confirm(){
	var insertForm = document.getElementsByName("insertForm")[0];
	insertForm.action ="/studentweb/insert";
	insertForm.submit();
} */
$(document).ready(function(e) {
	$(":button[name=submit]").click(function(e) {
		var sto_user_name = $(":input[name=sto_user_name]").val();
		var sto_tel = $(":input[name=sto_tel]").val();
		var sto_address = $(":input[name=sto_address]").val();
		var sto_name = $(":input[name=sto_name]").val();
		var sto_introduciton = $(":input[name=sto_introduciton]").val();
		var sto_pwd = $(":input[name=sto_pwd]").val();
		var sto_pwdConfirm = $(":input[name=sto_pwdConfirm]").val();
        if(sto_user_name==""||sto_tel==""||sto_address==""||sto_name==""||sto_introduciton==""||sto_pwd==""||sto_pwdConfirm=="")
		{
        	alert("请填写必填项！");
		}
})
    });
    </script>
    <script type="text/javascript">
    var file = document.getElementById("sto_img");
    file.select();
    var realPath = document.selection.createRange().text;
function showImage()
{
    // 获取文件路径
    var path = getPath(document)
    var path = document.getElementById('sto_img').value;
    // 显示文件路径
    document.getElementById('imgName').innerHTML = path;
    // 创建 img
    var img = document.createElement('img');
    // 载入图像
    img.src = path;
    // 插入图像到页面中
    document.getElementById('imgPrev').appendChild(img);
}
//参数obj为input file对象
function getPath(file) {
         if(file)
     {  
         if (window.navigator.userAgent.indexOf("MSIE")>=1)
        {
        	 file.select();
            return document.selection.createRange().text;
        }   
         else if(window.navigator.userAgent.indexOf("Firefox")>=1)
         {
            if(file.files)
             {
                    return file.files.item(0).getAsDataURL();
              }
              return file.value;
         }
        return file.value;
    }
}
</script>
    <body>
    <form name="registerForm" post="post">
        <table width="100%" border="0" cellpadding="0" cellspacing="0">
            <!-- 头部开始 -->
            <tr>
                <td width="17" valign="top" background="./Images/mail_left_bg.gif">
                    <img src="./Images/left_top_right.gif" width="17" height="29" />
                </td>
                <td valign="top" background="./Images/content_bg.gif">
                    <table width="100%" height="31" border="0" cellpadding="0" cellspacing="0" background="././Images/content_bg.gif">
                        <tr><td height="31"><div class="title">添加栏目</div></td></tr>
                    </table>
                </td>
                <td width="16" valign="top" background="./Images/mail_right_bg.gif"><img src="./Images/nav_right_bg.gif" width="16" height="29" /></td>
            </tr>
            <!-- 中间部分开始 -->
            <tr>
                <!--第一行左边框-->
                <td valign="middle" background="./Images/mail_left_bg.gif">&nbsp;</td>
                <!--第一行中间内容-->
                <td valign="top" bgcolor="#F7F8F9">
                    <table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
                        <!-- 空白行-->
                        <tr><td colspan="2" valign="top">&nbsp;</td><td>&nbsp;</td><td valign="top">&nbsp;</td></tr>
                        <tr>
                            <td colspan="4">
                                <table>
                                    <tr>
                                        <td width="100" align="center"><img src="./Images/mime.gif" /></td>
                                        <td valign="bottom"><h3 style="letter-spacing:1px;">&nbsp;</h3></td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                        <!-- 一条线 -->
                        <tr>
                            <td height="40" colspan="4">
                                <table width="100%" height="1" border="0" cellpadding="0" cellspacing="0" bgcolor="#CCCCCC">
                                    <tr><td></td></tr>
                                </table>
                            </td>
                        </tr>
                        <!-- 添加栏目开始 -->
                        <tr>
                            <td width="2%">&nbsp;</td>
                            <td width="96%">
                                <table width="100%">
                                    <tr>
                                        <td colspan="2">
                                            <form name="insertForm" method="post">
                                                <table width="100%" class="cont">
                                                    <tr>
                                                        <td>&nbsp;</td>
                                                        <td>用户名：</td>
                                                        <td><input class="text" type="text" name="sto_user_name" value="" /></td>
                                                        <td></td>
                                                        <td>&nbsp;</td>
                                                    </tr>
                                                    <tr>
                                                        <td>&nbsp;</td>
                                                        <td id="imgName">店铺图片</td>
                                                        <td><input type="file" id="sto_img" onchange="showImage()" /><br/>
</td>
                                                        
                                                        <td id="imgPrev" align="center"></td>
                                                    </tr>
                                                    <tr>
                                                        <td width="2%">&nbsp;</td>
                                                        <td>密码：</td>
                                                        <td width="20%"><input class="text" type="text" name="sto_pwd" value="" /></td>
                                                        <td>举例:55</td>
                                                        <td width="2%">&nbsp;</td>
                                                    </tr>
                                                    <tr>
                                                        <td width="2%">&nbsp;</td>
                                                        <td>确认密码：</td>
                                                        <td width="20%"><input class="text" type="text" name="sto_pwdConfrim" value="" /></td>
                                                        <td></td>
                                                        <td width="2%">&nbsp;</td>
                                                    </tr>
                                                    
                                                    <tr>
                                                        <td width="2%">&nbsp;</td>
                                                        <td>联系电话：</td>
                                                        <td width="20%"><input class="text" type="text" name="sto_tel" value="" /></td>
                                                        <td>例：1369521243</td>
                                                        <td width="2%">&nbsp;</td>
                                                    </tr>
                                                    
                                                    <tr>
                                                        <td width="2%">&nbsp;</td>
                                                        <td>店家地址：</td>
                                                        <td width="20%"><input class="text" type="text" name="sto_address" value="" /></td>
                                                        <td></td>
                                                        <td width="2%">&nbsp;</td>
                                                    </tr>
                                                    
                                                    <tr>
                                                        <td width="2%">&nbsp;</td>
                                                        <td>店铺名：</td>
                                                        <td width="20%"><input class="text" type="text" name="sto_name" value="" /></td>
                                                        <td>格式:2000-2-15</td>
                                                        <td width="2%">&nbsp;</td>
                                                    </tr>
                                                    
                                                    <tr>
                                                        <td width="2%">&nbsp;</td>
                                                        <td>店家介绍</td>
                                                        <td width="20%"><textarea name="sto_introduction"></textarea></td>
                                                        <td>格式:2000-2-15</td>
                                                        <td width="2%">&nbsp;</td>
                                                    </tr>
                                                    <tr>
                                                        <td>&nbsp;</td>
                                                        <td colspan="3"><input class="btn" type="button" value="提交" name="submit" onclick="Submit"/></td>
                                                        <td>&nbsp;</td>
                                                    </tr>
                                                </table>
                                            </form>
                                        </td>
                                    </tr>
                                </table>
                            </td>
                            <td width="2%">&nbsp;</td>
                        </tr>
                        <!-- 添加栏目结束 -->
                        <tr>
                            <td height="40" colspan="4">
                                <table width="100%" height="1" border="0" cellpadding="0" cellspacing="0" bgcolor="#CCCCCC">
                                    <tr><td></td></tr>
                                </table>
                            </td>
                        </tr>
                        <tr>
                            <td width="2%">&nbsp;</td>
                            <td width="51%" class="left_txt"><img src="./Images/icon_phone.gif" width="17" height="14" /> 客服电话：1111-1111-1111</td>
                            <td>&nbsp;</td><td>&nbsp;</td>
                        </tr>
                    </table>
                </td>
                <td background="./Images/mail_right_bg.gif">&nbsp;</td>
            </tr>
            <!-- 底部部分 -->
            <tr>
                <td valign="bottom" background="./Images/mail_left_bg.gif">
                    <img src="./Images/buttom_left.gif" width="17" height="17" />
                </td>
                <td background="./Images/buttom_bgs.gif">
                    <img src="./Images/buttom_bgs.gif" width="17" height="17">
                </td>
                <td valign="bottom" background="./Images/mail_right_bg.gif">
                    <img src="./Images/buttom_right.gif" width="16" height="17" />
                </td>           
            </tr>
        </table>
        </form>
    </body>
</html>