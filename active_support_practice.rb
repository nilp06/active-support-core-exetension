# each line start with #- is output of above line

### extensions to time

Time.zone_default
# <ActiveSupport::TimeZone:0x00007f4d53284248 @name="Kolkata", @tzinfo=#<TZInfo::DataTimezone: Asia/Kolkata>, @utc_offset=nil>

t = Time.local(2021, 1, 1, 10, 45, 45)
#- 2021-01-01 10:45:45 +0530
t.advance(seconds: 1)
#- 2021-01-01 10:45:46 +0530
t.advance(hours: 5, seconds: 1)
#- 2021-01-01 15:45:46 +0530
t.advance(hours: 5, seconds: 1, days: 6)
#- 2021-01-07 15:45:46 +0530

t = Time.local(2021, 1, 1, 10, 45, 45)
#- 2021-01-01 10:45:45 +0530
t.since(10.days)
#- 2021-01-11 10:45:45 +0530
t.since(10.months)
#- 2021-11-01 10:45:45 +0530
t.since(10.years)
#- 2031-01-01 10:45:45 +0530
t.ago(10.days)
#- 2020-12-22 10:45:45 +0530
t.ago(10.months)
#- 2020-03-01 10:45:45 +0530

# Time.current: Returns the current time in the Rails application's configured timezone.

# Time.now: Returns the current time in the system's default timezone (not aware of Rails configuration).
# i had changed rails default time zone to Nairobi time zone time current retunr current time of nairobi
Time.current
#- Tue, 20 Jun 2023 08:14:55.818630442 EAT +03:00
Time.now
#-  2023-06-20 10:45:02.905506657 +0530

t = Time.now
#- 2023-06-19 17:21:06.224147605 +0530
t.day
#- 19
t.next_day
#- 2023-06-20 17:21:06.224147605 +0530
t.next_month
#- 2023-07-19 17:21:06.224147605 +0530
t.next_year
#- 2024-06-19 17:21:06.224147605 +0530
t.past?
#- true
t.next_day
#- 2023-06-20 17:21:06.224147605 +0530
t.next_year
#- 2024-06-19 17:21:06.224147605 +0530
t.next_week
#- 2023-06-26 00:00:00 +0530
t.next_week
#- 2023-06-26 00:00:00 +0530
t.next_quarter
#- 2023-09-19 17:21:06.224147605 +0530

t = Time.new(2010, 5, 8)
#- 2010-05-08 00:00:00 +0900
t.prev_day
#- 2010-05-07 00:00:00 +0900
t.next_day
#- 2010-05-09 00:00:00 +0900

t = Time.new(2012, 5, 8)
#- 2012-05-08 00:00:00 +0530
t.next_month
#- 2012-06-08 00:00:00 +0530
t.prev_month
#- 2012-04-08 00:00:00 +0530
t.next_year
#- 2013-05-08 00:00:00 +0530
t.prev_year
#- 2011-05-08 00:00:00 +0530
t.next_day
#- 2012-05-09 00:00:00 +0530
t.prev_day
#- 2012-05-07 00:00:00 +0530

t + 1.year
#- 2013-05-08 00:00:00 +0530
t + 16.years
#- 2028-05-08 00:00:00 +0530
t + 16.days
#- 2012-05-24 00:00:00 +0530
t + 19.months
#- 2013-12-08 00:00:00 +0530
t + 19.years
#- 2031-05-08 00:00:00 +0530
t + 19.days
#- 2012-05-27 00:00:00 +0530

Time.now.all_day
#- 2023-06-20 00:00:00 +0530..2023-06-20 23:59:59.999999999 +0530

### Existence of objects
a = ' '
a.blank?
#- true
a = 'Nil Patel'
#- "Nil Patel"
a.blank?
#- false
a.present?
#- true
a.presence
#- "Nil Patel"
a = {}
#- {}
a.blank?
#- true
a[:car] = 'BMW'
#- "BMW"
a.blank?
#- false
a.present?
#- true
a.presence
#- {:car=>"BMW"}
a = nil
a.blank?
#- true

