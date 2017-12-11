function print_r ( t )
	local print_r_cache={}
	local function sub_print_r(t,indent)
		if (print_r_cache[tostring(t)]) then
			print(indent.."*"..tostring(t))
		else
			print_r_cache[tostring(t)]=true
			if (type(t)=="table") then
				for pos,val in pairs(t) do
					if (type(val)=="table") then
						print(indent.."["..pos.."] => "..tostring(t).." {")
						sub_print_r(val,indent..string.rep(" ",string.len(pos)+8))
						print(indent..string.rep(" ",string.len(pos)+6).."}")
					elseif (type(val)=="string") then
						print(indent.."["..pos..'] => "'..val..'"')
					else
						print(indent.."["..pos.."] => "..tostring(val))
					end
				end
			else
				print(indent..tostring(t))
			end
		end
	end
	if (type(t)=="table") then
		print(tostring(t).." {")
		sub_print_r(t,"  ")
		print("}")
	else
		sub_print_r(t,"  ")
	end
	print()
end

List ={}
function List.new()
	return {first=0,last = -1 }
end

function List.pushfirst(list,value)
	local first = list.first -1
	list.first = first
	list[first] = value
end

function List.pushlast(list,value)
	local last = list.last +1
	list.last= last
	list[last] = value
end

function List.popfirst(list)
	local first = list.first
	if first > list.last then error("list is empty") end
	local value= list[first]
	list[first] = nil
	list.first= first +1
	return value
end

function List.poplast(list)
	local last = list.last
	if list.first > last then error("list is empty") end
	local value = list[last]
	list[last]= nil
	list.last = last -1
	return value
end


function List.new()
	return {first=0,last = -1 }
end

function List.getfirst(list)
	local first = list.first
	if first > list.last then error("list is empty") end
	local value= list[first]
	--list[first] = nil
	--list.first= first +1
	return value
end


list1= List.new()

list2= List.new()


List.pushlast(list1,'sdfsdfsfd')

List.pushlast(list1,'ss')

List.pushlast(list1,44)

List.pushlast(list1,{222,333})

--print_r(list1)

function getListSize(list1)
	local cnt1 = 0
	for k,v in pairs(list1) do
		cnt1 = cnt1 +1
	end
	return cnt1
end

function test1 (list1,k1)
	if getListSize(list1) > 2 then
		for k,v in pairs(list1) do			
			local value= list1[k1]
			print(value)
			list1[k1] = nil

			if k1 == list1.last then
				local last = list1.last
				local value = list1[last]
				if list1.first ~= list1.last then
					list1.last = last -1
				end

			end

			if k1 == list1.first then
				local first = list1.first				
				local value= list1[first]				
				if list1.first ~= list1.last then
					list1.first= first +1
				end
			end
		end
	end
end



print_r(list1)


test1(list1,0)
test1(list1,1)
test1(list1,2)
test1(list1,2)
test1(list1,3)

print_r(list1)

print(getListSize(list1))
