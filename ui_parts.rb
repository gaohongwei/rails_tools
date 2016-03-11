
.filter-group
  h4.filter-name data-toggle="collapse" href="##{title.downcase.tr(' ','_')}" aria-expanded="true"
    = title
  .collapse.in id="#{title.downcase.tr(' ','_')}"
    = render 'shared/parts/radiobutton', rows: rows, key:key, label:label, vname:vname
    
.filter-group
  h4.filter-name data-toggle="collapse" href="##{title.downcase.tr(' ','_')}" aria-expanded="true"
    = title
  .collapse.in id="#{title.downcase.tr(' ','_')}"
    = render 'shared/parts/checkboxs', rows: rows, key:key, label:label, vname:vname
    
    
- rows.each do |row|
  .rule-info.rule-hover.rule-type-row
    div
      = radio_button_tag vname, row[key], false, id: row[key]
      label.label.item-red.strong = row[label]
      
- rows.each do |row|
  .rule-info.rule-hover.rule-type-row
    div
      = check_box_tag vname, row[key], rows.map{|x|x[key]}.include?(row[key]), id: row[key]
      label.label.item-red.strong = row[label]
      
# Checkbox
= f.collection_check_boxes :file_types,[['file','File'],['report','Report']], :first, :last
= f.input_field :event_types, as: :check_boxes, collection: [['previewed','previewed'], ['downloded','downloded']]
= f.input_field :types, as: :check_boxes, collection: [['box','box'], ['o365','o365']
= f.input_field :file_types, as: :check_boxes, collection: [['file','file'], ['folder','folder']]      
      