a = ['simform']
#- ["simform"]
acopy = a.dup
#- ["simform"]
acopy2 = a.deep_dup
#- ["simform"]
acopy.first.gsub!('s', 'k')
#- "kimform"
puts "#{a} - #{acopy} "
#- ["kimform"] - ["kimform"]
acopy2.first.gsub!('s', 'k')
#- "kimform"
acopy2.first.gsub!('m', 'n')
#- "kinforn"
puts "#{a} - #{acopy} "
#- ["kimform"] - ["kimform"]
puts "#{a} - #{acopy2} "
#- ["kimform"] - ["kinforn"]

number = nil
# nil
number.try(:even?)
# nil

# class eval in rails
class MyClass
  def my_method
    puts 'Hello, World!'
  end
end

MyClass.class_eval do
  def my_other_method
    puts 'This is another method.'
  end
end

obj = MyClass.new
obj.my_method
#- Output: Hello, World!
obj.my_other_method
#- Output: This is another method.

172.to_param
#- '172'
'Good morning'.to_param
#-
%w[Good morning].to_param
'Good/morning'

'Car Washer'.to_query('product')
#- "product=Car+Washer"

{ name: 'Nil Patel', age: '22' }.to_query('data')
#- "data%5Bage%5D=22&data%5Bname%5D=Nil+Patel"

{ laptop1: 'HP', laptop2: 'DELL', laptop3: 'LENOVO' }.to_query
#- "laptop1=HP&laptop2=DELL&laptop3=LENOVO"

### JSON Support

a = Article.new(title: 'Article Test', body: 'Article Test Description')
# <Article:0x00007f7193c4de50 id: nil, title: "Article Test", body: "Article Test Description", release_date: nil, created_at: nil, updated_at: nil>
a.instance_values
# {"new_record"=>true,
# "attributes"=>
#  #<ActiveModel::AttributeSet:0x00007f7193c4db30
#   @attributes=
#    {"id"=>
#      #<ActiveModel::Attribute::FromDatabase:0x00007f7193c4de00
#       @name="id",
#       @original_attribute=nil,
#       @type=#<ActiveModel::Type::Integer:0x00007f71930f5df0 @limit=8, @precision=nil, @range=-9223372036854775808...9223372036854775808, @scale=nil>,
#       @value=nil,
#       @value_before_type_cast=nil>,
#     "title"=>
#      #<ActiveModel::Attribute::FromUser:0x00007f7193c4d8d8
#       @name="title",
#       @original_attribute=
#        #<ActiveModel::Attribute::FromDatabase:0x00007f7193c4dd88
#         @name="title",
#         @original_attribute=nil,
#         @type=#<ActiveModel::Type::String:0x00007f71930d8980 @false="f", @limit=nil, @precision=nil, @scale=nil, @true="t">,
#         @value_before_type_cast=nil>,
#       @type=#<ActiveModel::Type::String:0x00007f71930d8980 @false="f", @limit=nil, @precision=nil, @scale=nil, @true="t">,
#       @value="Article Test",
#       @value_before_type_cast="Article Test">,
#     "body"=>
#      #<ActiveModel::Attribute::FromUser:0x00007f7193c4d658
#       @name="body",
#       @original_attribute=
#        #<ActiveModel::Attribute::FromDatabase:0x00007f7193c4dcc0
#         @name="body",
#         @original_attribute=nil,
#         @type=#<ActiveRecord::Type::Text:0x00007f71930f5850 @false="f", @limit=nil, @precision=nil, @scale=nil, @true="t">,
#         @value_before_type_cast=nil>,
#       @type=#<ActiveRecord::Type::Text:0x00007f71930f5850 @false="f", @limit=nil, @precision=nil, @scale=nil, @true="t">,
#       @value="Article Test Description",
#       @value_before_type_cast="Article Test Description">,
#     "release_date"=>
#      #<ActiveModel::Attribute::FromDatabase:0x00007f7193c4dc98
#       @name="release_date",
#       @original_attribute=nil,
#       @type=#<ActiveRecord::ConnectionAdapters::PostgreSQL::OID::Date:0x00007f71930f5350 @limit=nil, @precision=nil, @scale=nil>,
#       @value=nil,
#       @value_before_type_cast=nil>,
#     "created_at"=>
#      #<ActiveModel::Attribute::FromDatabase:0x00007f7193c4dc70
#       @name="created_at",
#       @original_attribute=nil,
#       @type=#<ActiveRecord::ConnectionAdapters::PostgreSQL::OID::Timestamp:0x00007f71930def10 @limit=nil, @precision=6, @scale=nil>,
#       @value=nil,
#       @value_before_type_cast=nil>,
#     "updated_at"=>
#      #<ActiveModel::Attribute::FromDatabase:0x00007f7193c4dbf8
#       @name="updated_at",
#       @original_attribute=nil,
#       @type=#<ActiveRecord::ConnectionAdapters::PostgreSQL::OID::Timestamp:0x00007f71930def10 @limit=nil, @precision=6, @scale=nil>,
#       @value=nil,
#       @value_before_type_cast=nil>}>,
# "association_cache"=>{},
# "readonly"=>false,
# "previously_new_record"=>false,
# "destroyed"=>false,
# "marked_for_destruction"=>false,
# "destroyed_by_association"=>nil,
# "_start_transaction_state"=>nil,
# "primary_key"=>"id",
# "strict_loading"=>false,
# "strict_loading_mode"=>:all}

