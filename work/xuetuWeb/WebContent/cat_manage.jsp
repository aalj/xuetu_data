<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Frameset//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-frameset.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" lang="zh-CN">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <link rel="stylesheet" type="text/css" href="./Style/skin.css" />
</head>
    <body>
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
                                            <form action="" method="">
                                                <table width="100%"  class="cont tr_color">
                                                
                                                    <tr>
                                                        <th>ID</th>
                                                        <th>优惠券名称</th>
                                                        <th>折扣</th>
                                                        <th>剩余数量</th>
                                                        <th>到期时间</th>
                                                        <th>描述</th>
                                                    </tr>
                                                    <c:set var="index" value="0" />
                                                   <c:forEach var='type' items='${listCoupon}'>
                                                   <c:set var="index" value="${index+1}" />
                                                    <tr align="center" class="d">
                                                        <td>${index}</td>
                                                        
														
                                                        <td><a href="#"><c:out value="${type.couName }"></c:out>   </a><p hidden="hidden"><c:out value="${type.couID }"></c:out></p></td>
                                                        <td><c:out value="${type.couPrice }"></c:out></td>
                                                        <td><c:out value="${type.conNum }"></c:out></td>
                                                        <td><c:out value="${type.conValidity }"></c:out></td>
                                                        <td><a href="/xuetuWeb/ShowCouponServlet?strID=${type.couID}">查看
                                                        </a>&nbsp;&nbsp;<a href="/xuetuWeb/EditCouponManagerServlet?strID=${type.couID}&flags=1">编辑
                                                        </a>&nbsp;&nbsp;<a href="/xuetuWeb/DeleteCouponServlet?strID=${type.couID}">删除</a></td>
                                                    </tr>
												</c:forEach>
                                                    <tr align="center" class="d">
                                                        <td>1</td>
                                                        <td><a href="#">我爱我家</a></td>
                                                        <td>5</td>
                                                        <td>11</td>
                                                        <td>2222-12-22</td>
                                                        <td><a href="./index.jsp" target="">查看</a>&nbsp;&nbsp;<a href="#">编辑</a>&nbsp;&nbsp;<a href="#">删除</a> </td>
                                                    </tr><!--                                                     <tr align="center" class="d"> -->
<!--                                                         <td>3</td> -->
<!--                                                         <td>我爱我家</td> -->
<!--                                                         <td>5</td> -->
<!--                                                         <td>23</td> -->
<!--                                                         <td>顶部底部</td> -->
<!--                                                         <td>编辑 删除 </td> -->
<!--                                                     </tr> -->
<!--                                                     <tr align="center" class="d"> -->
<!--                                                         <td>4</td> -->
<!--                                                         <td>我爱我家</td> -->
<!--                                                         <td>5</td> -->
<!--                                                         <td>23</td> -->
<!--                                                         <td>顶部底部</td> -->
<!--                                                         <td>编辑 删除</td> -->
<!--                                                     </tr> -->
<!--                                                     <tr align="center" class="d"> -->
<!--                                                         <td>5</td> -->
<!--                                                         <td>我爱我家</td> -->
<!--                                                         <td>5</td> -->
<!--                                                         <td>32</td> -->
<!--                                                         <td>顶部底部</td> -->
<!--                                                         <td>编辑 删除 </td> -->
<!--                                                     </tr> -->
<!--                                                     <tr align="center" class="d"> -->
<!--                                                         <td>6</td> -->
<!--                                                         <td>我爱我家</td> -->
<!--                                                         <td>5</td> -->
<!--                                                         <td>44</td> -->
<!--                                                         <td>顶部底部</td> -->
<!--                                                         <td>编辑 删除 </td> -->
<!--                                                     </tr> -->
<!--                                                     <tr align="center" class="d"> -->
<!--                                                         <td>7</td> -->
<!--                                                         <td>我爱我家</td> -->
<!--                                                         <td>5</td> -->
<!--                                                         <td>55</td> -->
<!--                                                         <td>顶部底部</td> -->
<!--                                                         <td>编辑 删除 </td> -->
<!--                                                     </tr> -->
<!--                                                     <tr align="center" class="d"> -->
<!--                                                         <td>8</td> -->
<!--                                                         <td>我爱我家</td> -->
<!--                                                         <td>5</td> -->
<!--                                                         <td>11</td> -->
<!--                                                         <td>顶部底部</td> -->
<!--                                                         <td>编辑 删除 </td> -->
<!--                                                     </tr> -->
<!--                                                     <tr align="center" class="d"> -->
<!--                                                         <td>9</td> -->
<!--                                                         <td>我爱我家</td> -->
<!--                                                         <td>5</td> -->
<!--                                                         <td>21</td> -->
<!--                                                         <td>顶部底部</td> -->
<!--                                                         <td>编辑 删除 </td> -->
<!--                                                     </tr> -->
                                                </table>
                                                <table width='100%' class="tex004">
			<tr>
				<td align="center"><a href='#'
					onClick='pageQuery(1)'><span>首页</span></a> <a
					href='#'><span>下一页</span></a>
					<a href='#'
					onClick="pageQuery(4)">尾页</a></td>
				<td align='center'>第${num}条&nbsp;&nbsp;共${pageNum }页&nbsp;&nbsp;第${page}页</td>
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
    </body>
</html>