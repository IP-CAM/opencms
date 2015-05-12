<?php echo $header; ?>
<div id="content" class="container">
  <ul class="breadcrumb">
    <?php foreach ($breadcrumbs as $breadcrumb) { ?>
    <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
    <?php } ?>
  </ul>
  <div class="panel panel-default">
    <div class="panel-heading">
      <div class="pull-right">
        <button type="submit" form="form-information" class="btn btn-primary "><i class="fa fa-check"></i> <?php echo $button_save; ?></button>
        <a href="<?php echo $cancel; ?>" class="btn btn-danger "><i class="fa fa-times"></i> <?php echo $button_cancel; ?></a></div>
      <h1 class="panel-title"><i class="fa fa-edit"></i> <?php echo $heading_title; ?></h1>
    </div>
    <div class="panel-body">
      <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form-information" class="form-horizontal">
        <input type="hidden" name="bottom" value="0" />
        <ul class="nav nav-tabs">
          <li class="active"><a href="#tab-general" data-toggle="tab"><?php echo $tab_general; ?></a></li>
          <li><a href="#tab-seo" data-toggle="tab">SEO</a></li>
          <li><a href="#tab-design" data-toggle="tab"><?php echo $tab_design; ?></a></li>
        </ul>
        <div class="tab-content">
          <div class="tab-pane active" id="tab-general">
            <ul class="nav nav-tabs" id="language">
              <?php foreach ($languages as $language) { ?>
              <li><a href="#language<?php echo $language['language_id']; ?>" data-toggle="tab"><img src="view/image/flags/<?php echo $language['image']; ?>" title="<?php echo $language['name']; ?>" /> <?php echo $language['name']; ?></a></li>
              <?php } ?>
            </ul>
            <div class="tab-content">
              <?php foreach ($languages as $language) { ?>
              <div class="tab-pane" id="language<?php echo $language['language_id']; ?>">
                <div class="form-group required">
                  <label class="col-xs-2 control-label" for="input-title<?php echo $language['language_id']; ?>"><?php echo $entry_title; ?></label>
                  <div class="col-xs-10">
                    <input type="text" name="information_description[<?php echo $language['language_id']; ?>][title]" value="<?php echo isset($information_description[$language['language_id']]) ? $information_description[$language['language_id']]['title'] : ''; ?>" id="input-title<?php echo $language['language_id']; ?>" class="form-control" />
                  </div>
                </div>
                
                <div class="form-group required">
                  <label class="col-xs-2 control-label lang<?php echo $language['language_id']; ?>" for="input-description"><?php echo $entry_description; ?></label>
                  <div class="col-xs-10 input-description<?php echo $language['language_id']; ?>">
                    <textarea name="information_description[<?php echo $language['language_id']; ?>][description]" id="input-description<?php echo $language['language_id']; ?>" class="form-control"><?php echo isset($information_description[$language['language_id']]) ? $information_description[$language['language_id']]['description'] : 'Разедл находится на разработке :('; ?></textarea>
                  </div>
                </div>
    
              </div>
              <?php } ?>
            </div>

            <div class="form-group">
              <label class="col-xs-2 control-label" for="input-status"><?php echo $entry_status; ?></label>
              <div class="col-xs-10">

                <div class="btn-group" data-toggle="buttons">
                    <label for="input-status1" class="btn btn-success<?php if ($status == 1) { ?> active<?php } ?>">
                            <i class="fa fa-check"></i> <input type="radio" name="status" id="input-status1" value="1" <?php if ($status == 1) { ?>checked<?php } ?>> <?php echo $text_enabled; ?>
                    </label>
                    <label for="input-status2" class="btn btn-danger<?php if ($status == 0) { ?> active<?php } ?>">
                            <i class="fa fa-times"></i> <input type="radio" name="status" id="input-status2" value="0" <?php if ($status == 0) { ?>checked<?php } ?>> <?php echo $text_disabled; ?>
                    </label>
                </div>
              </div>
            </div>
            <div class="form-group">
              <label class="col-xs-2 control-label" for="input-sort-order"><?php echo $entry_sort_order; ?></label>
              <div class="col-xs-10">
                <input type="text" name="sort_order" value="<?php echo $sort_order; ?>" id="input-sort-order" class="form-control" />
              </div>
            </div>
            <div class="form-group">
              <label class="col-xs-2 control-label"><?php echo $entry_store; ?></label>
              <div class="col-xs-10">
                <div class="checkbox">
                  <label>
                    <?php if (in_array(0, $information_store)) { ?>
                    <input type="checkbox" name="information_store[]" value="0" checked="checked" />
                    <?php echo $text_default; ?>
                    <?php } else { ?>
                    <input type="checkbox" name="information_store[]" value="0" />
                    <?php echo $text_default; ?>
                    <?php } ?>
                  </label>
                </div>
                <?php foreach ($stores as $store) { ?>
                <div class="checkbox">
                  <label>
                    <?php if (in_array($store['store_id'], $information_store)) { ?>
                    <input type="checkbox" name="information_store[]" value="<?php echo $store['store_id']; ?>" checked="checked" />
                    <?php echo $store['name']; ?>
                    <?php } else { ?>
                    <input type="checkbox" name="information_store[]" value="<?php echo $store['store_id']; ?>" />
                    <?php echo $store['name']; ?>
                    <?php } ?>
                  </label>
                </div>
                <?php } ?>
              </div>
            </div>
          </div>
          
          
          <div class="tab-pane" id="tab-seo">
          <div class="tab-content">
            <ul class="nav nav-tabs" id="languageSEO">
              <?php foreach ($languages as $language) { ?>
              <li><a href="#languageSEO<?php echo $language['language_id']; ?>" data-toggle="tab"><img src="view/image/flags/<?php echo $language['image']; ?>" title="<?php echo $language['name']; ?>" /> <?php echo $language['name']; ?></a></li>
              <?php } ?>
            </ul>
            <div class="tab-content">
            <?php foreach ($languages as $language) { ?>
              <div class="tab-pane" id="languageSEO<?php echo $language['language_id']; ?>">
              <div class="form-group">
                  <label class="col-xs-2 control-label" for="input-custom-title<?php echo $language['language_id']; ?>"><?php echo $entry_custom_title; ?></label>
                  <div class="col-xs-10">
                    <input type="text" name="information_description[<?php echo $language['language_id']; ?>][custom_title]" size="100" value="<?php echo isset($information_description[$language['language_id']]) ? $information_description[$language['language_id']]['custom_title'] : ''; ?>"  id="input-custom-title<?php echo $language['language_id']; ?>" class="form-control" />
                  </div>
                </div>
                <div class="form-group">
                  <label class="col-xs-2 control-label" for="input-meta-description">Meta Tag Description:</label>
                  <div class="col-xs-10">
                    <textarea name="information_description[<?php echo $language['language_id']; ?>][meta_description]" cols="40" rows="5" id="input-meta-description<?php echo $language['language_id']; ?>" class="form-control"><?php echo isset($information_description[$language['language_id']]) ? $information_description[$language['language_id']]['meta_description'] : ''; ?></textarea>
                  </div>
                </div>
                <div class="form-group">
                  <label class="col-xs-2 control-label" for="input-meta-keywords">Meta Tag Keyword:</label>
                  <div class="col-xs-10">
                    <textarea name="information_description[<?php echo $language['language_id']; ?>][meta_keyword]" cols="40" rows="5" id="input-meta-keywords<?php echo $language['language_id']; ?>" class="form-control"><?php echo isset($information_description[$language['language_id']]) ? $information_description[$language['language_id']]['meta_keyword'] : ''; ?></textarea>
                  </div>
                </div>
                            <div class="form-group">
              <label class="col-xs-2 control-label" for="input-keyword"><?php echo $entry_keyword; ?></label>
              <div class="col-xs-10">
                
                <input  id="input-keyword<?php print $language['language_id']; ?>" data-role="tagsinput" class="width-50 form-control" type="text" name="keyword[<?php echo $language['language_id']; ?>]" value="<?php if (isset($keyword[$language['language_id']])) { echo $keyword[$language['language_id']]; } ?>" />
                
                 </div>
            </div>
            </div>
            <?php } ?>
			</div>
          </div>
          </div>
          
          
          <div class="tab-pane" id="tab-design">
            <div class="table-responsive">
              <table class="table table-striped table-bordered table-hover">
                <thead>
                  <tr>
                    <td class="text-left"><?php echo $entry_store; ?></td>
                    <td class="text-left"><?php echo $entry_layout; ?></td>
                  </tr>
                </thead>
                <tbody>
                  <tr>
                    <td class="text-left"><?php echo $text_default; ?></td>
                    <td class="text-left"><select name="information_layout[0][layout_id]" class="form-control">
                        <option value=""></option>
                        <?php foreach ($layouts as $layout) { ?>
                        <?php if (isset($information_layout[0]) && $information_layout[0] == $layout['layout_id']) { ?>
                        <option value="<?php echo $layout['layout_id']; ?>" selected="selected"><?php echo $layout['name']; ?></option>
                        <?php } else { ?>
                        <option value="<?php echo $layout['layout_id']; ?>"><?php echo $layout['name']; ?></option>
                        <?php } ?>
                        <?php } ?>
                      </select></td>
                  </tr>
                  <?php foreach ($stores as $store) { ?>
                  <tr>
                    <td class="text-left"><?php echo $store['name']; ?></td>
                    <td class="text-left"><select name="information_layout[<?php echo $store['store_id']; ?>][layout_id]" class="form-control">
                        <option value=""></option>
                        <?php foreach ($layouts as $layout) { ?>
                        <?php if (isset($information_layout[$store['store_id']]) && $information_layout[$store['store_id']] == $layout['layout_id']) { ?>
                        <option value="<?php echo $layout['layout_id']; ?>" selected="selected"><?php echo $layout['name']; ?></option>
                        <?php } else { ?>
                        <option value="<?php echo $layout['layout_id']; ?>"><?php echo $layout['name']; ?></option>
                        <?php } ?>
                        <?php } ?>
                      </select></td>
                  </tr>
                  <?php } ?>
                </tbody>
              </table>
            </div>
          </div>
        </div>
      </form>
    </div>
  </div>
