%dw 2.0
output application/json
---
{
	ID: payload.Products.Product.Product_ID as String,
	ProductType: payload.Products.Product.SKU,
	ProductName: payload.Products.Product.Name,
	ProductPrice: payload.Products.Product.Price as String,
	ProductBrand: payload.Products.Product.Brand,
	SKUType: payload.Products.Product.Child_SKU,
	ProductSubPrice: payload.Products.Product.Child_Price,
	ProductColor: (payload.Products.Product.Color ++ if ( payload.Products.Product.Color_Family != null ) ("-" ++ payload.Products.Product.Color_Family) else "" ++ if ( payload.Products.Product.Color_Swatches != null ) ("-" ++ payload.Products.Product.Color_Swatches) else ""),
	ProductSize: payload.Products.Product.Size,
	ProductRating: payload.Products.Product.Rating_Avg as String,
	CurrentInvCount: payload.Products.Product.Inventory_Count as String,
	Date_Created: payload.Products.Product.Date_Created,
	Reason: payload.Products.Product.Reason,
	UserComment: payload.Products.Product.UserComment,
	AdditionalComments: payload.Products.Product.AdditionalComments
}