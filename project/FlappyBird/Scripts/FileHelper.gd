#FileHelper.gd
class_name FileHelper

#普通写入
static func save(path,data):
	var file = File.new()
	file.open(path,File.WRITE)
	file.store_string(var2str(data))
	file.close()

#普通读取
static func read(path,default_data):
	var data = default_data
	var file = File.new()
	file.open(path,File.READ_WRITE)
	var content :String = file.get_as_text()
	if not content.empty():
		data = str2var(content)
	file.close()
	return data


#加密写入
static func save_encrypted(path,data,key):
	var file = File.new()
	file.open_encrypted_with_pass(path,File.WRITE,key)
	file.store_string(var2str(data))
	file.close()


#加密读取
static func read_encrypted(path,key,default_data):
	var data = default_data
	var file = File.new()
	file.open_encrypted_with_pass(path,File.READ_WRITE,key)
	var content :String = file.get_as_text()
	if not content.empty():
		data = str2var(content)
	file.close()
	return data


