{*
Testlink Open Source Project - http://testlink.sourceforge.net/

title bar + menu

@filesource navBar.tpl
@internal revisions
@since 1.9.7

*}
{lang_get var="labels"
          s="title_events,event_viewer,home,testproject,title_specification,title_execute,
             title_edit_personal_data,th_tcid,link_logout,title_admin,
             search_testcase,title_results,title_user_mgmt"}
{assign var="cfg_section" value=$smarty.template|replace:".tpl":""}
{config_load file="input_dimensions.conf" section=$cfg_section}

{include file="inc_head.tpl" openHead="yes"}

<link rel="stylesheet" type="text/css" href="{$basehref}gui/themes/default/css/bootstrap.min.css">
<style type="text/css">
  body {
    background: #c62828;
    color:      #FFF;
  }
</style>

</head>
<body style="min-width: 800px;">

<div class="container-fluid navbar-kmm">
    <div class="col-sm-3">
        <a href="index.php" target="_parent">
            <img alt="KMM Engenharia de Sistemas" title="KMM Engenharia de Sistemas" src="{$smarty.const.TL_THEME_IMG_DIR}{$tlCfg->logo_navbar}" />
        </a>      
    </div>
    <div class="col-sm-9">

        <div class="col-sm-9">
            <div class="menu_bar">
                {$session.testprojectTopMenu}
                {if $gui->TestProjects != ""}
                <div style="display: inline;">
                    <form style="display:inline" name="productForm" action="lib/general/navBar.php" method="get">
                        {$labels.testproject}
                        <select style="font-size: 80%;position:relative; top:-1px; color: #333" name="testproject" onchange="this.form.submit();">
                          {foreach key=tproject_id item=tproject_name from=$gui->TestProjects}
                          <option value="{$tproject_id}" title="{$tproject_name|escape}"
                          {if $tproject_id == $gui->tprojectID} selected="selected" {/if}>
                          {$tproject_name|truncate:#TESTPROJECT_TRUNCATE_SIZE#|escape}</option>
                          {/foreach}
                        </select>
                    </form>
                </div>
                {/if}
            </div>
        </div>
        <div class="col-sm-3">
            <span><i class="glyphicon glyphicon-user"></i>{$gui->whoami|escape}</span>
            <span>&nbsp;&nbsp;&nbsp;<a href='lib/usermanagement/userInfo.php' target="mainframe" accesskey="i"
              tabindex="6"><img src="{$tlImages.account}" title="{$labels.title_edit_personal_data}"></a>
              <a href="logout.php" target="_parent" accesskey="q">
                <img src="{$tlImages.logout}" title="{$labels.link_logout}"></a>
            </span>
        </div>
       
        {if $gui->updateMainPage == 1}
          <script type="text/javascript">
          parent.mainframe.location = "{$basehref}lib/general/mainPage.php";
          </script>
        {/if} 
    </div>
</body>
</html>