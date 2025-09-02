# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

# Articles seed data: Programming Languages theme

articles = [
	{
		title: "Ruby",
		content: "Ruby was created by Yukihiro Matsumoto in Japan in the mid-1990s. Matsumoto wanted a language that balanced functional and imperative programming, and focused on developer happiness. Ruby's elegant syntax and dynamic nature made it popular for web development, especially with the advent of Ruby on Rails."
	},
	{
		title: "Python",
		content: "Python was developed by Guido van Rossum and released in 1991. Its design philosophy emphasizes code readability and simplicity. Python was created as a successor to the ABC language, aiming to be easy to learn and use, and has since become a staple in education, web development, and data science."
	},
	{
		title: "JavaScript",
		content: "JavaScript was created by Brendan Eich in 1995 while working at Netscape. Originally developed in just 10 days, it was designed to make web pages interactive. Despite its rushed beginnings, JavaScript evolved into the backbone of modern web development, powering dynamic websites and applications."
	},
	{
		title: "Go",
		content: "Go (Golang) was developed at Google and released in 2009. Its creators, including Rob Pike and Ken Thompson, wanted a language that combined the efficiency of C with the simplicity of modern languages. Go was designed for scalable, concurrent systems, making it ideal for cloud infrastructure and server-side applications."
	},
	{
		title: "Rust",
		content: "Rust was first released in 2010 by Mozilla employee Graydon Hoare. It was designed to provide memory safety without sacrificing performance, addressing common issues in C and C++. Rust's focus on safety and concurrency has made it popular for systems programming and performance-critical applications."
	},
	{
		title: "TypeScript",
		content: "TypeScript was developed by Microsoft and released in 2012. It was created to address the challenges of large-scale JavaScript development by adding static typing. TypeScript allows developers to catch errors early and write more maintainable code, while still compiling down to standard JavaScript."
	},
	{
		title: "Kotlin",
		content: "Kotlin was developed by JetBrains and first released in 2011. It was designed to be a modern, expressive language for the JVM, interoperable with Java but with a more concise syntax. Kotlin quickly gained popularity, especially for Android development, and was officially supported by Google in 2017."
	},
	{
		title: "Swift",
		content: "Swift was introduced by Apple in 2014 as a replacement for Objective-C. It was designed to be safer, faster, and more expressive, making iOS and macOS development more accessible. Swift's modern features and strong safety guarantees have made it the preferred language for Apple platforms."
	}
]

articles.each do |attrs|
	Article.find_or_create_by!(title: attrs[:title]) do |article|
		article.content = attrs[:content]
	end
end
