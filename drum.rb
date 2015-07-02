class Drum

    VENDOR = "Wula Drum"
    OPTION1_NAME = "Title"
    OPTION1_VALUE = "Default Title"
    IMAGE_ALT_TEXT = "Wula Drum best djembe Special Piece"
    VARIANT_INVENTORY_TRACKER = "shopify"
    VARIANT_INVENTORY_QTY = "1"
    VARIANT_INVENTORY_POLICY = "deny"
    VARIANT_FULFILLMENT_SERVICE = "manual"
    VARIANT_REQUIRES_SHIPPING = "TRUE"
    VARIANT_TAXABLE = "TRUE"
    VARIANT_BARCODE = ""
    GIFT_CARD = "FALSE"
    SEO_TITLE = "Wula Drum's Best Djembe from West Africa - handmade"
    SEO_DESCRIPTION = "The special piece is Wula Drum's best djembe. This handmade djembe from West Africa comes in four models and features our best sound."
    VARIANT_WEIGHT_UNIT = "lb"

    @@shipment = "2015_june_shipment"
    @@type_map = {
        "dj" => "djembe",
        "dds" => "dundun set",
        "sb" => "sangban"
    }

    attr_accessor :photo,
        :inventory_num,
        :item,
        :wood_class,
        :model,
        :wood_type,
        :diameter,
        :height,
        :weight,
        :received,
        :price

    def initialize(row)
        @photo,
        @inventory_num,
        @item,
        @wood_class,
        @model,
        @wood_type,
        @diameter,
        @height,
        @weight,
        @received,
        @price = row
    end

    def handle
        "2015_" +
        @inventory_num + "_" +
        @item.downcase +
        @wood_class.downcase +
        @wood_type.downcase + "_" +
        @model.downcase
    end

    def title
        "#{@model} #{@item} ##{@inventory_num}"
    end

    def body

        <<-BODYTEXT
<br>
<p><b>#{@model} ##{@inventory_num} Specs:</b></p>
<ul>
    <li>Wood Type: #{@wood_type}</li>
    <li>Diameter: #{@diameter}"</li>
    <li>Height: #{@height}"</li>
    <li>Weight: #{@weight} lbs</li>
</ul>
        BODYTEXT

    end

    def type
        @@type_map[@item.downcase]
    end

    def tags
        ""
    end

    def variant_sku
        handle.upcase
    end

    def variant_grams
        @weight.to_f * 453.592
    end

    def variant_price
        @price
    end

    def aws_image_url
        "https://s3.amazonaws.com/wuladrum/products/#{@@shipment}/W_#{@model}/W_#{handle.upcase}.jpg"
    end

    def return_row
        return [
            handle,
            title,
            body,
            VENDOR,
            type,
            tags,
            "FALSE",
            OPTION1_NAME,
            OPTION1_VALUE,
            "", "", "", "",
            variant_sku,
            variant_grams,
            VARIANT_INVENTORY_TRACKER,
            VARIANT_INVENTORY_QTY,
            VARIANT_INVENTORY_POLICY,
            VARIANT_FULFILLMENT_SERVICE,
            variant_price,
            "",
            VARIANT_REQUIRES_SHIPPING,
            VARIANT_TAXABLE,
            VARIANT_BARCODE,
            aws_image_url,
            SEO_TITLE,
            SEO_DESCRIPTION,
            "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "",
            VARIANT_WEIGHT_UNIT
        ]
    end
end
