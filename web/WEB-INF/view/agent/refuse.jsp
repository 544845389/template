<%@ page language="java" pageEncoding="utf-8" %>
<%@ include file="/include/taglibs.jsp" %>

<div id="addMajor">
    <div class="form-group" >
        <div>
            <input type="hidden" class="form-control" id="agentRefuseId" value="${agentId}"/>
            <textarea class="form-control" style="resize: none;height: 250px" id="refuse_reason" name="reason"></textarea>
        </div>
    </div>
</div>
