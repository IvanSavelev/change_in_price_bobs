<?php echo $header; ?><?php echo $column_left; ?>
<div id="content">
<div class="page-header">
	<div class="container-fluid">
		<div class="pull-right">
			<button type="submit" form="form-product" formaction="<?php echo $action; ?>" data-toggle="tooltip" title="<?php echo $button_save; ?>" class="btn btn-primary"><i class="fa fa-save"></i></button>
			<a href="<?php echo $cancel; ?>" data-toggle="tooltip" title="<?php echo $button_cancel; ?>" class="btn btn-default"><i class="fa fa-reply"></i></a>
		</div>
		<h1><?php echo $heading_title; ?></h1>
		<ul class="breadcrumb">
			<?php foreach ($breadcrumbs as $breadcrumb) { ?>
			<li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
			<?php } ?>
		</ul>
	</div>
</div>
<div class="container-fluid">
	<?php if ($success) { ?>
	<div class="alert alert-success"><i class="fa fa-check-circle"></i> <?php echo $success; ?>
		<button type="button" class="close" data-dismiss="alert">&times;</button>
	</div>
	<?php } ?>
	<?php if ($attentions) { ?>
	<div class="alert alert-attentions"><i class="fa fa-exclamation-circle"></i> <?php echo $attentions; ?>
		<button type="button" class="close" data-dismiss="alert">&times;</button>
	</div>
	<?php } ?>

	<div class="panel panel-default">
		<div class="panel-heading">
			<h3 class="panel-title"><i class="fa fa-list"></i> <?php echo $text_list; ?></h3>
		</div>
		<div class="panel-body">
			<div class="well">
				<div class="row">
					<div class="col-sm-4">
						<div class="form-group">
							<label class="control-label" for="input-name"><?php echo $entry_name; ?></label>
							<input type="text" name="filter_name" value="<?php echo $filter_name; ?>" placeholder="<?php echo $entry_name; ?>" id="input-name" class="form-control" />
						</div>
						<div class="form-group">
							<label class="control-label" for="input-model"><?php echo $entry_model; ?></label>
							<input type="text" name="filter_model" value="<?php echo $filter_model; ?>" placeholder="<?php echo $entry_model; ?>" id="input-model" class="form-control" />
						</div>
						<div class="form-group">
							<label class="control-label" for="input-category"><?php echo $column_category; ?></label>
							<select name="filter_category" id="input-category" class="form-control">
								<option value="*"></option>
								<?php foreach ($categories as $category) { ?>
								<?php if ($category['product_count'] >= 1) { ?>
								<?php if ($category['category_id']==$filter_category) { ?>
								<option value="<?php echo $category['category_id']; ?>" selected="selected"><?php echo $category['name']; ?>&nbsp;&nbsp;&nbsp;&nbsp;</option>
								<?php } else { ?>
								<option value="<?php echo $category['category_id']; ?>">&nbsp;&nbsp;<?php echo $category['name']; ?>&nbsp;&nbsp;&nbsp;&nbsp;</option>
								<?php } ?>
								<?php } ?>
								<?php } ?>
							</select>
						</div>
					</div>
					<div class="col-sm-4">
						<div class="form-group">
							<label class="control-label" for="input-price"><?php echo $entry_price; ?></label>
							<input type="text" name="filter_price" value="<?php echo $filter_price; ?>" placeholder="<?php echo $entry_price; ?>" id="input-price" class="form-control" />
						</div>
						<div class="form-group">
							<label class="control-label" for="input-quantity"><?php echo $entry_quantity; ?></label>
							<input type="text" name="filter_quantity" value="<?php echo $filter_quantity; ?>" placeholder="<?php echo $entry_quantity; ?>" id="input-quantity" class="form-control" />
						</div>
					</div>
					<div class="col-sm-4">
						<div class="form-group">
							<label class="control-label" for="input-status"><?php echo $entry_status; ?></label>
							<select name="filter_status" id="input-status" class="form-control">
								<option value="*"></option>
								<?php if ($filter_status) { ?>
								<option value="1" selected="selected"><?php echo $text_enabled; ?></option>
								<?php } else { ?>
								<option value="1"><?php echo $text_enabled; ?></option>
								<?php } ?>
								<?php if (!$filter_status && !is_null($filter_status)) { ?>
								<option value="0" selected="selected"><?php echo $text_disabled; ?></option>
								<?php } else { ?>
								<option value="0"><?php echo $text_disabled; ?></option>
								<?php } ?>
							</select>
						</div>
						<div class="form-group">
							<label class="control-label" for="input-image"><?php echo $entry_image; ?></label>
							<select name="filter_image" id="input-image" class="form-control">
								<option value="*"></option>
								<?php if ($filter_image) { ?>
								<option value="1" selected="selected"><?php echo $text_enabled; ?></option>
								<?php } else { ?>
								<option value="1"><?php echo $text_enabled; ?></option>
								<?php } ?>
								<?php if (!$filter_image && !is_null($filter_image)) { ?>
								<option value="0" selected="selected"><?php echo $text_disabled; ?></option>
								<?php } else { ?>
								<option value="0"><?php echo $text_disabled; ?></option>
								<?php } ?>
							</select>
						</div>
						<button type="button" id="button-filter" class="btn btn-primary pull-right"><i class="fa fa-filter"></i> <?php echo $button_filter; ?></button>
					</div>
				</div>
			</div>

			<div class="well">
				<div class="row form-group">
					<div class="col-sm-8">
						<input type="text" name="base_price_factor" value="<?php echo $base_price_factor; ?>" placeholder="<?php echo $help_base_price_factor; ?>" id="input-price" class="form-control" />
					</div>
					<div class="col-sm-1">
						<button name="base_price_factor_button" data-toggle="tooltip" title="<?php echo $help_base_price_factor_button; ?>" class="btn btn-primary"><i class="fa fa-hand-o-up"></i></button>
					</div>
					<div class="col-sm-3">
						<span><?php echo $help_base_price_factor; ?></span>
					</div>
				</div>
			</div>

			<form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form-product">

				<input id="filter_name_old" type="hidden" name="filter_name_old" value="<?php echo $filter_name ?>">
				<input id="filter_model_old" type="hidden" name="filter_model_old" value="<?php echo $filter_model ?>">
				<input id="filter_price_old" type="hidden" name="filter_price_old" value="<?php echo $filter_price ?>">
				<input id="filter_quantity_old" type="hidden" name="filter_quantity_old" value="<?php echo $filter_quantity ?>">
				<input id="filter_category_old" type="hidden" name="filter_category_old" value="<?php echo $filter_category ?>">
				<input id="filter_status_old" type="hidden" name="filter_status_old" value="<?php echo $filter_status ?>">
				<input id="filter_image_old" type="hidden" name="filter_image_old" value="<?php echo $filter_image ?>">


				<div class="table-responsive">
					<table class="table table-bordered table-hover">
						<thead>
						<tr>
							<td class="text-center"><?php echo $column_image; ?></td>
							<td class="text-left"><?php if ($sort == 'pd.name') { ?>
								<a href="<?php echo $sort_name; ?>" class="<?php echo strtolower($order); ?>"><?php echo $column_name; ?></a>
								<?php } else { ?>
								<a href="<?php echo $sort_name; ?>"><?php echo $column_name; ?></a>
								<?php } ?></td>
							<td class="text-left"><?php if ($sort == 'p.model') { ?>
								<a href="<?php echo $sort_model; ?>" class="<?php echo strtolower($order); ?>"><?php echo $column_model; ?></a>
								<?php } else { ?>
								<a href="<?php echo $sort_model; ?>"><?php echo $column_model; ?></a>
								<?php } ?></td>
							<td class="text-right"><?php if ($sort == 'p.price') { ?>
								<a href="<?php echo $sort_price; ?>" class="<?php echo strtolower($order); ?>"><?php echo $column_price; ?></a>
								<?php } else { ?>
								<a href="<?php echo $sort_price; ?>"><?php echo $column_price; ?></a>
								<?php } ?></td>
							<td class="text-left"><?php echo $column_category; ?></td>
							<td class="text-left"><?php echo $column_options; ?></td>
							<td class="text-right column_quantity"><?php if ($sort == 'p.quantity') { ?>
								<a href="<?php echo $sort_quantity; ?>" class="<?php echo strtolower($order); ?>"><?php echo $column_quantity; ?></a>
								<?php } else { ?>
								<a href="<?php echo $sort_quantity; ?>"><?php echo $column_quantity; ?></a>
								<?php } ?></td>
							<td class="text-left column_status"><?php if ($sort == 'p.status') { ?>
								<a href="<?php echo $sort_status; ?>" class="<?php echo strtolower($order); ?>"><?php echo $column_status; ?></a>
								<?php } else { ?>
								<a href="<?php echo $sort_status; ?>"><?php echo $column_status; ?></a>
								<?php } ?></td>
							<td class="text-right"><?php echo $column_action; ?></td>
						</tr>
						</thead>
						<tbody>
						<?php if ($products) { ?>
						<?php foreach ($products as $product) { ?>
						<tr>
							<td class="text-center"><?php if ($product['image']) { ?>
								<img src="<?php echo $product['image']; ?>" alt="<?php echo $product['name']; ?>" class="img-thumbnail" />
								<?php } else { ?>
								<span class="img-thumbnail list"><i class="fa fa-camera fa-2x"></i></span>
								<?php } ?></td>
							<td class="text-left"><?php echo $product['name']; ?></td>
							<td class="text-left"><?php echo $product['model']; ?></td>



							<td class="text-right"><?php if ($product['special']) { ?>
									<span><input type="text" name="price_<?php echo $product['product_id'] ?>" value="<?php echo $product['price']; ?>" placeholder="<?php echo $entry_price; ?>" id="input-price" class="form-control" /></span><br/>
									<div class="text-danger"><?php echo $product['special']; ?></div>
									<span><?php echo $old_product_text; ?></span>
									<span style="text-decoration: line-through;" name="old_price_<?php echo $product['product_id'] ?>"><?php echo $product['price']; ?></span>
								<?php } else { ?>
									<input type="text" name="price_<?php echo $product['product_id'] ?>" value="<?php echo $product['price']; ?>" placeholder="<?php echo $entry_price; ?>" id="input-price" class="form-control" />
									<span><?php echo $old_product_text; ?></span>
									<span name="old_price_<?php echo $product['product_id'] ?>"><?php echo $product['price']; ?></span>
								<?php } ?>
								</td>

							<td class="text-left">
								<?php foreach ($categories as $category) { ?>
								<?php if (in_array($category['category_id'], $product['category'])) { ?>
								<?php echo $category['name'];?><br>
								<?php } ?>
								<?php } ?></td>
							<td class="text-center" id="option_product_<?php echo $product['product_id'] ?>">
								<button type="button" name="options_<?php echo $product['product_id'] ?>" data-toggle="tooltip" title="<?php echo $entry_options_button; ?>" class="btn btn-primary options_button"><i class="fa fa-plus-square"></i></button>
							</td>
							<td class="text-right column_quantity"><?php if ($product['quantity'] <= 0) { ?>
								<span class="label label-warning"><?php echo $product['quantity']; ?></span>
								<?php } elseif ($product['quantity'] <= 5) { ?>
								<span class="label label-danger"><?php echo $product['quantity']; ?></span>
								<?php } else { ?>
								<span class="label label-success"><?php echo $product['quantity']; ?></span>
								<?php } ?></td>
							<td class="text-left column_status"><?php echo $product['status']; ?></td>
							<td class="text-right">
								<button type="button" name="<?php echo $product['product_id'] ?>" data-toggle="tooltip" title="<?php echo $entry_save; ?>" class="btn btn-primary save_button"><i class="fa fa-save"></i></button>
								<a href="<?php echo $product['edit']; ?>" data-toggle="tooltip" title="<?php echo $entry_edit_product; ?>" class="btn btn-primary"><i class="fa fa-pencil"></i></a></td>
						</tr>
						<?php } ?>
						<?php } else { ?>
						<tr>
							<td class="text-center" colspan="10"><?php echo $text_no_results; ?></td>
						</tr>
						<?php } ?>
						</tbody>
					</table>
				</div>
			</form>
			<div class="row">
				<div class="col-sm-6 text-left"><?php echo $pagination; ?></div>
				<div class="col-sm-6 text-right"><?php echo $results; ?></div>
			</div>
		</div>
	</div>
