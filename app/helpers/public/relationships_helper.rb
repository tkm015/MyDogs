module Public::RelationshipsHelper
	# フォロー済みのdogか確認
	def following?(other_customer, dog)
  	relationship = Relationship.find_by(customer_id: other_customer, dog_id: dog)
    end
end
