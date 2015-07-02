require_relative "drum"
require "csv"

inventory = CSV.read("inventory.csv")
inventory.map! {|e| e[0..10]}

drums = []
inventory.each do |d|
    d.map! do |e|
        if e.nil?
            ""
        else
            e
        end
    end
end

inventory.each do |d|
    drums << Drum.new(d)
end

output = []
drums.each do |d|
    output << d.return_row
end

title_row = "Handle, Title, Body(HTML), Vendor, Type, Tags, Published, Option1 Name, Option1 Value, Option2 Name, Option2 Value, Option3 Name, Option3 Value, Variant SKU, Variant Grams, Variant Inventory Tracker, Variant Inventory Qty, Variant Inventory Policy, Variant Fulfillment Service, Variant Price, Variant Compare At Price, Variant Requires Shipping, Variant Taxable, Variant Barcode, Image Src, Image Alt Text, Gift Card, SEO Title, SEO Description, Google Shopping / Google Product Category, Google Shopping / Gender, Google Shopping / Age Group, Google Shopping / MPN, Google Shopping / AdWords Grouping, Google Shopping / AdWords Labels, Google Shopping / Condition, Google Shopping / Custom Product, Google Shopping / Custom Label 0, Google Shopping / Custom Label 1, Google Shopping / Custom Label 2, Google Shopping / Custom Label 3, Google Shopping / Custom Label 4, Variant Image, Variant Weight Unit".split(",")

CSV.open("inventory_for_shopify.csv", "w") do |csv|
    csv << title_row
    output.each do |r|
        csv << r
    end
end
