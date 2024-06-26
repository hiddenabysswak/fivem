Locales = {}

function Translate(str, ...)  -- Translate string
	if Locales[Config.Locale] then
		if Locales[Config.Locale][str] then
			return string.format(Locales[Config.Locale][str], ...)
		elseif Config.Locale ~= 'fr' and Locales['fr'] and Locales['fr'][str] then
			return string.format(Locales['fr'][str], ...)
		else
			return 'Translation [' .. Config.Locale .. '][' .. str .. '] does not exist'
		end
	elseif Config.Locale ~= 'fr' and Locales['fr'] and Locales['fr'][str] then
			return string.format(Locales['fr'][str], ...)
	else
		return 'Locale [' .. Config.Locale .. '] does not exist'
	end
end

function TranslateCap(str, ...) -- Translate string first char uppercase
	return _(str, ...):gsub("^%l", string.upper)
end

_ = Translate
_U = TranslateCap
