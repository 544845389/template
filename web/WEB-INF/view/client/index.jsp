<%@ page language="java" pageEncoding="utf-8" %>
<%@ include file="/include/taglibs.jsp" %>
<%@ taglib prefix="s" uri="http://www.springframework.org/security/tags"%>


<script src="${path}/static/houseswill/client/index.js"></script>


<div>

    <div class="form-inline" role="form" id="toolbar">
        <s:authorize ifAllGranted="CLIENT_CITY">
        城市名称:
        <select id="city_select" class="form-control" style="width: 120px">
        </select>
        &nbsp;
        状态名称:
        <select id="client_state" class="form-control" style="width: 120px">
            <option selected value="-1">不限</option>
            <option value="0">未报备</option>
            <option value="1">已报备</option>
            <option value="2">已确认</option>
            <option value="3">已带看</option>
            <option value="4">已认购</option>
            <option value="5">已成交</option>
            <option value="6">已结佣</option>
            <option value="7">交易结束</option>
        </select>
        &nbsp;
        <button type="button" class="btn btn-inverse" id="select_city_state">
            查询
        </button>
        </s:authorize>
        <s:authorize ifAllGranted="CLIENT_STATE">
        状态名称:
        <select id="client_state" class="form-control" style="width: 120px" onchange="changClientState()">
            <option selected value="-1">不限</option>
            <option value="0">未报备</option>
            <option value="1">已报备</option>
            <option value="2">已确认</option>
            <option value="3">已带看</option>
            <option value="4">已认购</option>
            <option value="5">已成交</option>
            <option value="6">已结佣</option>
            <option value="7">交易结束</option>
        </select>
        </s:authorize>
    </div>

    <table id="table"
           data-toggle="table"
           data-toolbar="#toolbar"
           data-url="${path}/web/client/loadAllClients"
           data-height="750"
           data-side-pagination="server"
           data-pagination="true"
           data-page-list="[5, 10, 20, 50, 100, 200]"
           data-search="true" data-show-refresh="true" data-show-toggle="true"
           data-show-columns="true">
        <thead>
        <tr>
            <th data-field="clientName"  data-width="100px">姓名</th>
            <th data-field="clientPhone"  data-width="100px">手机号</th>
            <th data-field="propertyName" data-formatter="propertyNameFormatter" data-width="100px">意向楼盘</th>
            <th data-field="cityName" data-width="100px">所在城市</th>
            <th data-field="manager" data-formatter="managerFormatter"  data-width="100px">所属服务经理</th>
            <th data-field="states" data-formatter="stateFormatter" data-width="100px" >状态</th>
            <th data-formatter="operateFormatter" data-events="operateEvents" data-width="100px">操作</th>
        </tr>
        </thead>
    </table>
</div>



<%--客户详情--%>
<div id="client_details_div" class="slidingmenu box-model box box-info" >
    <div class="box-header">
        <h3 class="box-title">客户详情</h3>
    </div>
    <div class="box-body">
        <form role="form" id="clientDetailsForm" action="" method="post">
            <input type="hidden" id="client_id" class="form-control"  name="id"  />
            <div class="col-md-6">
                <div>
                    <label>客户姓名:</label>
                    <input type="text" class="form-control"  name="clientName" readonly  />
                </div>
            </div>
            <div class="col-md-6">
                <div>
                    <label>性别:</label>
                    <input type="text" class="form-control"  id="sex" name="sex" readonly />
                </div>
            </div>
            <div class="col-md-12" style="visibility: hidden">
                <label></label>
            </div>
            <div class="col-md-6">
                <div>
                    <label>手机:</label>
                    <input type="text" class="form-control"  name="clientPhone" readonly  />
                </div>
            </div>
            <div class="col-md-6">
                <div>
                    <label>意向强度:</label>
                    <input type="text" class="form-control" id="intention"  name="intention" readonly />
                </div>
            </div>
            <div class="col-md-12" style="visibility: hidden">
                <label></label>
            </div>
            <div class="col-md-6">
                <div>
                    <label>意向户型:</label>
                    <input type="text" class="form-control" id="intentionHouseType" name="intentionHouseType"  readonly />
                </div>
            </div>
            <div class="col-md-6">
                <div>
                    <label>意向价格范围:</label>
                    <select  class="form-control" id="client_intention_price" disabled  >
                    </select>
                </div>
            </div>
            <div class="col-md-12" style="visibility: hidden">
                <label></label>
            </div>
            <div class="col-md-6">
                <div>
                    <label>意向面积:</label>
                    <input type="text" class="form-control" id="intentionArea"  name="intentionArea" readonly  />
                </div>
            </div>
            <div class="col-md-6">
                <div>
                    <label>城市名称:</label>
                    <select  class="form-control" id="client_cities" disabled  >
                    </select>
                </div>
            </div>
            <div class="col-md-12" style="visibility: hidden">
                <label ></label>
            </div>
            <div class="col-md-6">
                <div>
                    <label>关注商圈:</label>
                    <input type="text" class="form-control" id="districtId"   readonly />
                </div>
            </div>
            <div class="col-md-6">
                <div>
                    <label>备注:</label>
                    <input type="text" class="form-control" name="remarks" readonly />
                </div>
            </div>
            <div class="col-md-12" style="visibility: hidden">
                <label></label>
            </div>
            <div class="col-md-6">
                <div>
                    <label>客户当前状态:</label>
                    <input type="text" class="form-control" id="states" name="states" readonly />
                </div>
            </div>
            <div class="col-md-6" style="visibility: hidden">
                <div>
                    <label>隐藏</label>
                    <input type="text" class="form-control" name="states" readonly />
                </div>
            </div>
            <div class="col-md-12" style="visibility: hidden">
                <label></label>
            </div>
            <div class="col-md-6">
                <div>
                    <input type="hidden" id="states_buy_picture" class="form-control" />
                    <label>认购图片(单击查看放大图):</label>
                    <div>
                        <img id="statesBuy"  alt="User Image" width="100" height="100"/>
                    </div>
                </div>
            </div>
            <div class="col-md-6">
                <div>
                    <input type="hidden" id="states_deal_picture" class="form-control" />
                    <label>成交图片(单击查看放大图):</label>
                    <div>
                        <img id="statesDeal"  alt="User Image" width="100" height="100"/>
                    </div>
                </div>
            </div>
        </form>
    </div>
    <div class="box-footer">
       <%-- <button class="btn btn-info" data-event="submit_modify_property">保存</button>
        &nbsp;--%>
        <button class="btn btn-inverse close-model">关闭</button>
    </div>
</div>



<%--客户结佣--%>
<div id="client_settle_div" class="slidingmenu box-model box box-info" >
    <div class="box-header">
        <h3 class="box-title">结佣列表</h3>
    </div>
    <div class="box-body">
        <form role="form" id="client_settle_form" action="/web/client/settleAccounts" method="post">
            <input type="hidden" class="form-control"  name="agentId"  />
            <input type="hidden" class="form-control"  name="serviceManagerId"  />
            <input type="hidden" class="form-control"  name="clientId"  />
            <div class="form-group">
                <label >结佣金额:</label>
                <input type="text" class="form-control" id="settlement"  name="settlementMoney" placeholder="请输入结佣金额(限非零整数)" />
            </div>
        </form>
    </div>
    <div class="box-footer">
         <button class="btn btn-success" data-event="submit_settle_accounts">保存</button>
         &nbsp;
        <button class="btn btn-inverse close-model">关闭</button>
    </div>
</div>