</div>
<script type="text/javascript"><!--

	function getFilter() {
		var url = "";
		if($('[name = "filter_name_old"]').val() != "")
		{
			url=url +'&filter_name=' + $('[name = "filter_name_old"]').val();
		}
		if($('[name = "filter_model_old"]').val() != "")
		{
			url=url + '&filter_model=' + $('[name = "filter_model_old"]').val();
		}
		if($('[name = "filter_price_old"]').val() != "")
		{
			url=url + '&filter_price=' + $('[name = "filter_price_old"]').val();
		}
		if($('[name = "filter_quantity_old"]').val() != "")
		{
			url=url + '&filter_quantity=' + $('[name = "filter_quantity_old"]').val();
		}
		if($('[name = "filter_category_old"]').val() != "")
		{
			url=url + '&filter_category=' + $('[name = "filter_category_old"]').val();
		}
		if($('[name = "filter_status_old"]').val() != "")
		{
			url=url + '&filter_status=' + $('[name = "filter_status_old"]').val();
		}
		if($('[name = "filter_image_old"]').val() != "")
		{
			url=url + '&filter_image=' + $('[name = "filter_image_old"]').val();
		}

		return url;

	}


	$('[name = "base_price_factor_button"]').click(function()
		{
			var base_price_factor=$('[name = "base_price_factor"]').val();
			var url = 'index.php?route=extension/module/massive_change_in_price_bobs/help_base_price_factor&token=<?php echo $token; ?>&base_price_factor=' + base_price_factor + getFilter();
			location = url;
		}
	);



	var product_id_option_open= [];
	$('.table-responsive').on('click', '.options_button', handler);
	function handler()
		{
			var product_id=$(this).attr('name').replace('options_', '');
			if (typeof product_id_option_open[product_id] != "undefined") {
				showOrHide(product_id)
			} else {
				renderOptions(product_id);
			}



		}
	function showOrHide(product_id) {
		switch(product_id_option_open[product_id]) {
			case 'show':
				$("#option_product_" + product_id + ' .options_product_sub_block').hide();
				product_id_option_open[product_id] = 'hide';
				break;
			case 'hide':
				$("#option_product_" + product_id + ' .options_product_sub_block').show();
				product_id_option_open[product_id] = 'show';
				$('.column_quantity').hide();
				$('.column_status').hide();
				//alert("s_h " + product_id_option_open[product_id] + 'show');
				break;
		}
		if(product_id_option_open.indexOf('show') == -1) {

			$('.column_quantity').show();
			$('.column_status').show();
		}
	}

	function renderOptions(product_id) {
		product_id_option_open[product_id] = 'show';
		$.ajax({
			url: 'index.php?route=extension/module/massive_change_in_price_bobs/options&token=<?php echo $token; ?>&product_id=' + product_id,
			dataType: 'json',
			success: function (json) {
				//hide column table
				$('.column_quantity').hide();
				$('.column_status').hide();
				var options_sub = '<div class="options_product_sub_block">';
				if(json.length)
				{
					//alert('dsfs' + json);
					for (i = 0; i < json.length; i++) {
						//alert('555');
						if(json[i]['options']) {
							var options = '<div class="text-left"><strong>' + json[i]['name'] +": " + '</strong></div>';
							for (isub = 0; isub < json[i]['options'].length; isub++) {
								options +='<div class="row text-left">';
								options +='<div class="col-sm-6">';
								options +=json[i]['options'][isub]['name'] + ' ' + json[i]['options'][isub]['price_prefix'];
								options +='</div>';
								options +='<div class="col-sm-6">';
								options +='<input type="text" name="product_option_value_id_' + json[i]['options'][isub]['product_option_value_id'] + '" value="' + json[i]['options'][isub]['price'] + '" class="form-control" />'
								options +='</div>';
								options +='</div>';
							}
						} else {
							var options = '<div class="text-left"><strong>' + json[i]['name'] + "</strong>: ";
							options +='<?php echo $attentions_no_options_price; ?>';
							options +='</div>';
						}

						options_sub += options;
						//alert(options);
					}
				} else {
					$("#option_product_" + product_id).append('<div class="text-left"><?php echo $attentions_no_options; ?></div>');
				}
				options_sub += '</div>';
				$("#option_product_" + product_id).append(options_sub);
			}
		});
	}

	$('.save_button').click(function()
		{
			var product_id=$(this).attr('name');
			var price=$('[name = "price_' + product_id + '"]').val();

			$.ajax({
				url: 'index.php?route=extension/module/massive_change_in_price_bobs/save&token=<?php echo $token; ?>&product_id=' + product_id + '&price=' + price + optionUrl(product_id),
				dataType: 'json',
				success: function(json) {
					//alert(price+"p"+product_id);
					$('[name = "old_price_' + product_id + '"]').text(price);
				}
			});
		}
	);
	function optionUrl(product_id)
	{
		var url = "";
		$("#option_product_" + product_id + " .form-control").each(function(i,elem) {
			url += '&' + $(this).attr('name') + "=" + $(this).val();
			//alert(url);
		});
		return url;
	}
	//--></script>

