<%@page import="com.baichang.framework.Constant"%>
<%@page import="java.io.OutputStream"%>
<%@page import="org.patchca.utils.encoder.EncoderHelper"%>
<%@page import="org.patchca.filter.predefined.CurvesRippleFilterFactory"%>
<%@page import="java.awt.Color"%>
<%@page import="org.patchca.color.SingleColorFactory"%>
<%@page import="org.patchca.service.ConfigurableCaptchaService"%>
<%@ page import="org.patchca.word.RandomWordFactory" %>
<%@ page language="java" pageEncoding="utf-8"%>
<%
	ConfigurableCaptchaService cs = new ConfigurableCaptchaService();

	// 验证码长度
	RandomWordFactory wf = new RandomWordFactory();
	wf.setMaxLength(4);
	wf.setMinLength(4);
	wf.setCharacters("1234567890");
	cs.setWordFactory(wf);



	cs.setColorFactory(new SingleColorFactory(new Color(25, 60, 170)));
	//cs.setFilterFactory(new DiffuseRippleFilterFactory());
	cs.setFilterFactory(new CurvesRippleFilterFactory(cs.getColorFactory()));
	response.setContentType("image/png");
	OutputStream outputStream = response.getOutputStream();
	String res = EncoderHelper.getChallangeAndWriteImage(cs, "png",
			outputStream);
	//System.out.println(res);
	//session.setAttribute(Constant.SESSION_CODE_KEY,"123456");
	session.setAttribute( Constant.SESSION_CODE_KEY, res );
	out.clearBuffer();
	out = pageContext.pushBody();
%>