# Creates categories
tech_accessories = Category.create!(
  name: "Tech Accessories",
  description: nil
)

sports = Category.create!(
  name: "Sports",
  description: nil
)
t_shirts = Category.create!(
  name: "T Shirts",
  description: nil
)

tech_accessories.images.attach(io: File.open(Rails.root.join("app", "assets", "images", "tech.jpg")), filename: "tech.jpg")
sports.images.attach(io: File.open(Rails.root.join("app", "assets", "images", "sports.jpg")), filename: "sports.jpg")
t_shirts.images.attach(io: File.open(Rails.root.join("app", "assets", "images", "t-shirt.jpg")), filename: "t-shirt.jpg")

# Creates products
products = [
  {
    name: "Wireless Phone Charger",
    description: "<p>Charge three of your Apple devices at once with the Anker Qi2 MagGo three-in-one wireless charging station. This convenient folding charger works with your iPhone, Apple Watch and AirPods so your devices always have power. Plus, the ultra-fast charging capability quickly powers up your electronics wirelessly.</p>",
    price: 75,
    category: tech_accessories,
    image_folder: "wireless-charger"
  },
  {
    name: "iPhone Clear Case",
    description: "<p> - Made from 80% recycled material<br>
                      - Printed with 100% eco-friendly UV ink<br>
                      - Scratch-resistant printing<br>
                      - Easy access to ports
                  </p>",
    price: 15,
    category: tech_accessories,
    image_folder: "phone-case"
  },
  {
    name: "Basketball",
    description: "<p>Spalding TF1000 Legacy Indoor Basketball features a wet grip microfiber composite cover that creates a dry, moisture-wicking surface for ultimate control and superior handling. The 100% nylon windings give maximum structural integrity, and the rotationally-balanced butyl bladder allows enhanced shape retention for long-lasting use. Spalding shooter's seam is developed for instant ball recognition and precise accuracy. NFHS approved, the premium basketball is recommended for indoor gameplay.</p>",
    price: 120,
    category: sports,
    image_folder: "basketball"
  },
  {
    name: "Soccer World Cup Brazil",
    description: "<p>Outer Material: This soccer ball is made of high quality Grained Rexine<br>
                  Centred Material: High Performance Eva Foam used<br>
                  Inner Material: Inner shell Cover with Yarn Winded Carcass Bladder for Long-time Air-retention.<br>
                  Superior Construction: The panel construction ensures enhanced durability, performance, and accuracy on the field.<br>
                  Features: High Visibility, Low Bounce, Reinforced Bladder, Water Resistant, 470g Weight<br>
                  Shape: Excellent aerodynamics and responsiveness shape</p>",
    price: 150,
    category: sports,
    image_folder: "soccer"
  },
  {
    name: "Red Polo T-Shirt",
    description: "<p>A classic combination of the timeless button-up oxford dress shirt and the much more casual T-shirt.  Polo shirts typically feature a collar and placket with a few buttons and are made with a knitted cotton known as piqué.</p>",
    price: 37.95,
    category: t_shirts,
    image_folder: "polo"
  },
  {
    name: "The Lion King",
    description: "<p>The Easy Crew defines your go-to classic tee: the same buttery soft, 100% Egyptian Cotton as our iconic Essential Crew, but with a slightly relaxed fit. An instant favourite, featuring a straight-fitting torso that sits just below the hip and a durable, bound neckline that highlights the quality of the fabric and design.</p>",
    price: 30,
    category: t_shirts,
    image_folder: "lion-king"
  },
  {
    name: "Premium Hockey Stick",
    description: "<p>Unleash your potential! Strategically created with the elite playmaker in mind, the CODE Encrypt Pro stick is built for performance. The lightest CODE model ever made is equipped with a perfectly balanced hybrid kick point. A new advanced composite lay up ensures exceptional puck handling and shooting, because we know you can do both. Featuring the state-of-the-art ergonomic EVT shaft shape, creating energized power transfer for puck distribution accuracy and the ultimate confidence on the ice. The new re-engineered blade profile features the VR-92 internal dampening laminate to reduce vibration in key impact zones.</p>",
    price: 200,
    category: sports,
    image_folder: "hockey"
  },
  {
    name: "Walk by Faith",
    description: "<p>Crafted from organic cotton, the Redact is shaped to our favourite oversized fit. You're familiar with our Underground logo? We've embroidered it on the front and back, with a black box over the top – it’s a whole new take. Completed with a ribbed neckband and refined twin-needle stitch detail, this is how we do tees.
      <ul>
        <li>This t-shirt is designed to be worn oversized</li>
        <li>If you are between sizes or prefer a closer fit, we recommend sizing down</li>
        <li>Pullover</li>
        <li>Crew neck</li>
        <li>Short sleeves</li>
      </ul>
    </p>",
    price: 100,
    category: t_shirts,
    image_folder: "walk-faith"
  }
]

products.each do |product_data|
  product = Product.create!(
    name: product_data[:name],
    description: product_data[:description],
    price: product_data[:price],
    category: product_data[:category]
  )

  Dir.glob(Rails.root.join("app", "assets", "images", product_data[:image_folder], "*.{jpg,jpeg,webp}")).each do |image_path|
    product.images.attach(io: File.open(image_path), filename: File.basename(image_path))
  end
end
