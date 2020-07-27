%dw 2.0
output application/json
---
{
	Complaint: {
		ProductID: payload.Products.Product.Product_ID,
		Make: payload.Products.Product.SKU,
		Name: payload.Products.Product.Name,
		Price: payload.Products.Product.Price,
		RetailPrice: payload.Products.Product.Retail_Price,
		Brand: payload.Products.Product.Brand,
		SubSKU: payload.Products.Product.Child_SKU,
		SubPrice: payload.Products.Product.Child_Price,
		Color: (payload.Products.Product.Color default "") ++ payload.Products.Product.Color_Family,
		ColorFamily: payload.Products.Product.Color_Swatches,
		Size: if ( payload.Products.Product.Size != null ) (payload.Products.Product.Size) else if (payload.Products.Product.Shoe_Size != null) (payload.Products.Product.Shoe_Size) else (payload.Products.Product.Pants_Size),
		Occassion: payload.Products.Product.Occassion,
		Season: payload.Products.Product.Season,
		Badges: payload.Products.Product.Badges,
		Rating: payload.Products.Product.Rating_Avg,
		RatingCount: payload.Products.Product.Rating_Count,
		InvCount: payload.Products.Product.Inventory_Count,
		Date_Created: payload.Products.Product.Date_Created
	}
}