</div>
<link rel="stylesheet" href="view/javascript/bootstrap-tagsinput/bootstrap-tagsinput.css">
<script src="view/javascript/bootstrap-tagsinput/bootstrap-tagsinput.min.js"></script>


<script type="text/javascript" src="view/javascript/ckeditor/ckeditor.js"></script> 
<script type="text/javascript"><!--
<?php foreach ($languages as $language) { ?>
CKEDITOR.replace('input-description<?php echo $language['language_id']; ?>', {
	filebrowserBrowseUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>',
	filebrowserImageBrowseUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>',
	filebrowserFlashBrowseUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>',
	filebrowserUploadUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>',
	filebrowserImageUploadUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>',
	filebrowserFlashUploadUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>'
});
<?php } ?>
//--></script> 
<script type="text/javascript"><!--
$("input#input-keyword").val();
$('#languageSEO a:first').tab('show');
$('#language a:first').tab('show');
//--></script> 
<script type="text/javascript">
var isCtrl = false;
$(document).keyup(function (e) {
 if(e.which == 17) isCtrl=false;
}).keydown(function (e) {
    if(e.which == 17) isCtrl=true;
    if(e.which == 83 && isCtrl == true) {
        $('#content > div > div.panel-heading > div > button').trigger('click');
    return false;
 }
});
</script>
<script type="text/javascript">
	var opts = {
    	title: 'Проверьте форму',
    	type: 'error',
		styling: 'bootstrap3',
       	addclass: 'oc_noty',
        icon: 'picon picon-32 picon-fill-color',
        opacity: .8,
        nonblock: {
        	nonblock: true
        }
	};
	<?php foreach ($languages as $language) { ?>
		/*** Проверка на название статьи (RUS/ENG) ***/
		<?php if (isset($error_title[$language['language_id']])) { ?>
			$(function () {
				$('#input-title<?php echo $language['language_id']; ?>').css('border-color', '#F00');
				opts.text = '<?php echo $error_title[$language['language_id']]; ?> (Язык формы: <?php echo $language['name']; ?>)'
			    new PNotify(opts);
			});
		<?php } ?>
		/*** Проверка на описание статьи (RUS/ENG) ***/
		/*<?php if (isset($error_description[$language['language_id']])) { ?>
			$(function () {
				$('.lang<?php echo $language['language_id']; ?>').css({textDecoration: 'underline'});
		    	opts.text = '<?php echo $error_description[$language['language_id']]; ?>  (Язык формы: <?php echo $language['name']; ?>)';
		        new PNotify(opts);
			});
		<?php } ?>
		*/
	<?php } ?>
</script>
<?php echo $footer; ?>