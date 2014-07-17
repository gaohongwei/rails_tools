@ar=[ {name:'gwei',pay:20}, {name:'jeff',pay:30}, {name:'just',pay:40} ]

tpl="<% @ar.each do |e| %> name:<%=e[:name]%>, pay:<%=e[:pay]%> <% end %>"

render :inline =>tpl,:layout => "application"

data = render_to_string( :action => :show,:layout => false)
