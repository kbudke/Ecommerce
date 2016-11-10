<h2>
	Congratulations, you've made <%= number_to_currency @my_money %>! 
</h2>

<div>
	<%= link_to invoices_path(choice: "date") do %>
		<input type="radio" id="by_date"></input> Sort By Date<br />
	<% end %>
	<%= link_to invoices_path(choice: "total") do %>
		<input type="radio" id="by_total"></input> Sort By Grand Total<br />
	<% end %>
	<%= link_to invoices_path(choice: "size") do %>
		<input type="radio" id="by_size"></input> Sort By Order Size<br />
	<% end %>
</div>

<div>
	<% @orders.each do |order| %>
		<p>
			#<%= order.id %><br />
			<%= order.user.email %><br />
			Items Bought: <%= order.order_items.length %><br />
			<%= number_to_currency order.grand_total %>
		</p>
	<% end %>
</div>