a.instance_variable_names

# ["@new_record",
#  "@attributes",
#  "@association_cache",
#  "@readonly",
#  "@previously_new_record",
#  "@destroyed",
#  "@marked_for_destruction",
#  "@destroyed_by_association",
#  "@_start_transaction_state",
#  "@primary_key",
#  "@strict_loading",
#  "@strict_loading_mode"]

### Extensions to string

s =  "Nil Patel"
s.html_safe?
=> false
s = s.html_safe
"Nil Patel"
s.html_safe?
#- true

"".html_safe + "<" 
#- "<"
"".html_safe + "<".html_safe 
#- "<"

"Hi Good Evening".remove!("Hi")
#- " Good Evening"
"Hi Good Evening".remove!("Good")
#- "Hi  Evening"

" \n  foo\n\r \t bar \n".squish 
#- "foo bar"

"   Nil Patel \n \n ".squish
#- "Nil Patel"

"Oh dear! Oh dear! I shall be late!".truncate(20)
#- "Oh dear! Oh dear!..."

"Hi i am Nil Patel.".truncate(5)
#- "Hi..."

"Hi good evening ".truncate_words(2)
#- "Hi good..."

"Nil Patel".starts_with?('N')
true

"Meet Patel".ends_with?('M')
false

"Hii asd".indent(3)
"   Hii asd"

"hello".at(0)
#- "h"

"hello".from(0)  
#- "hello"
"hello".from(2)
#- "llo"

"hello".to(0)  
#- "h"
"hello".to(2) 
#- "hel"

"Hello".first
#- "H"
"World".last
#- "d"

"car".pluralize
#- "cars"

"car".pluralize(1)
#- "car"
"car".pluralize(2)
#- "cars"

"cars".singularize
#- "car"

"product".camelize    
#- "Product"

"admin_user".camelize 
#- "AdminUser"

"active_record/base".camelize
#- "ActiveRecord::Base

"nil patel".titleize
#- "Nil Patel"

"nil_patel".dasherize
#- "nil-patel"

"Backoffice::UsersController".demodulize
#- "UsersController"

"Backoffice::UsersController".deconstantize
#- "Bacloffice"

"John Smith".parameterize(preserve_case: true)
#- "John-Smith"

"Nil Patel".parameterize(separator: "_")
#- "Nil-Patel"

"Employee".tableize
#- "employees"

"people".classify
#- "Person"

"comments_count".humanize
#- "Comments count"

"2010-07-27".to_date
#- Tue, 27 Jul 2010
"2010-07-27".to_date.class
#- Date
"2010-07-27 23:37:00".to_time
#- 2010-07-27 23:37:00 +0530
"2010-07-27 23:37:00".to_time.class
#- Time
"2010-07-27 23:37:00".to_datetime
#- Tue, 27 Jul 2010 23:37:00 +0000
"2010-07-27 23:37:00".to_datetime.class
#- DateTime


"2010-07-27 23:42:00".to_time(:utc)
#- 2010-07-27 23:42:00 UTC
"2010-07-27 23:42:00".to_time(:local)
#- 2010-07-27 23:42:00 +0530

### Extensions to symbol

:foo.starts_with?("f")
#- true
:foo.ends_with?("o")
#- true

### Extensions to numeric

2.kilobytes
#- 2048

2.megabytes
#- 2097152

2.gigabytes
#2147483648

(4.days + 5.weeks).from_now
#- Sat, 29 Jul 2023 16:57:01.773248500 UTC +00:00

