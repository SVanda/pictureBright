Caman.Filter.register("blackAndWhite", function(grey) {
this.greyscale();
this.sepia(10);
this.exposure(10);
this.contrast(15);
return this.vignette("60%",35);
});
Caman.Filter.register("bright", function(grey) {
this.brightness(7);
this.exposure(5);
this.contrast(16);
return this.vibrance(7);
});
// Generated by CoffeeScript 1.6.3
(function() {
var busy, caman, changed, filters, presetBusy, presetCaman, render, renderPreset,
__hasProp = {}.hasOwnProperty;
caman = null;
presetCaman = null;
filters = {};
busy = false;
changed = false;
render = _.throttle(function() {
var filter, value;
if (busy) {
changed = true;
return;
} else {
changed = false;
}
busy = true;
caman.revert(false);
for (filter in filters) {
if (!__hasProp.call(filters, filter)) continue;
value = filters[filter];
value = parseFloat(value, 10);
if (value === 0) {
continue;
}
caman[filter](value);
}
return caman.render(function() {
busy = false;
if (changed) {
return render();
}
});
}, 300);
presetBusy = false;
renderPreset = function(preset) {
var $filter, name;
if (presetBusy) {
return;
}
$("#PresetFilters a").removeClass('Active');
$filter = $("#PresetFilters a[data-preset='" + preset + "']");
name = $filter.html();
$filter.addClass('Active').html('Rendering...');
presetBusy = true;
presetCaman.revert(false);
presetCaman[preset]();
return presetCaman.render(function() {
$filter.html(name);
return presetBusy = false;
});
};
$(document).ready(function() {
if (!($("#example").length > 0)) {
return;
}
caman = Caman('#example');
presetCaman = Caman('#preset-example');
$('.FilterSetting input').each(function() {
var filter;
filter = $(this).data('filter');
return filters[filter] = $(this).val();
});
$('#Filters').on('change', '.FilterSetting input', function() {
var filter, value;
filter = $(this).data('filter');
value = $(this).val();
filters[filter] = value;
$(this).find('~ .FilterValue').html(value);
return render();
});
return $('#PresetFilters').on('click', 'a', function() {
return renderPreset($(this).data('preset'));
});
});
}).call(this);