<script type="text/javascript"><!--
	$('#button-filter').on('click', function() {
		var url = 'index.php?route=extension/module/massive_change_in_price_bobs&token=<?php echo $token; ?>';

		var filter_name = $('input[name=\'filter_name\']').val();

		if (filter_name) {
			url += '&filter_name=' + encodeURIComponent(filter_name);
		}

		var filter_model = $('input[name=\'filter_model\']').val();

		if (filter_model) {
			url += '&filter_model=' + encodeURIComponent(filter_model);
		}

		var filter_price = $('input[name=\'filter_price\']').val();

		if (filter_price) {
			url += '&filter_price=' + encodeURIComponent(filter_price);
		}


		var filter_category = $('select[name=\'filter_category\']').val();

		if (filter_category != '*') {
			url += '&filter_category=' + encodeURIComponent(filter_category);
		}

		var filter_quantity = $('input[name=\'filter_quantity\']').val();

		if (filter_quantity) {
			url += '&filter_quantity=' + encodeURIComponent(filter_quantity);
		}

		var filter_status = $('select[name=\'filter_status\']').val();

		if (filter_status != '*') {
			url += '&filter_status=' + encodeURIComponent(filter_status);
		}

		var filter_image = $('select[name=\'filter_image\']').val();

		if (filter_image != '*') {
			url += '&filter_image=' + encodeURIComponent(filter_image);
		}

		location = url;
	});
	//--></script>
<script type="text/javascript"><!--
	$('input[name=\'filter_name\']').autocomplete({
		'source': function(request, response) {
			$.ajax({
				url: 'index.php?route=extension/module/massive_change_in_price_bobs/autocomplete&token=<?php echo $token; ?>&filter_name=' +  encodeURIComponent(request),
				dataType: 'json',
				success: function(json) {
					response($.map(json, function(item) {
						return {
							label: item['name'],
							value: item['product_id']
						}
					}));
				}
			});
		},
		'select': function(item) {
			$('input[name=\'filter_name\']').val(item['label']);
		}
	});

	$('input[name=\'filter_model\']').autocomplete({
		'source': function(request, response) {
			$.ajax({
				url: 'index.php?route=extension/module/massive_change_in_price_bobs/autocomplete&token=<?php echo $token; ?>&filter_model=' +  encodeURIComponent(request),
				dataType: 'json',
				success: function(json) {
					response($.map(json, function(item) {
						return {
							label: item['model'],
							value: item['product_id']
						}
					}));
				}
			});
		},
		'select': function(item) {
			$('input[name=\'filter_model\']').val(item['label']);
		}
	});
	//--></script></div>
<?php echo $footer; ?>