5551234.to_fs(:phone)
#-  555-1234

1235551234.to_fs(:phone)
#- 123-555-1234

1235551234.to_fs(:phone, area_code: true)
#-  (123) 555-1234

1235551234.to_fs(:phone, delimiter: " ")
#- "123 555 1234"

1234567890.50.to_fs(:currency)
#- $1,234,567,890.50
1234567890.506.to_fs(:currency)
#- $1,234,567,890.51
1234567890.506.to_fs(:currency, precision: 3)
#- $1,234,567,890.506

100.to_fs(:percentage)
#- 100.000%
100.to_fs(:percentage, precision: 0)
#- 100%
1000.to_fs(:percentage, delimiter: '.', separator: ',')
#- 1.000,000%
302.24398923423.to_fs(:percentage, precision: 5)
#- 302.24399%

123.to_fs(:human)    
#- "123"

123123123.to_fs(:human)
#- "123 Million"

12312312132313123.to_fs(:human)
#- "12.3 Quadrillion"

123123123123123.to_fs(:human_size)
#- "112 TB"

### Extensions to integer

2.multiple_of?(2)
#- true

2.ordinal
#- "nd"

1.ordinalize
#- "1st"

3.ordinalize
#- "3rd"

2.months.from_now
#- Sun, 20 Aug 2023 17:15:50.646039900 UTC +00:00

(4.months + 6.years).from_now
#- Sat, 20 Oct 2029 17:16:36.423921300 UTC +00:00

[1 , 2 , 3].sum
#- 6
["Nil","Patel"].sum
#- DEPRECATION WARNING: Rails 7.0 has deprecated Enumerable.sum in favor of Ruby's native implementation available since 2.4. Sum of non-numeric elements requires an initial argument. (called from <main> at bin/rails:4)
#- "NilPatel"

(1..5).sum {|n| n * 2 }
#- 30

#conversions

["Good","Evening","All."].to_sentence
#- "Good, Evening, and All." 

hash = { data: { name: "Kiran Patel" }}
#- {:data=>{:name=>"Kiran Patel"}} 
hash_copy = hash.deep_dup
#- {:data=>{:name=>"Kiran Patel"}} 
hash_copy[:data][:name] = "Kalpesh Patel"
#- "Kalpesh Patel" 
hash
#- {:data=>{:name=>"Kalpesh Patel"}} 
hash_copy
#- {:data=>{:name=>"Kalpesh Patel"}} 



company_data = {name: "Simform" , location: "Ahmedabad"}
#- {:name=>"Simform", :location=>"Ahmedabad"} 
company_data.except(:location)
#- {:name=>"Simform"} 

company_data.with_indifferent_access.except("name")
#- {"location"=>"Ahmedabad"} 

company_data.with_indifferent_access.except(:name)
#- {"location"=>"Ahmedabad"} 


employee_data = { name: "Dhruvika Kevat" , department: "ROR" }
#- {:name=>"Dhruvika Kevat", :department=>"ROR"} 
employee_data.stringify_keys
#- {"name"=>"Dhruvika Kevat", "department"=>"ROR"} 

employee_data.symbolize_keys!
#- {:name=>"Dhruvika Kevat", :department=>"ROR"} 

employee_data.to_options!
#- {:name=>"Dhruvika Kevat", :department=>"ROR"} 

hash = { person: { name: "Rob", age: '19' } }
hash.deep_transform_values{ |value| value.to_s.upcase }
#- {:person=>{:name=>"ROB", :age=>"19"}} 


hash = { a: 1, b: 2}
#- {:a=>1, :b=>2} 
rest = hash.slice!(:b)
#- {:a=>1} 

employee_data
#- {:name=>"Dhruvika Kevat", :department=>"ROR"} 
employee_data.extract!(:name)
#- {:name=>"Dhruvika Kevat"} 

employee_data
#- {:name=>"Dhruvika Kevat", :department=>"ROR"} 
employee_data.extract!(:name)
#- {:name=>"Dhruvika Kevat"} 
                                                                   
employee_data
#- {:department=>"ROR"} 
employee_data.slice(:department)
#- {:department=>"ROR"} 
employee_data.slice!(:department)
#- {} 

employee_data = { name: "Sanjay Vinzuda" }.with_indifferent_access
#- {"name"=>"Sanjay Vinzuda"} 
employee_data["name"]
#- "Sanjay Vinzuda" 

