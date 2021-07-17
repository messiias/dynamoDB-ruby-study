require 'aws-sdk-dynamodb'

class DBUtils
  include Aws
  
  def initialize
    @dynamodb_client = Aws::DynamoDB::Client.new(
      region: 'localhost',
      endpoint: 'http://localhost:8000',
      access_key_id: 'DUMMYIDEXAMPLE',
      secret_access_key: 'DUMMYEXAMPLEKEY'
    )
  end

  def create_table(table_definition)
    response = @dynamodb_client.create_table(table_definition)
    response.table_description.table_status
    rescue StandardError => e 
      puts "#{e.message}"
  end

  def insert_table(item)
    @dynamodb_client.put_item(item)
    rescue StandardError => e 
    puts "#{e.message}"
  end

  def select_one(condition)
    @dynamodb_client.get_item(condition)
    rescue StandardError => e 
    puts "#{e.message}"
  end

  def select_all(condition)
    @dynamodb_client.scan(condition)
    rescue StandardError => e 
    puts "#{e.message}"
  end

  def update_item(item)
    @dynamodb_client.update_item(item)
    rescue StandardError => e 
    puts "#{e.message}"
  end

  def delete_one(item)
    @dynamodb_client.delete_item(item)
    rescue StandardError => e 
    puts "#{e.message}"
  end
end