%r{.}.multiline?
#- false 
%r{.}m.multiline?
#- true 

Regexp.new('.').multiline?                
#- false
Regexp.new('.', Regexp::MULTILINE).multiline? 
#- true

(Date.today..Date.tomorrow).to_s
#- "2023-06-21..2023-06-22" 

(1...10).include?(3..7)
#- true 
(1...10).include?(3..7)
#- true 
(1...10).include?(3..11)
#- false 

(1..10).overlaps?(3..11)
#- true 
(1..10).overlaps?(11..21)
#- false 

#extensions to date

Date.current
#- Wed, 21 Jun 2023 
Date.today
#- Wed, 21 Jun 2023 
Date.tomorrow
#- Thu, 22 Jun 2023 
Date.yesterday
#- Tue, 20 Jun 2023 

Date.yesterday
#- Tue, 20 Jun 2023 
d = Date.yesterday
#- Tue, 20 Jun 2023 
d.yesterday?
#- true 
d= Date.current
#- Wed, 21 Jun 2023 
d.next_day?
#- false 

d = Date.current
#- Wed, 21 Jun 2023 
d.next_day
#- Thu, 22 Jun 2023 
d.future?
#- false 
d.on_weekday?
#- true 
d.on_weekend?
#- false 

d = Date.new(2011, 5, 8)
#- Sun, 08 May 2011 
d.beginning_of_week
#- Mon, 02 May 2011 
d.beginning_of_week
#- Mon, 02 May 2011 
d.beginning_of_week(:sunday)
#- Sun, 08 May 2011 
d.end_of_week
#- Sun, 08 May 2011 
d.end_of_week(:sunday)
#- Sat, 14 May 201

d= Date.new(2012, 5, 12)
#- Sat, 12 May 2012 
d.monday
#- Mon, 07 May 2012 
d.sunday
#- Sun, 13 May 2012 

d.next_week
#- Mon, 14 May 2012 
d.next_year
#- Sun, 12 May 2013 
d.next_month
#- Tue, 12 Jun 2012 
d.prev_week
#- Mon, 30 Apr 2012 
d.prev_month
#- Thu, 12 Apr 2012 
d.prev_year
#- Thu, 12 May 2011 
 
d.beginning_of_month
#- Tue, 01 May 2012 
d.end_of_month
#-Thu, 31 May 2012 
d.beginning_of_year
#- Sun, 01 Jan 2012  
d.end_of_year
#- Mon, 31 Dec 2012 


#extensions to date-time

d = DateTime.now
#- Wed, 21 Jun 2023 19:03:37 +0530 
d.next_day
#- Thu, 22 Jun 2023 19:03:37 +0530 
d.next_year
#- Fri, 21 Jun 2024 19:03:37 +0530 
d.next_month
#- Fri, 21 Jul 2023 19:03:37 +0530 

d.prev_day
#- Wed, 21 Jun 2023 09:59:34 +0530 
d.prev_month
#- Mon, 22 May 2023 09:59:34 +0530 
d.prev_year
#- Wed, 22 Jun 2022 09:59:34 +0530 

d.since(2.days)
#- Sat, 24 Jun 2023 09:59:34 +0530 
d.since(2.months)
#- Tue, 22 Aug 2023 06:57:46 +0530 
d.since(2.years)
#- Sat, 21 Jun 2025 21:37:58 +0530 
d.ago(2.days)
#- Tue, 20 Jun 2023 09:59:34 +0530 
d.ago(2.months)
#- Sat, 22 Apr 2023 13:01:22 +0530 
d.ago(2.years)
#- Mon, 21 Jun 2021 22:21:10 +0530 


d.at_midnight
#-Thu, 22 Jun 2023 00:00:00 +0530 
d.at_beginning_of_day
#- Thu, 22 Jun 2023 00:00:00 +0530 
d.at_end_of_day
#- Thu, 22 Jun 2023 23:59:59 +0530



module World
  module Earth
    module India
    end
  end
end

m = World::Earth::India
m.module_parent
#- World::Earth 
m.module_parent
#- World::Earth 

i = World::Earth::India
#- World::Earth::India 
i.module_parent
#- World::Earth 

#- i.module_parents
#- [World::Earth, World, Object] 

