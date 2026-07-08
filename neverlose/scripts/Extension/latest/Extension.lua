slot_0_0_0 = db.escape_from_samara_extension or {
	configs = {},
	drag_memory = {},
	viewmodel = {}
}

if slot_0_0_0.viewmodel == nil then
	slot_0_0_0.viewmodel = {}
end

slot_0_1_0 = _NAME:find("Trial") ~= nil

if slot_0_1_0 and not slot_0_0_0.trial_cache_1 then
	slot_0_0_0.trial_cache_1 = common.get_unixtime() + 86401
end

events.shutdown:set(function()
	db.escape_from_samara_extension = slot_0_0_0
end)
cvar.clear:call()

function slot_0_2_0(...)
	local var_2_0 = {
		...
	}
	local var_2_1 = {}

	for iter_2_0 = -#var_2_0, -1 do
		local var_2_2 = var_2_0[-iter_2_0]

		if type(var_2_2) == "table" then
			local var_2_3 = var_2_2

			temp_array = {}

			for iter_2_1, iter_2_2 in pairs(var_2_3) do
				table.insert(temp_array, iter_2_1 .. " = " .. tostring(iter_2_2))
			end

			var_2_2 = "\n{" .. table.concat(temp_array, ", \n") .. "}\n"
		end

		table.insert(var_2_1, 1, tostring(var_2_2))
	end

	print_raw(table.concat(var_2_1, ", "))
end

files.create_folder("csgo\\materials\\panorama\\images\\icons\\extension")

slot_0_3_0 = "\x89PNG\r\n\x1A\n\x00\x00\x00\rIHDR\x00\x00\x00\x80\x00\x00\x00\x80\b\x06\x00\x00\x00\xC3>a\xCB\x00\x00\x00\tpHYs\x00\x00\v\x13\x00\x00\v\x13\x01\x00\x9A\x9C\x18\x00\x00\x1A\xFDIDATx\x9C\xED}}\xAC]Wu\xE7o\xAD\xB5ϳc\xC7(\xAD<!\xB4Uc\xB5\xF1@\x13FmE\xCBGJܖ\bD\xCBG\xA0L5\x82\x89\t4\xA1\x01ڤ!-\t\xA1!Q\x02\xA5\t\xA1\xE1\xC3I\x93\faڐ\xA8\x95:\xD3a\xC2\xC7LU\xE4\x82\fB$-\x9A\xA9D\x8CS\x1B\xD5\x16\x91 QԦ\xC4\xCF\xC4\xEF\xEC\xB5V\xFF\xD8{\x9F{\xEE}\xF7\xF9\x9Es\xDFG\x9E\xFD\xEEOz\xBA\xF7\x9E\xB7\xEF=\xFB\xEC\xF5[\xDF\xFB\xDEC\xEE\x8E\x196.\xF8ٞ\xC0\f\xCF.f\x04\xD8\xE0\x98\x11`\x83cF\x80\r\x8E\x19\x0168f\x04\xD8\xE0\x98\x11`\x83cF\x80\r\x8E\x19\x0168f\x04\xD8\xE0\x98\x11`\x83#\xF4}\xC35\xEF\xBE\x17f\nw\x87\x99B\xDD\xE1nPS\xA8)\xCC\x14f\x06\xD5\bwC̯\xD3q\xDDjf?\xE9\xEE?\x13M_\x00\xF8٦v\xA6\xBA\xFE(\xB9\x9Fa\xF0\xADf\x1E\x00?\xCD\xDDO\a@\xEE\xEE\x86ԯ\xA01}\x8Bg\xBB\x97AD\x8B\x8Ey>\xC6 P\x1A\xE0Dt\x14\xA0\x1F2Sdм\x13\xFD\xAB\x90<\xC5\xC2\x8F\x03t \xB0\xEC'\xA2#\xCC\xFC}fy\x8AY\xC0\xCC\b, b\x88\x0403\x98\x05\x92\xFF\x88\x18B\x04f\x01\x11\x81\x88q\xDB]\xEF\xE85\xFF\xDE\x04h\v?\x9A\xC1\xDD\xF2\xF3,x\xABa\xDAz\xAD\x11f\xFA\xD3f\xF6\xAAh\xFAJS}\x91\xBA\xFE\x88\xBB\x053'w#u#r\x17u#O\x84b\x00p\a܊\x80\xD3\xE3\xA8\xC0ݭ\xEF%\xAC(\x88x\xE4u!Dz$&\xE4C[\x88؈\bB\xECNdB\xEC\x14ɘ9\xD6Ğ\b!\xFF\x10X\xFE\x86\x99\xF71\xCB\x01˂w7\xB0\b\xC4\xF3\x1A\xB8\x83Y\xE0\xC4\b\x00\x98\x05@\xFF\xB5\xE8M\x80\xB6\xF0\x93\x05HZ\xAF\xAAP\x8DP\x8DY\xF8\nո\xC3\xCC.\x8D\x16_\x1B5\x9Em\xA6[\xCCl.\x9AҀH\x06\xB7dE\xDC\r\xEA\x06\xC0\x91\x88\x90\x84\xBD\x94\x05\x18\xA7\xFCe\xECj\x81\xB1X\xE3G\x8D@\xDB\x02\xA4\xFFS&\x06\xB1\x10\x83ҟ\x10\x13\x98\x19\x94\xB58\xB0\x9C\xCE\xC6\xFF!\xB2\xBC\"H\xF8^\xE0\xF07fz\xB7Hx\xD4\xD8\x10\xCC\xE0\xE2\x10\t\x00\x1C\f\x87\x90 \x02-\x12\xF4\xC3T\x16\xA0-\xFC\xA4\xE1\x86\x18kD\x8B\xD0\x18\xA1\xA6\x9B\xA3\xC5w\xA8\xEA\xEE\xA8\xF5\xF3U\xE3V3\x93L\nD\xB5\xEC\x1E\"\x00G4\x05\xB9gw\xE2 w\x18\xBC\xD1~Ϥ\x18Z\xE4u\xD6\xC6^\xEC\n\xA8\xB1\x0E\xC4\x04\x06\xC13\x11\x84\xD2\xF3\xC0\x02\x80\x108\x80\x88a\xC2$\x1263\xCBfո-J\xF8\xF1 \xD5.q{ \xB0|\xCA9\x1C5\f\x14\xC3݁\xAC\xF8\x85\x04}\xD1\xFB=\x8D\xCF\xF7\xA2\xF1\n\xD5\x1A\xAA\x8A\xA85T\xE3\vj\x8D\xEF\xD1\x18_\x13\xAD>KU%Y\x85\b\xD3$\xF4\x12\x1Fh\xB6&\xC9\x02h\xA3\xF5ֺ@\x1Fg\xFAי\xF0\x1B\xB4HP\bA\xA0\xE69g\x02D\"\x10\t\"'\xCDW\xAAAĨUPI\x05\x16F\xE0\xC0f\xB6\xCDL\x7F.h\xF5\\\v\xE1g*\xF1\x8F;|?\t\x008D\xAAt\xB2L\x02\x1D\x13\x8FL\xC2\x14.\xA0\t貏\xAFQ\xC7\b\xB5\x88\x18\xEB\vk\x8D\xEF\x89Z_\x10c\xDC\x16-\x92\xC5\x1AQ\x15\xB5֭XAa\xD9rX#t\x03ܡn\x03\xCD/>-[\x84\xE1y\xAC/\x12\x8CZ\x00\x065\x84 \f,\x81\x10\x03D`ʦ\x9F\x92\x1B`\t`\x16\x98)X\x05&\x86`\n\xB3\xC0&\xFEc\x01\xF6_\xDC\xFD\xC7+\xF7\xDB\x01\xEC-J\x92܋\x02\f\xB0\xF7O\xEA\xFA[\x80,DUE\x8CI\xF3[\xC2\x7F\x7F\xAC\x8F\x9F\x1FM7\xC7X\xA3\xD6\b\x8D5j\xAD\aqA\xAC\xA1\x96\xB2\x06\xB8#\xAA\xC2a0\xB7l\x01\x00\x8C\x98\xB9\xB6\xF0\xC7e\x02\xEB\t\xDE\"\x02\xB7\xB4\x9F\x88\x00M\x01!\x15\x02\x80\x11D\x00\"\x88*\x84\x19\x16\xAA\x86\bf\x15\xC4\x1D\xE2F\x80?\af\x17\x02\xD8bp\xCC\x05\xECe%\x00u>\x1BAI{\xCFw*\x02\x94\xE8>ZDԺ-\xFC_\xAA5n\xAA\xB5F\xAC#j]\x18r\x0FQu\x90.jLڞ\x03AC\xF6\xFDf\xF0B\x80\x96\xB0m\x89,`\xBD\x81Z\x01\xA0\x0E\x0E&ME\xD2v\xA7\x14\x1303\xA2%\xAB\xA0\x12Rzg\x96H!\x15\xDC\r\xE2\x86\xCA\xE6\x92r\x84\xB9M\x00^\x06lz\x7FDm\x00\xBE\xEC\x04 \xA6ldM\b`\xA6P\xAB\x93\xFF\x8F\x11\xAA\xF1\x85\xB5ƫc}\xFC\xFCZ㦅\xB8\x00\x8DI\xF81FԱNnBc\xB2\x1EZ纀5\xF5\x03\xCF\x04X\xCA\x02\f\x9D\x7F\x8ATg-\xC1\x18\x9F\x16\xE6,``\x01@ f\b\v\x94\x18l\x9A\xF2~\xA9\xA0&03H\xB6\x00)\x00\x9E\xC3B\xFA\xC8M\x00\xCE\a\xF0\xFBD\xF48\x81\xF6s \xA8Ջ\xB2\x91.\x98\x82\x00\xD6\xE4\xF9j\xFA\x9CZ\xE3UQ\xEB\x97G\xD3͵\xD6\xD0\x18\xB1\x10\x8F\xA3ֈX/ \xE6԰\xCE\x16 Z\x84kv\an)\xD7/\x96\x00\xD9\xFF\x8F\xA4\x7F\x00\x96$\xC4zð\xC0\x13\x9Aԑ(g\x04\xC9\xFF\x931\"E\b\xA5\x02\x0F\x89\xC0̓\x05\xC8\xC1\xB0{\xD2jw\xC7\x1CPH\xB0\x19\xCC\x17\x10ѕD\xF4{d|\x9C\x95a\xB4\x06i`;Ϗ\x16ߡ1\xBE&Ƹ-Ɓ\xD9O\xC2?\x8E:\x16\xC1'7Pb\x80R@RW\xB8\xB6\xB5\xBF\xB0\xBD\x14\x81\x86\xB5}\xB5s\xFC\x95\xC2h\xAD\x80\x98\aک\xD4\xD4\x05\x18\x04\x92$8\xB2\x14\xF4QHY\x96\xB9!\xB8\xC1\xBD\x1A|N\xB6\"u\xCA\x1A\xB61\xF8uJ\xFC-f\xBD#\x1A\x834\xF6\x9E\xEB\x94Y\x80A5\xEETշD\xABό\x16\xA9ցُ\xF5\xC2\x90\xF0c̱B\x8E\xFCS\n\x99b\x89d\xEEѸ\x81\x12\xE4\x8DM\xFF\x86汾\xC8\xD0\xD6x\x1D=\xAE\nʤ\xF0\x96\xF97\x02`\x04e\x85\x88\xC0]\xA0n\b\x12\xE0^-q\x8DɊ(\xD5\x14\x99\xCEb\x93\xB7\xB1\xC6\xCF\x13\xF1\x11\xA15\xC8\x02\xA25şߍZ\xBF@U\xD9b\x9D\xA2{\xADQ\xC7$\xE8\"\xFC\x85\xFC\xBF\xA8Mu\x101W\x015\x17\x80\x1CÕ?\xB4ҿQ\xAC7\xC1\x17\x94Y\x8D\xA6\x83\x9E\x0E\xE6WI@N\x04\xF2\x14\x14:\x11ē\xCFw6\x88\x84\xEC\x16\x1D\x86a\xED'\x8AP\"(14U\x0F9r\xFD\x1F\x03˥fz\x83ٚT\x02\rf\xBA3Z\xFCu\xD5xZ\xA9\xEC\xD5\xD9̧\xA8?6\x9A_\x84\x1Fm\xE0\x06\xA2f\xC1{\xAA\x03\xA0\xE5\xE7Ң\xE5\x1Cז\x16\xF6z\xE3A\x91\xF1\xB8i9\x97z\x805\x83\x131R\x13\xC7\xDCs\xFA\x98R^i\x05\xBA)\x95\xACS\x9C@\x84\x9AS\x8515\x8B\"\x98yk\x94\xF8z6\xFE\x8C\xBA\x1D\xEA;全\x003{E\xD4x\xA6\x99Q\xB4l\xFAs\x84_g\xEDo\xA7~E\xF8\xAA)\xFDK\x82Ou\x80R\xED#\x1B\xF8\xFEf\xE1z\xFB\xFC\xB5\xCA\x10\x16\x9B\xDA\x13\x122\xFB\x04\x87\x83(\x91ę\x92\xBB#\x82\xE6ʠ\xBA\xC3G\x94\x98\xA8\x06Q\xF2\xFB\xC8E\xA3\xC8\x02\xD6\x1A,\f\xB1\xC0Q\xE3\x8E\xC0\xE1Uf\xBA&\x04xN4\xFD53ݔ*z\x83\xCA`\xC9\xF3c\xA3\xE9\xB1\xD5(ʹ\xBF)\x90˾0k\x16n \xEC\xA5\xCD\xFF\xFAA\xFF|\xBB\x98\b/\xD5:\xCD\xD7L\x00\x98\x01r\xE8H\x14\xCF`D-\xE5d\x06sZ[\x96\x94MUZA9BDN\x8B\xA6\xAF\x14\xD3\xCF\x008\xDAgZӸ\x80\xE7\xB9ًrW/\x15\x83\x9A\n_\xD6zK\xA6\xBF\xD5\x0E\x1E\x12\xBE\xB9\x01:\x88\xF8\x01\x1B\x11\xF8z\x16\xFE\x94pG\x92v&\x0F\x11\x00N\x87\xD5\x00\x02H\xD2\xD3\xF2o͕D\xA3\xB4ά\x94\xEA\x06\xB1\x06\xB3\xA0\xD6\x1AA\x04f6g\xAA/\x8A\xA2?\x01\xE0@\x9FiM\xD3\x0E\xDE\x11-\x9E\x91Z\xBA\x03\xED/\xE5]3\x83k\xCA\xF1\xD55\xBB\x06M\x1D\xBDE\xC2o\v~\t\xA1\xAFkK\xD0\x01CA\xA1\x8F<\xD5\x16\x11r\xB6 \x809\xC1U\x01\x10\xC8\x19d\fV\x85\xB1 Ƙ+\x86\xC5\xCA\x1A\xD8\x14\xE2\xFA\xA3s\x8Es\xB1\xDA\x04P\xB7sݍ\x90\vBI\xBB\x93`K\x83h\xD0(\xD2A{\xB7\x98\xFD\"|/ftD\xC0'\xBB\xC0G1z=\r!\xBC\xF5\xA0\x00I\"A\x0E\x8A\xD99eJ\xAA\x10\x92fM\x9D\a\xA5t\x97\xD04\xE7\xF2\xEE\xAB\x17\xF4\x9D^\xEF\xC4\xD1ݞo\xE6\\4\xBC\xB4\x87=[\x80\xB2\xA9#m\x14\xC9V!w\xFA`\xA5\xAF_\x82\xB5S\\\xF8\xE3\xB0\xE8\x1A۱O^\xA3\xDC\x1Dm\xFA.^\xAA\xA6im\xAD\xD4b\xDCSe5\xF5P\x04\xF0\xB3\xFBN\xA77\x01L\xED,w\ve\a\x0F̒\xF9\xCF\xE5\xDCD\x02\xC05]\x10\xF9 \xC7\x1FX\xFB\xB6\xFFϯ7\x82\xF0\v\x16]\xEF\xE0u\xA9\x01\x14\xCB\t8\\S\xB0\xACe\x17\x95\xA6\xF4\xB9h~꫸\x98\xDAs\xFBN\xA5?\x01`g\xA8\x1BL=kx\xE9\xE8iKХ\xBC[\xA2{[\x1C\xE5\xB7\x17c\xA3bѵ\xA7\xB5\xF1\xEC\"=\xAFaZ\xCBdeS\xB74\xB7\xCEm\xB0\x7F\"[\xDD3\xFAN\xA1\x7F\xED\xD0\xEC\fr\xA7b\x01<\avV\xF6\xF3\xB55>\x93\x03^\xF2|_\xAC\xFD3d\f\xD6fP\x13\x19\xACa\xD9\x17a\xF0f\xBD\xDD\a\x055r'r?\xA3\xEFY\xA7\xB0\x00~\xBA\xBA\xB17\x9D<o\x84NyG\x8F\xC1\x9A\t\x0F\x97xG\xAFyF\x84\xA5֠-\xF4\xA6S\xEA\x03\x97:P4\x94؀\r~z\xDF\xD3\xF7'\x80yh\xB3q0Id_\x84\xD6V\xEE\xD1\xEB\xB4\xD1\x033\x00#kaC/\x9B8\xC0\x86׸\x89\xB9\xDCZ\x1Bk\xBCwV7\xCD7\x836\xB7\x03\xBB\xC1.\xD5\xC1\x06\xCEƔ̈́\xDC\x13\xAD\xFD\x0FC\xD9\x12\x06A\"\x06.t\xD0\x1Eo\x02\xC6\xCD}\xCF8\x05\x01|\x9B\xC1\x1990A\xD6\xF8q\xFD|4\xD3<ū|+\x89\xB1\x1D\xD0\xF28\x88\a\xD2ƙt\f\x00\x92L\xB0\xAD\xEF馨\x0387\xBE\x1F\xD9W\xB5\x98\xDA\xDE\xC4\xE9\x18\x17\x00\xCE0\x19y\xCD|`U\x17\xED\x8A\xCE1\x01\xD0r\xBD\xDE\x7F[\xF04\x04\xB0\xFC8\xE4\xEBG7q6\x19\xC0\xF8\x0F\xE9{\xDAS\x1F'\n\x06m\xD8\x15\xF8\xD0:\x0Fɠw;t\x9A,\x00n\x8B\xB5\xFCdٵ{2c\xE8\xABr#֡-\x93>X\xD6\xD7ËOZj\xA23\xAC\x1C\x16\xEF\x8E\x1E\x14ݖ\x83)\t0\xDC\xC1\xB3%\xFC\xD4\f+\x8F\xC5k<\xA1\x9B:\x01\xBD\tPR\xC0I)\xDE\xCC%,\x1F\xA3ߎ^\n]e2\x0E\xD3|\xA1\xF4\x84\x930\x9C \xF8\x1B\x83\xCB/ۍ\x97_p\xFEJMc,\xBE\xF6կ\xE3\x9E{\xEF\x1F:v\xCE\xCE\x1D\xB8\xF1\xFAk;\xBD\xFF\a\xFF\xF64~\xE7\xCAkz\x9F\xB7ϵ}\xEB[\xFBq\xEBG\xEFX\xF2\xFF\xA3\xD5\xC0\x95\xC2\xF2\t\xB0\xCCɼ\xFC\x82\xF3q\xF1[޼\xECiL\xC2(\x01\x0E\x1D<\x8C\x9F\xFFٟ\xC5y\xE7\x9D\xDB\xE9\xFD?\xF8\xC1\xBF\xE1\xBA\xEB\xFF\xA8\xF3\xF9\xCEٹ\x037\x7F\xF0F\x9C\xB9}{\xA7\xF1\xBF|\xE1\xAB;\x7Fv\x83\x15 \xC22\x83\xC0\x13\x9B\xF9\xC1\xFF\x97s\x96\xD5û\xAF\xBC\xBA\xF3\xD8ߺ\xF4\xED\xBD>\xFB\xC6\xEB\xAF\xED,\xFC\a\xFE\xE2/\xB1o\xDF7\x86\x8E\r\x8A?\x93\xD6vy\x8B;5\x01֫P\xFB`߾o\xE0\x81\xBF\xF8\xCBNc\xCFܾ\x1D\x7F\xFC\xA1?\xEC4\xF6\x9C\x9D;\xF0Ƌ.\xEA4\xF6\x89'\x9F\xC4M\x1F\xBA\xB5\xD3إ\xB0\x1CYLS\bZv걞pӇn\xC5\x13O>\xD9i\xECo]\xFAv\x9C\xB3s\xC7\xC4q7^\x7F-\xB6n\xDD\xD2\xE93o\xBF\xFD\x138t\xF0p\xA7\xB1'\xC2R)\xF9$l\xF8\x9F\x89;t\xF00n\xBF\xFD\x13\x9Dƞ\xB9}\xFB\xC4\xC0q׮\x97v\x8Ei\x1Ez\xF8a\xDCz۞NcW\v\x1B\x9E\x00\x00p\xEBm{\xF0\xC8#\xFB;\x8D}\xE3E\x17\x9D\xD0\n\xDC\xF0\xFE\xF7u\xFA\x9C\xF9\xF9c\xB8\xE6\xBA\x1B:\x8D]M\xAC!\x01ַ\xDBx\xF7\x95Wc~\xFE\xD8\xC4q[\xB7nY\xD2\n\xEC\xDA\xF5R\\x\xE1\xAFt:\xDFg\x1F|pQ\xE07\xC0ڭ\xD5\xD4i\xE0ZW\xFD\x0E\x1F9\x82\xF9\xA3\xF3S\xBD\xF7\xB1\xEF>6q̾}\xDF\xC0g\x1F|\xB0\x93\xF9NV\xE0\xD6E\xBE\xFBO?y{\xA7\xF9<\xF1\xE4\x93\xD8}ɻ:\x8D\xED\x82\xE5\xC8b\xC5\nA\xAB\x8D[n\xF9\xE8\xA2\\~\xA5\xB1\xFB\x92w\xE1U\xAFz\xE5\xC4\xF4\xADX\x81\xB6\x10/\xBFlw\xE7\x9A\xC2\r\x1F\xB8iY\xF3\\I\xCCb\x80\x11t\x15\xCEh,p\xC5\xEFv\xD3\xE8\x87\x1E~xՉ\xDC\a3\x02\x8C\xE0\x9E{\xEF\xC7C\x0F?<q\\;\x16\xE8\xAA\xFD\xF3\xF3\xC7p\xF1\xDB~{\xD9s\\I\xCC\b0\x06\xD7\\wC\xA7\x80\xB0X\x81\xB7\xBF}w\xA7Ͻ\xEF3\x0F\xACHο\x92\x98\x11`\fJ@8\t[\xB7n\xC1\xDD{>\x8E\x97\xBC\xF8\xC5\x13\xC7\x1E>rd\xAA\x86\xD2jcF\x80%\xB0\xFB\x92wu\xAA\x10vM\xFBn\xB9\xE5\xA3˜\xD1\xEA`F\x80\x13`\xA5\xA2\xF5\xBD{\xBF\xB2\xAE\x02\xBF6N\x9A4\xF0}\xEF\xFB\x83Α6\x00|\xFE\v_\xECվ\x1D\x87{\xEE\xBD\x1F\xBF\xF9\x9F\xDF\xD4Y\xCB\xC7a~\xFE\x18\xDEy\xC5U˚\xC7j\xE2\xA4!\xC0\x8E\xB3\xCF\xEE5\xFE\xFF\xFD\xE3?\xAE\xC8y\xDFy\xC5U\xF8\xFF\x7F\xFF\xF5\xCE͝Q\xEC\xB9\xE3\xCEu\x17\xF8\xB51s\x01\x13p\xE8\xE0a\xDC\xF7\x99\a\xA6z\xEF#\x8F\xEC_\xB6\x15Zm\xCC\b\xD0\x01\xBFs\xE558|\xE4H\xEF\xF7\xDDx\xF3\x87Wa6+\x8B\x19\x01:\xE2\xEE{\xEE\xED5\xFE\xA1\x87\x1F\xC6_\xFF\xAF/\xAC\xD2lV\x0E3\x02t\xC4\x1B\xDF\xF0\xBA^\xE3_x\xDE\v;m\x1Ey\xB61#@\a\\~\xD9\xEENŞ6\xB6n݂\a\xFE\xFC\xBF\xADҌV\x0E3\x02L@\xD9\xDD;\r^\xF2\xE2\x17\xE3\xF2˺\x95\x89\x9F-\x9C4i\xE0޽_\xC1\xF7\x1E\xFF^\xE7\xF1_\xFB\xEA\xD7W\xE4\xBC}v\xF7\x8E\xC3\xCD\x1F\xBCq\xDD\x16\x81\x80\x93\x88\x00\xFF\xE3\x7F\xFE\xF5\x9A/d\x9F\xFD}K\xE1\xCC\xED\xDBq\xFF}w\xAD\xE8\x06\x90\x95\xC4\xCC\x05\x9C\x00]w\xF8L\xC2\xC5oy3v\xEDz\xE9\x8A|\xD6JcF\x80%p\xED{\xAF\xE8\xD4\xE3\xFFߟ\xFB|\xA7\xCF[)2\xAD4f\x04\x18\x83sv\xEE\xC0\a\xFE\xF0\xBA\x89\xE3\xE6\xE7\x8F\xE1\xBD\xEF\xFB\x00\xF6\xEE\xFD\xCAı\xE7\x9Dw.\xAE}\xEF\x15+0\xBB\x95Ō\x00cp\xDB-\x1F\xECT\xFB\xFF\xEC\x83\x0F\xE2\xD0\xC1ø\xF9÷t\xFAܫ\xAF\xFE\xBDuW\x1B\x98\x9A\x00\xE3n\xA2|*\xE0M\xBF\xF1Z\xBC\xE1\xF5\x93\x8B>\xF3\xF3ǚ\xAFt\xED\xDB\xF7\x8DNV\xE0\xCC\xED\xDBq\xDB-\x1F\\\xEE\x14\x17a9\xB2XC\vpr\x18\x9B\x8F~\xA4[\xF3\xA6h\x7FAW+\xF0\x86׿\x0Eo\xFA\x8D\xD7N\x18\xB5vkurH\x05\xC0\xDDw\xED\x81\xD7OM\xFDץ s\xE7'?ҩ\xED<\xEE\v\x9D]\xAD\x00\x00\xDCt\xC3\xFB;\x8D[\v\x9C4\x04Xm\x9C\xB3s\a.y\xEBŝ\xC6\xFE\xF7O\xFF\xD9\xD8\x1E\xFF;\xAF\xB8\xAA\xD3f\xD2\xF3\xCE;\x17w~\xF2#}\xA7\xB8*\xE8\xFF\x131\x94\xEE_s\xAA\xE1\xEE=\x1F\xEF\x14\xF8=\xF1\xE4\x93K\xF6\xF8\x0F\x1D<\xDCi3)\x00\\\xF2֋W4 \xA4|7\xF2\xBE\x98Z\x92\xD3ܧv\xBD\xE2\xF2\xCBvw\xDE\xF65i\x9F\xE0M\x1F\xBA\xB5\xF3w\f\xEF\xDE\xF3\xF1N眄\xE5\xC8bY\xAA<\xEE>\xB9\xE3\xFF\xBF\x9C\xB3\xAC>\xBA6{\x1Eyd\xFF\xC4r\xF4\xA1\x83\x87\xB1\xE7\x8E;;}ޅ\x17\xFEʒ\xB1IY\xB3\xC9k\xBB\xBC\xC5]\xBE-_\xEFҝ\x80\xFBﻫs\xB3g\xCF\x1Dwu\x1Aw\xDD\xF5\x7F\xD4\xF9G'\xA6\xED4\x02X\x91\xB5_1g\xEE\xCD\r\x91\xA7\xF3E\xCF\x06v\xEDzi\xE7\x9Fr黵\xBBϏN\xDC\x7F\xDFdb\xB5\xD7\xD6Wp}\xFB\xFFDL\x16\xF4\xA4I\x94\xE2\xC4z&\xC3G\xFE\xF8\xE6λ}\xBB\xE6\xF9\x05}\x7Ftb\\\xB3\xA8\xACݤBOW\x99\x8CÔ\xED`\x1AyL\x98\xA6\"\xB5R}\xFBI\xF8\xF6?\x1D\x1Cz}\xCE\xCE\x1D8x\xE8;8x\xE8;\x13\xDF\xFB\xD8w\x1F;\xC1\x8F9,\x8D\x1Bo\xFE0\xDEp\xD1k:\x8D}\xD9K~\x11\xFB\xBE\xFA\xD0\xC4qe\x8Dy\x91\f\xA6S4\xEA\xFB\xC3B\xAF\xF8\xD5K\xE7\x17\x8E\x1F\xDF\xF2\xC3\xFA\x18\xEA\x85\x05\x1C\xAF\x9F\xC1\xC2\xC23x&.@\xEB\x05,\xC4:\xDD9\xBC\xAE\xA1\x16\xE1\x16\xE1\xF9\xFE\x81\xE9^\x81\xB3\x9F\x8D_\x12D(\xB7\x10%\"\x90\b\x88\x03\x84\x03BU\xA1\x92\ns\xA1\x82Ts\xD8\x1C\xE607\xB7\x19\x9B\xAAͨ\xE6\xE6pZ\xB5\x05s\x9B6\x1D\xFB\xBB/\x7Fzk\x9FSN\xF1\xFB\xF2\xE9\xFE\xF5\x8D\x89\a\xA5\x9B\x1A\x9F\x04&\xFFdǐK\xA0t\xFB\xF9\xF2\xBA-\x93>\x98\xA6\x10Լ\x87\x98\xDAǇ\xA2R\xE2\x13\x04\x833\x92,\xC6\t\xD2=b\x1E\x1AGC\xEBL\xED\x94p\xF5o\x18ADF\x04p\x9E\x14\x11\x81F>f\xD4:8g\xD36\xC3dd7\xE0<F\xCBۂoe[\xA9:\x9Bd\xD3\xF7tӤ\x81O3҉\x888\xB9\xAC\xCC\xC2v\x99x,\xA1g\x9A?\x01m\x01\xA7\x9BJ\x03\xEDek\xAD3SZ{bd:\x18@O\xF7=\xE3\x14\x04\xA0g\x9C\x06\x1AݎF\v[\x87\x05̓\xE3y\xDC\f\xDDѬ5\xB5\xAC*J\xCDe@\x88\x9C\x02>\xD3\xF7\xF3\xFB\xFB\f\xA6HD\x10bHn@\xA4\xC7\xE4\x16\x88Jl0\x9C\x97\xA6\xA7þl\x86\x8CQ\x85\x19\xB34\xC9\xCA\x0E֘[$h\x9E3ž\xA7\x9E&\v8*\xC4FY\xE8%\xF8+,lW\xAC\xDA\f\x1D\x8B\x19\tN\x1C\xFC\xB5֐\x91\x14\xAE\xACqYs\xCAn@\x88\x8DAG\xFB\x9E~\x9AJ\xE0SN\xE4\xD4LF\xC0\xC4\xE9\x0F\x8B\x85^\x1E\x9B@\xB0\xE5>fhc\xB06M\x00\x983\x00j\t]\xCAZ\x13\x83Hr\x1B\x98\xE1D\x0E\xE6\xA7\xFA\x9E\xB57\x01\x84\xE4)!\x06q6\xFD%\x00\x04'\xF3\xC4iB\f\x02K\xF6\xFF$\xAD8`\xE4\x94\x1B\xD9\n,\xBA\xF6\x1C\xF4\xE5\x00\x90@-s? \x02s*\x14\t\xA75g\xC9\xC4\xC0\x1A\x10\x80\x85\x1F'\"\x95\x1C\xF13\v\x98\xB2\xB0\x89 ,\xC9,I\x8AN\x9D\x06\x16a\xF8z[/6\x1A\tFj&CA\x1E\r\xCC\x7F\t\x00I\x92\xBB\x95\"xb\b3\x90\x95-\xFFE\x16\xFE~ߩL\x93\x05\x1Caf\x053\x02\a\bQb!\r|T\n\x10\x05\xCC\xDCLz\xA8\x1E@2\xB8\xF0%\x17\xE5\x14Ţkl[F\x02\x98Se\x95\xD2\xDA1\xA7\xB5\x94,hai\xAC\xAC\x105\xFFc&#\xE2G\xFBNg\x8A,\x80\x0F\x14\xCD/\xECc\tYЂ\xC0\xD2\xFCO\xA4\b\x9F\x9BX!]\xFF(\t\xC6\x10\xE1T!Ē\xD7ӊ\x89H\xD2s)\x96R\x1A\xCB)\x92H\xC0\xDCz$\x06KZg\x16)\x96\xC0\x85\xF8\xDB}\xA7׻\x1BHD\xFB\x85\xE4_\x02\xCBV\x13F\xADi\"\xC2\x8C \x02u\x06\x89 \x98\xC2]\xE0l\x00\x1C\xEA\x0E%Iת\n\xF76\tl\xE4\xB6w\xED\xFB\xA7\x9F\x02$h0\xEA\xF6xp\\\x92\xD6#+\x8AHR\xA6F\xFBe`Q\xA5!D:\x16X<px\x8A\x88\xFE\xB9\xEF\x8Cz\x13 \xB0<\xA6\"\xDFd\xE3\xE72\xCB\\\xE0\x80\xC8\x11\xCC\x01\"\x06QE`\x83\xB3\x80\xDD \x12\xD2].\xB3\xACՒ\xDC\xDD\rd\xA51(\x00\x15\xA1[Z\x90S\xADcHmS\x0F\x142$\x1E\xE4\xB2.I2\xFB\x12\x92RIH\x02\x0EU\xEA\bJ\x95\b\x10*\x04\x16\x04\x0E\xD9\xE2\xF2\x021\x7F\x93\x99\xBB\x7F\x7F>\xA37\x01\x98\xE5h`\xF9Rd\xF9U\x910'!\"X\x80\x05\x83YD\b\xA1\xB9\xB3\xB5\xC3\xE1\x0EHs/\xC1t:s\x02\xBB&\xA1\xBB\x03\x96\x84ސ\xA1Y\x9F\xBE$X\xAB\x1B-\xF4\xF5\x9C\xA3\x05\xB1\x94\x16\x13\xDA9}1\xED\x01\"\x92M\xBF d2\x04I\xE4\b\xC5\xF4\xB3\x80\xA5\xB1\x04\xC7\x03\xCB\xFFe\x96ޥ\xE0)\\\x00\x83\x99\xFF6H\xF8m\xD5\xF8\x9F\x02\a61\x98),T\x107\x98\a\x98\x1B\xD4\x03B\xD1\xE4\x00\xA8*\x88\x00W\x059\r\xEE8N\x9AW\xA5uCj\x00'jm\x8C7\x102\xEE\xE0\x9A\xE0D\x9Eʹ]\xC6-\r4\xA0\xF4\xFD\xB9\x04\xCFY\xB8\xC9\xFCW\b\"I\xEBEPI\x85J\x92\x15\b,\xA8d\x0E\x81\x03\x98ك\x84Ǚ\xF9\xCB\xCC\xD2\xDBlN\xE3\x02`,\x87\x98\xE5s\"\xE1\xA7\xCCl[0E\xB4\x80\xCA-\xDD\xCE\xDC\xCB\xDDņ\xE7\xC3`h\x0E~\xDC\x1Dj\nv\x87\x83\x87n?OE\x93i\xF1\xF5x3f}b\\ՓF\xCC\x7F\x93\x16\xE74\xB9\xE4\xF5\xA11\xFBY\xE3C\x85\x10\xB2\xE9\x97\x00i\x91!\b\xE7cᇁ\xC3\xFFa\x96\x7Fb\xEE\x9F\xD4M\xE1\x02\x92\xD9\t,\x9F6\t\xBFn\xA6?o\x16\xB8ʷ\x93\x13w\xB8+ܫE\x8B\x105_\xBCs\xB6\x06\x04\xC0aj\x00\xA5[\x9F\xA4ۢJc\x05FIT\x96r\xBDݓx\xE2\xF6\xED<s/\xE5]\x1EdD\xCC)\xE8+\xA9s(\x9A\x9E\x85\x9F\x04\x1EP\x85*\x91 T\xE0PAD,Hu\x80\x99\xEF\x14I\xF1@_L\x13\x03@\xC4\xE0\x1E\x8E\x04\xB3?7\xB6\xE7\x99\xF8\xF3č*\x9B\x1B+\x18\"\x82R\xAAl\x19)\xC8Rn\xAB\xAEp5\x18'k\xC1\xEE@#x\xC0͆T\xBD}o\x9C\xF5j\x01\x80\xC5{#\a\xC2\x06\xDA-]\xCEE\x1E\xC9%ݐ\x03\xBE\xC6\rd\xE1W! Ts\b!\xA0\x92\xB9\xE4\n8x\xE0\xEA\t\x11y@$\x1C\xE4\\\x1B\xE8\x8B\xDE\x04\x10\tp7\x18\x1BD\xE4S\xE2\xE1\x85\xE2\xFA\xE6ʫ\xE7\xB8;\xAA\x91[\x9A6\x17K1Y\x01S\xB0*\xCC\x14\xEC\f\xCF\xC2on\x8El\x03W`-\x97\xE6\xEE\x10\xAC?\xCD\x1FŸ/l4\x84\xA0\xB2u\xAB\x94us\x85\xAF\xD4UDr\xB4\x9F̼HH֠JB\xAFd\x0E\xA1\n\b\xC95<-!|!p\xB87[d\x88\xF4\xDF\xE3;\x9D\v\x10A0\x83s8^\x89\x7F\xD2\xDD\x7F\x82\xDC/\x04\xB0\xB9=\xB6&\x02QL\x05.\xE2\xDC/\x880\x16DS\x84\x1C\a\xB8YJ\x15\xDD\xE1\f\x00\x83\xF8aT\xE0\xB6\xCEo?\xC7#\x19\xC20!\x9A\x9D;\x8D\x1B\x90\\4\xE3\\\xD7/\xA9^\x95}~\x95\xE3\x80J\xE6 !$w\xC0\xF2L\x90\xEAk\x95\x84O\b\xCB\xD3!\x17\x84\xD6(\x06\x10\xB0;\x98\rA\x1C\x0E\xDF/n\x7F\x02̝\x06\xE0\x97\x00l*\x17\x9CL\x7Fb\xBDR\ra\x81\xAA \xAA\"\xB0B\xDD \x1E`\x99\x00\xE4\x0E3\xCB\xE9\xE3\xF0\xEEa[\"&Xo\x18\xBB\x97\xBF\x15\xF41s\x13\a0\x0F\xF6S\x94jjI\xF5J\xF4/R5\x9A\x9F3\x81\xE3\xA1\xDA\xF4\xF5J\xC2\xED\"\xE1[\x12B\n\x069\xB9\x8E\xBE\xE8\xEF\x02X\x92\x10B\x05\xC0a\xEE\xA8Ŀ\x8C\x14\xE2^\x0F\xE0e\x006չ\x95Y\xD3\x02\x88\x18\x91\x05\x1C#\x84\x19\"\x065M)\xA3\x1A\\\f\x96\xEF}\x9B\xE4;l\x01\f\xDE$x\xB4\xCE\t\xE0#\xA6\x7FI\v\x90-b\x10Im\xDE\\\xE1\x93\x1C\x03\xA4T/\x05|\x95d\xB3\xCF\xF2L\x16\xFE\x87C\xA8\xF6V\x92\nD\xA5`$k\x12\x04fs\xE5\xCE\x10\x19\x8A\xF4\xF7\xA6\a\xBAډ. \xA2mJ\x11D\x80q\x00k\x8D\xC8\f\xB3\x001\x85iL\x9A/\xD9\xFF{*\vjI%\x01x1\xF7\x99\x04m\xAC7K0\x9A\x05\x94\xAD\xDB\x00\x9AM\xB3\xA5\x85^\x9A=\x89\b\xB9\x99Vҿ\\\xE4I\x91\xBF\x80C\x95\x02\xBE\x10\x9E\x0ER}\xB5\x92\xF0\xB1\x10\xAA\xBDI𒪄\xA5l\xBCfY@*\xEF\x8D[\x84\xBDJ\xF1{Dt\x95\x92\xBC62?\x97Y\xB8\xE6\x1A,\x8C\x10\x03\xA2E\x98)\\\x02\xD4==\xB7\x92:\x162\f\xB4\x7Fl:\xB8΄ߠE\x82v\xFA׸\x85\xA1ָ\xA4\x80\x90\x05\xA5\xB5\x9ER\xB9\x90\xD6*k\xB6\x88h\xE0\xEA\xFB\x12\xC2\x17+\t\x1F\x13\t\a\xAA\x96{\xE0V_`m\xB2\x00\"8K\xAA\xBA\x8E\x90\x80\x8C@\xA0\xFDD\xF4\xFBJ|\x80\x8D\xFFk专\x99\xB7\x9A\x19+GT\x16\x10\xD5\xE0n\x88\x16\xE1nP7\x90\xA7\x86\x91{\x8E\x05\xE0\x03K੡\xD4\xC6z\xB7\x00@k\x87t\xFE\xD2F\xD3\xE1˽\xFE\x94\xB7\x13\x02\x87\x94\x06\xE6\xE2Nn\xF2D\x91p,H\xF5\xA8\x88\xDC\x1F8|JX\x9E\x91\x90\xBF)\x14\xAA\\?\bM\x1A)S4Φ\xB2\x00\x01@\x04\x86H@D@\xAC\xC1\x81@\xC6O3\xEB\xED\xAC\xFCEfy\xA7Ixu\xD4\xF8<\x11\xD9df\x9Bؔ\xCC\x14\x95%+\x90,\x805d(1@\x11r1\xFF\xA3\xFE\x7F\x1C\aV\xFB\x9E\xC6\xE3\xBE}3\xBA\xEE%\x0Eh\x7F[\xAA\xC4\x00\xA5\xAFOy7U\xEA\xF7\xA7\xCD\x1D\x81řy\x81Y\x8E\x05\tG\x02\x87\xCF3󟉄\x7Fn\xA7z\xD92d\xEB\x91{\x06\xD9\x12\xF4\xC54\xED\xE04Y\f\x93\x80\xC8\x00\"\x98E\xB02\xA21\x88\xF8Q6}\x8F\x99\xDE\x138슦\xAF6\xD5_\x10\xD73܍\xCC,\xB8;\xAB\x1BQ~L\x82\xB7\x94\f:\x1A+\x80%\xB2\x80d\x1D\x9E=\x8C\x9A݁%\xC8\xC2\xE7\xC1N(\"\xB6\x1C\xF5\xBB\x13\xA9\x10;\x11;39\x11G!\xF9W\x16\xF9f`\xF9\x123\xFF-\xB3|\xA7\xE9\b\xE6T/E\xFB<\xB4\xEF\xA2\b\x7F\x9A\xAF\xE5M\xD5\f\x12\xA4\x06G\x00R\x9Ag\x04#\x03\x11\xC1\x88`$ \x8D\x10b\x98\t\xA2\xE9\x01w; \xA6\x7F\x15E\xCF\n\xEEg\x9Bٹ\x80?\xDF\xD4\xCER\xD73\xC8\xFDG\xD4m\xAB;\x02৹\xFB\xE9\x00\xC8\xDD})\v\x00<\xFB\xAE`ܢ\xB7-\x00\xE5z7\x11\x1D\x05\xE8\x87\xCC\x14\x194\xEFDO\tɿ\xB0\xF0\x13\x00\x1D\x0E,\xDF&\xA2G\x99\xF9\xBB\xCCr\xB4\xD5\xEBo\xE2\x83\xE2\xEFK\xBAX\xCC~\x11\xFE4\x16\xA0\xF7\xB7\x83g8\xB5p\xEA\xFD\xDC\xD7\f\xBD0#\xC0\x06ǌ\x00\x1B\x1C3\x02lp\xCC\b\xB0\xC11#\xC0\x06ǌ\x00\x1B\x1C3\x02lp\xCC\b\xB0\xC11#\xC0\x06ǌ\x00\x1B\x1C\xFF\x0EGړJ\xF3V \xC3\x00\x00\x00\x00IEND\xAEB`\x82"

files.write("csgo/materials/panorama/images/icons/extension/shared_icon.png", slot_0_3_0, true)

slot_0_4_0 = table.insert
slot_0_5_0 = table.remove
slot_0_6_0 = bit.band
slot_0_7_0 = bit.lshift
slot_0_8_0 = math.pi
slot_0_9_0 = math.sin
slot_0_10_0 = math.cos
slot_0_11_0 = math.abs
slot_0_12_0 = math.floor
slot_0_13_0 = math.random
slot_0_14_0 = math.atan2
slot_0_15_0 = bit.bor
slot_0_16_0 = ffi.cast
slot_0_17_0 = math.pow
slot_0_18_0 = math.sqrt
slot_0_19_0 = math.clamp
slot_0_20_0 = unpack
slot_0_21_0 = utils.trace_line
slot_0_22_0 = utils.trace_hull
slot_0_23_0 = entity.get_local_player
slot_0_24_0 = entity.get_players
slot_0_25_0 = render.text
slot_0_26_0 = render.gradient
slot_0_27_0 = render.measure_text
slot_0_28_0 = render.shadow
slot_0_29_0 = render.poly
slot_0_30_0 = ui.get_icon
slot_0_31_0 = {}
slot_0_32_0 = {}
slot_0_33_0 = {}
slot_0_34_0 = {}

function slot_0_33_0.get_config_list()
	local var_3_0 = {
		"Default"
	}

	for iter_3_0 = 1, #slot_0_0_0.configs do
		var_3_0[#var_3_0 + 1] = slot_0_0_0.configs[iter_3_0].name
	end

	return var_3_0
end

slot_0_0_0.configs.Default = json.parse("{\"author\":\"Misnik\",\"data\":{\"antiaim\":{\"base_compensate\":false,\"base_pitch\":\"Down\",\"base_yaw\":\"At Target\",\"breaklc_always\":[\"Standing\",\"Slow Walking\",\"Crouching\",\"In Air\"],\"breaklc_extra\":[],\"breaklc_ping\":[],\"def_onetapspeed1\":10.0,\"def_onetapspeed2\":10.0,\"def_onetapspeed3\":10.0,\"def_onetapspeed4\":10.0,\"def_onetapspeed51\":10.0,\"def_onetapspeed52\":10.0,\"def_onetapspeed61\":10.0,\"def_onetapspeed62\":10.0,\"def_pitch1\":\"Disabled\",\"def_pitch2\":\"Disabled\",\"def_pitch3\":\"Disabled\",\"def_pitch4\":\"Disabled\",\"def_pitch51\":\"Disabled\",\"def_pitch52\":\"Disabled\",\"def_pitch61\":\"Disabled\",\"def_pitch62\":\"Disabled\",\"def_switch1\":false,\"def_switch2\":false,\"def_switch3\":false,\"def_switch4\":false,\"def_switch51\":false,\"def_switch52\":false,\"def_switch61\":false,\"def_switch62\":false,\"def_yaw1\":\"Default\",\"def_yaw2\":\"Default\",\"def_yaw3\":\"Default\",\"def_yaw4\":\"Default\",\"def_yaw51\":\"Default\",\"def_yaw52\":\"Default\",\"def_yaw61\":\"Default\",\"def_yaw62\":\"Default\",\"def_yaw_deg1\":0.0,\"def_yaw_deg2\":0.0,\"def_yaw_deg3\":0.0,\"def_yaw_deg4\":0.0,\"def_yaw_deg51\":0.0,\"def_yaw_deg52\":0.0,\"def_yaw_deg61\":0.0,\"def_yaw_deg62\":0.0,\"desync_freestand1\":\"Disabled\",\"desync_freestand2\":\"Disabled\",\"desync_freestand3\":\"Disabled\",\"desync_freestand4\":\"Disabled\",\"desync_freestand51\":\"Disabled\",\"desync_freestand52\":\"Disabled\",\"desync_freestand61\":\"Disabled\",\"desync_freestand62\":\"Disabled\",\"desync_l1\":60.0,\"desync_l2\":60.0,\"desync_l3\":60.0,\"desync_l4\":60.0,\"desync_l51\":60.0,\"desync_l52\":60.0,\"desync_l61\":60.0,\"desync_l62\":60.0,\"desync_mod1\":[],\"desync_mod2\":[],\"desync_mod3\":[],\"desync_mod4\":[],\"desync_mod51\":[],\"desync_mod52\":[],\"desync_mod61\":[],\"desync_mod62\":[],\"desync_r1\":60.0,\"desync_r2\":60.0,\"desync_r3\":60.0,\"desync_r4\":60.0,\"desync_r51\":60.0,\"desync_r52\":60.0,\"desync_r61\":60.0,\"desync_r62\":60.0,\"desync_switch1\":false,\"desync_switch2\":false,\"desync_switch3\":false,\"desync_switch4\":false,\"desync_switch51\":false,\"desync_switch52\":false,\"desync_switch61\":false,\"desync_switch62\":false,\"flick_delay1\":3.0,\"flick_delay2\":3.0,\"flick_delay3\":3.0,\"flick_delay4\":3.0,\"flick_delay51\":3.0,\"flick_delay52\":3.0,\"flick_delay61\":3.0,\"flick_delay62\":3.0,\"flick_yaw1\":0.0,\"flick_yaw2\":0.0,\"flick_yaw3\":0.0,\"flick_yaw4\":0.0,\"flick_yaw51\":0.0,\"flick_yaw52\":0.0,\"flick_yaw61\":0.0,\"flick_yaw62\":0.0,\"frees_dis_def\":true,\"frees_disable\":[],\"frees_pitch\":\"Disabled\",\"frees_pitch_custom\":0.0,\"frees_yaw\":\"Reversed\",\"frees_yaw_onetap\":0.0,\"legitaa_custom\":0.0,\"legitaa_desync\":true,\"legitaa_freestand\":\"Peek Fake\",\"legitaa_mod\":[\"Jitter\"],\"legitaa_pitch\":\"Camera Based\",\"legitaa_switch\":true,\"list\":2.0,\"manual_type\":\"Toggle\",\"manual_view\":\"Local View\",\"over_cond2\":true,\"over_cond3\":true,\"over_cond4\":true,\"over_cond51\":true,\"over_cond52\":true,\"over_cond61\":true,\"over_cond62\":true,\"pitch_custom1\":0.0,\"pitch_custom2\":0.0,\"pitch_custom3\":0.0,\"pitch_custom4\":0.0,\"pitch_custom51\":0.0,\"pitch_custom52\":0.0,\"pitch_custom61\":0.0,\"pitch_custom62\":0.0,\"pitch_deg1\":0.0,\"pitch_deg2\":0.0,\"pitch_deg3\":0.0,\"pitch_deg4\":0.0,\"pitch_deg51\":0.0,\"pitch_deg52\":0.0,\"pitch_deg61\":0.0,\"pitch_deg62\":0.0,\"predict_switch\":true,\"preset_list\":2.0,\"roll_def_deg1\":0.0,\"roll_def_deg2\":0.0,\"roll_def_deg3\":0.0,\"roll_def_deg4\":0.0,\"roll_def_deg51\":0.0,\"roll_def_deg52\":0.0,\"roll_def_deg61\":0.0,\"roll_def_deg62\":0.0,\"roll_ext_deg1\":0.0,\"roll_ext_deg2\":0.0,\"roll_ext_deg3\":0.0,\"roll_ext_deg4\":0.0,\"roll_ext_deg51\":0.0,\"roll_ext_deg52\":0.0,\"roll_ext_deg61\":0.0,\"roll_ext_deg62\":0.0,\"roll_ext_pit1\":0.0,\"roll_ext_pit2\":0.0,\"roll_ext_pit3\":0.0,\"roll_ext_pit4\":0.0,\"roll_ext_pit51\":0.0,\"roll_ext_pit52\":0.0,\"roll_ext_pit61\":0.0,\"roll_ext_pit62\":0.0,\"roll_switch1\":false,\"roll_switch2\":false,\"roll_switch3\":false,\"roll_switch4\":false,\"roll_switch51\":false,\"roll_switch52\":false,\"roll_switch61\":false,\"roll_switch62\":false,\"roll_type1\":\"Default\",\"roll_type2\":\"Default\",\"roll_type3\":\"Default\",\"roll_type4\":\"Default\",\"roll_type51\":\"Default\",\"roll_type52\":\"Default\",\"roll_type61\":\"Default\",\"roll_type62\":\"Default\",\"safe_def\":true,\"safe_switch\":true,\"xway_counter1\":3.0,\"xway_counter2\":3.0,\"xway_counter3\":3.0,\"xway_counter4\":3.0,\"xway_counter51\":3.0,\"xway_counter52\":3.0,\"xway_counter61\":3.0,\"xway_counter62\":3.0,\"xway_shuffle1\":false,\"xway_shuffle2\":false,\"xway_shuffle3\":false,\"xway_shuffle4\":false,\"xway_shuffle51\":false,\"xway_shuffle52\":false,\"xway_shuffle61\":false,\"xway_shuffle62\":false,\"xway_switch1\":false,\"xway_switch2\":false,\"xway_switch3\":false,\"xway_switch4\":false,\"xway_switch51\":false,\"xway_switch52\":false,\"xway_switch61\":false,\"xway_switch62\":false,\"xway_sync1\":false,\"xway_sync2\":false,\"xway_sync3\":false,\"xway_sync4\":false,\"xway_sync51\":false,\"xway_sync52\":false,\"xway_sync61\":false,\"xway_sync62\":false,\"xwayn_11\":0.0,\"xwayn_12\":0.0,\"xwayn_13\":0.0,\"xwayn_14\":0.0,\"xwayn_15\":0.0,\"xwayn_16\":0.0,\"xwayn_17\":0.0,\"xwayn_21\":0.0,\"xwayn_22\":0.0,\"xwayn_23\":0.0,\"xwayn_24\":0.0,\"xwayn_25\":0.0,\"xwayn_26\":0.0,\"xwayn_27\":0.0,\"xwayn_31\":0.0,\"xwayn_32\":0.0,\"xwayn_33\":0.0,\"xwayn_34\":0.0,\"xwayn_35\":0.0,\"xwayn_36\":0.0,\"xwayn_37\":0.0,\"xwayn_41\":0.0,\"xwayn_42\":0.0,\"xwayn_43\":0.0,\"xwayn_44\":0.0,\"xwayn_45\":0.0,\"xwayn_46\":0.0,\"xwayn_47\":0.0,\"xwayn_511\":0.0,\"xwayn_512\":0.0,\"xwayn_513\":0.0,\"xwayn_514\":0.0,\"xwayn_515\":0.0,\"xwayn_516\":0.0,\"xwayn_517\":0.0,\"xwayn_521\":0.0,\"xwayn_522\":0.0,\"xwayn_523\":0.0,\"xwayn_524\":0.0,\"xwayn_525\":0.0,\"xwayn_526\":0.0,\"xwayn_527\":0.0,\"xwayn_611\":0.0,\"xwayn_612\":0.0,\"xwayn_613\":0.0,\"xwayn_614\":0.0,\"xwayn_615\":0.0,\"xwayn_616\":0.0,\"xwayn_617\":0.0,\"xwayn_621\":0.0,\"xwayn_622\":0.0,\"xwayn_623\":0.0,\"xwayn_624\":0.0,\"xwayn_625\":0.0,\"xwayn_626\":0.0,\"xwayn_627\":0.0,\"yaw_deg1\":0.0,\"yaw_deg2\":0.0,\"yaw_deg3\":0.0,\"yaw_deg4\":0.0,\"yaw_deg51\":0.0,\"yaw_deg52\":0.0,\"yaw_deg61\":0.0,\"yaw_deg62\":0.0,\"yaw_delay1\":0.0,\"yaw_delay2\":0.0,\"yaw_delay3\":0.0,\"yaw_delay4\":0.0,\"yaw_delay51\":0.0,\"yaw_delay52\":0.0,\"yaw_delay61\":0.0,\"yaw_delay62\":0.0,\"yaw_l1\":0.0,\"yaw_l2\":0.0,\"yaw_l3\":0.0,\"yaw_l4\":0.0,\"yaw_l51\":0.0,\"yaw_l52\":0.0,\"yaw_l61\":0.0,\"yaw_l62\":0.0,\"yaw_mod_combo1\":\"Disabled\",\"yaw_mod_combo2\":\"Disabled\",\"yaw_mod_combo3\":\"Disabled\",\"yaw_mod_combo4\":\"Disabled\",\"yaw_mod_combo51\":\"Disabled\",\"yaw_mod_combo52\":\"Disabled\",\"yaw_mod_combo61\":\"Disabled\",\"yaw_mod_combo62\":\"Disabled\",\"yaw_o1\":0.0,\"yaw_o2\":0.0,\"yaw_o3\":0.0,\"yaw_o4\":0.0,\"yaw_o51\":0.0,\"yaw_o52\":0.0,\"yaw_o61\":0.0,\"yaw_o62\":0.0,\"yaw_r1\":0.0,\"yaw_r2\":0.0,\"yaw_r3\":0.0,\"yaw_r4\":0.0,\"yaw_r51\":0.0,\"yaw_r52\":0.0,\"yaw_r61\":0.0,\"yaw_r62\":0.0,\"yaw_randl1\":0.0,\"yaw_randl2\":0.0,\"yaw_randl3\":0.0,\"yaw_randl4\":0.0,\"yaw_randl51\":0.0,\"yaw_randl52\":0.0,\"yaw_randl61\":0.0,\"yaw_randl62\":0.0,\"yaw_rando1\":0.0,\"yaw_rando2\":0.0,\"yaw_rando3\":0.0,\"yaw_rando4\":0.0,\"yaw_rando51\":0.0,\"yaw_rando52\":0.0,\"yaw_rando61\":0.0,\"yaw_rando62\":0.0,\"yaw_randr1\":0.0,\"yaw_randr2\":0.0,\"yaw_randr3\":0.0,\"yaw_randr4\":0.0,\"yaw_randr51\":0.0,\"yaw_randr52\":0.0,\"yaw_randr61\":0.0,\"yaw_randr62\":0.0,\"yaw_switch1\":false,\"yaw_switch2\":false,\"yaw_switch3\":false,\"yaw_switch4\":false,\"yaw_switch51\":false,\"yaw_switch52\":false,\"yaw_switch61\":false,\"yaw_switch62\":false},\"misc\":{\"avoid_disable\":[],\"avoid_dist\":5.0,\"avoid_switch\":false,\"clantag_switch\":true,\"fall_switch\":true,\"fastladder_switch\":true,\"ping_slider\":200.0,\"ping_switch\":false,\"shared_switch\":true,\"trash_type\":[\"On Kill\",\"On Death\",\"Revenge\"],\"trashtalk_switch\":true},\"ragebot\":{\"aipeek_delay\":2.0,\"aipeek_dist\":30.0,\"aipeek_dt\":true,\"aipeek_keys\":true,\"aipeek_switch\":false,\"aipeek_vis\":false,\"air_1\":55.0,\"air_2\":-1.0,\"air_3\":-1.0,\"air_4\":-1.0,\"air_5\":-1.0,\"air_6\":-1.0,\"air_7\":-1.0,\"air_exploit\":false,\"airstop_cond\":[1.0,2.0],\"airstop_switch\":true,\"antidef_switch\":false,\"discharge_combo\":[],\"discharge_delay\":3.0,\"discharge_mode\":\"Default\",\"discharge_switch\":false,\"dormant_dmg\":5.0,\"dormant_dmgswitch\":true,\"dormant_switch\":true,\"grenade_damage\":100.0,\"grenade_switch\":false,\"jumpscout\":true,\"noscope_1\":-1.0,\"noscope_2\":50.0,\"noscope_3\":50.0,\"noscope_4\":-1.0,\"noscope_5\":-1.0,\"noscope_6\":-1.0,\"noscope_7\":-1.0,\"noscope_dist1\":0.0,\"noscope_dist2\":15.0,\"noscope_dist3\":30.0,\"noscope_dist4\":0.0,\"noscope_dist5\":0.0,\"noscope_dist6\":0.0,\"noscope_dist7\":0.0,\"roll_deg\":50.0,\"roll_pitch_deg\":89.0,\"roll_pitch_switch\":false,\"roll_resolver\":false,\"toss_switch\":false},\"visuals\":{\"anim_gym\":true,\"anim_speed\":10.0,\"anim_switch\":true,\"breaker_lean_value\":0.0,\"breaker_list\":[1.0,4.0,5.0],\"breaker_switch\":true,\"color_use_theme\":true,\"console_color\":{\"a\":255.0,\"b\":152.0,\"g\":114.0,\"r\":124.0},\"console_switch\":true,\"damage_font\":\"Pixel\",\"damage_is_active\":false,\"damage_switch\":true,\"dpi_scale\":\"Auto\",\"glow_alpha\":75.0,\"glow_thick\":25.0,\"hitlog_color_mode\":\"Per Reason\",\"hitlog_death\":{\"a\":255.0,\"b\":41.0,\"g\":41.0,\"r\":165.0},\"hitlog_duration\":30.0,\"hitlog_extra\":[\"Icons\",\"Glow\"],\"hitlog_hit\":{\"a\":255.0,\"b\":255.0,\"g\":129.0,\"r\":138.0},\"hitlog_miss\":{\"a\":255.0,\"b\":62.0,\"g\":62.0,\"r\":254.0},\"hitlog_pred\":{\"a\":255.0,\"b\":119.0,\"g\":66.0,\"r\":255.0},\"hitlog_resolver\":{\"a\":255.0,\"b\":62.0,\"g\":62.0,\"r\":254.0},\"hitlog_spread\":{\"a\":255.0,\"b\":57.0,\"g\":193.0,\"r\":255.0},\"hitlog_switch\":true,\"hitlog_theme_hit\":true,\"hitlog_vis_type\":[1.0,2.0,3.0],\"hitmarker_color_hitlog\":true,\"hitmarker_duration\":30.0,\"hitmarker_glow\":true,\"hitmarker_hit\":{\"a\":255.0,\"b\":255.0,\"g\":129.0,\"r\":138.0},\"hitmarker_lastshot\":true,\"hitmarker_miss\":{\"a\":255.0,\"b\":62.0,\"g\":62.0,\"r\":254.0},\"hitmarker_switch\":true,\"hitmarker_theme_hit\":true,\"indicator_glow\":true,\"indicator_style\":\"Old\",\"indicator_switch\":true,\"main_color\":{\"a\":255.0,\"b\":255.0,\"g\":129.0,\"r\":138.0},\"manual_switch\":false,\"molotov_switch\":false,\"nade_molotov\":true,\"nade_molotov_c\":{\"a\":150.0,\"b\":122.0,\"g\":122.0,\"r\":255.0},\"nade_molotov_cf\":{\"a\":0.0,\"b\":0.0,\"g\":0.0,\"r\":0.0},\"nade_smoke\":true,\"nade_smoke_c\":{\"a\":131.0,\"b\":131.0,\"g\":131.0,\"r\":131.0},\"nade_style\":\"Solid\",\"nade_switch\":true,\"scope_gap\":6.0,\"scope_size\":200.0,\"scope_switch\":false,\"scope_type\":[],\"second_color\":{\"a\":255.0,\"b\":255.0,\"g\":129.0,\"r\":138.0},\"spoofer_list\":1.0,\"spoofer_switch\":false,\"transparency_alpha\":100.0,\"transparency_keep\":false,\"transparency_nade\":50.0,\"transparency_scope\":50.0,\"transparency_switch\":false,\"widgets_list\":[]}},\"is_locked\":false,\"name\":\"2024 Default config\"}")
slot_0_35_0 = {
	chams_color = ui.find("Visuals", "Players", "Self", "Chams", "Model", "Color"),
	chams_material = ui.find("Visuals", "Players", "Self", "Chams", "Model", "Style"),
	edge_jump = ui.find("Miscellaneous", "Main", "Movement", "Edge Jump"),
	autostop = ui.find("Aimbot", "Ragebot", "Accuracy", "SSG-08", "Auto Stop", "Options"),
	airstrafe = ui.find("Miscellaneous", "Main", "Movement", "Air Strafe"),
	double_tap_fl = ui.find("Aimbot", "Ragebot", "Main", "Double Tap", "Fake Lag Limit"),
	ragebot = ui.find("Aimbot", "Ragebot", "Main", "Enabled"),
	double_tap = ui.find("Aimbot", "Ragebot", "Main", "Double Tap"),
	defensive = ui.find("Aimbot", "Ragebot", "Main", "Double Tap", "Lag Options"),
	hidden_yaw = ui.find("Aimbot", "Anti Aim", "Angles", "Yaw", "Hidden"),
	hide_shots = ui.find("Aimbot", "Ragebot", "Main", "Hide Shots"),
	hide_shots_defensive = ui.find("Aimbot", "Ragebot", "Main", "Hide Shots", "Options"),
	hitchance = ui.find("Aimbot", "Ragebot", "Selection", "Hit Chance"),
	no_scope = ui.find("Aimbot", "Ragebot", "Accuracy", "Auto Scope"),
	dmg = ui.find("Aimbot", "Ragebot", "Selection", "Min. Damage"),
	hitboxes = ui.find("Aimbot", "Ragebot", "Selection", "Hitboxes"),
	legs_movement = ui.find("Aimbot", "Anti Aim", "Misc", "Leg Movement"),
	fakeduck = ui.find("Aimbot", "Anti Aim", "Misc", "Fake Duck"),
	slowwalk = ui.find("Aimbot", "Anti Aim", "Misc", "Slow Walk"),
	pitch = ui.find("Aimbot", "Anti Aim", "Angles", "Pitch"),
	peek_assist_return = ui.find("Aimbot", "Ragebot", "Main", "Peek Assist", "Retreat Mode"),
	yaw_base = ui.find("Aimbot", "Anti Aim", "Angles", "Yaw"),
	yaw_offset = ui.find("Aimbot", "Anti Aim", "Angles", "Yaw", "Offset"),
	yaw_at_targets = ui.find("Aimbot", "Anti Aim", "Angles", "Yaw", "Base"),
	yaw_modifier = ui.find("Aimbot", "Anti Aim", "Angles", "Yaw Modifier"),
	yaw_modifier_offset = ui.find("Aimbot", "Anti Aim", "Angles", "Yaw Modifier", "Offset"),
	desync = ui.find("Aimbot", "Anti Aim", "Angles", "Body Yaw"),
	inverter = ui.find("Aimbot", "Anti Aim", "Angles", "Body Yaw", "Inverter"),
	left_limit = ui.find("Aimbot", "Anti Aim", "Angles", "Body Yaw", "Left Limit"),
	right_limit = ui.find("Aimbot", "Anti Aim", "Angles", "Body Yaw", "Right Limit"),
	fake_opt = ui.find("Aimbot", "Anti Aim", "Angles", "Body Yaw", "Options"),
	desync_freestand = ui.find("Aimbot", "Anti Aim", "Angles", "Body Yaw", "Freestanding"),
	exales = ui.find("Aimbot", "Anti Aim", "Angles", "Extended Angles"),
	exales_pitch = ui.find("Aimbot", "Anti Aim", "Angles", "Extended Angles", "Extended Pitch"),
	exales_roll = ui.find("Aimbot", "Anti Aim", "Angles", "Extended Angles", "Extended Roll"),
	auto_peek = ui.find("Aimbot", "Ragebot", "Main", "Peek Assist"),
	auto_peek_color = ui.find("Aimbot", "Ragebot", "Main", "Peek Assist", "Style"),
	freestand = ui.find("Aimbot", "Anti Aim", "Angles", "Freestanding"),
	freestand_off_yaw_modifiers = ui.find("Aimbot", "Anti Aim", "Angles", "Freestanding", "Disable Yaw Modifiers"),
	world_hitmarker = ui.find("Visuals", "World", "Other", "Hit Marker"),
	strafe_smooth = ui.find("Miscellaneous", "Main", "Movement", "Air Strafe", "Smoothing"),
	body_rage = ui.find("Aimbot", "Ragebot", "Safety", "Body Aim"),
	safe_points = ui.find("Aimbot", "Ragebot", "Safety", "Safe Points"),
	third_person = ui.find("Visuals", "World", "Main", "Force Thirdperson"),
	clantag = ui.find("Miscellaneous", "Main", "In-Game", "Clan Tag"),
	shared_esp = ui.find("Visuals", "Players", "Enemies", "ESP", "Shared ESP"),
	fakelag_slider = ui.find("Aimbot", "Anti Aim", "Fake Lag", "Limit"),
	retreat_mode = ui.find("Aimbot", "Ragebot", "Main", "Peek Assist", "Retreat Mode"),
	peek_assist = ui.find("Aimbot", "Ragebot", "Main", "Peek Assist"),
	ping = ui.find("Miscellaneous", "Main", "Other", "Fake Latency")
}
slot_0_36_0 = {}
slot_0_37_0 = {}

for iter_0_0, iter_0_1 in pairs(slot_0_35_0) do
	slot_0_43_1 = {
		ref = iter_0_1
	}

	iter_0_1:set_callback(function(arg_4_0)
		local var_4_0 = arg_4_0:get()

		slot_0_36_0[iter_0_0] = var_4_0
		slot_0_43_1.value = var_4_0
		slot_0_43_1.override_value = arg_4_0:get_override()
	end, true)

	function slot_0_43_1.set(arg_5_0, arg_5_1)
		if arg_5_0.value ~= arg_5_1 then
			arg_5_0.value = arg_5_1

			arg_5_0.ref:set(arg_5_1)
		end
	end

	function slot_0_43_1.override(arg_6_0, arg_6_1)
		if arg_6_0.override_value ~= arg_6_1 then
			arg_6_0.override_value = arg_6_1

			arg_6_0.ref:override(arg_6_1)
		end
	end

	slot_0_37_0[iter_0_0] = slot_0_43_1
end

slot_0_32_0.flags = {
	IN_ATTACK = slot_0_7_0(1, 0),
	IN_JUMP = slot_0_7_0(1, 1),
	IN_DUCK = slot_0_7_0(1, 2),
	IN_FORWARD = slot_0_7_0(1, 3),
	IN_BACK = slot_0_7_0(1, 4),
	IN_USE = slot_0_7_0(1, 5),
	IN_CANCEL = slot_0_7_0(1, 6),
	IN_LEFT = slot_0_7_0(1, 7),
	IN_RIGHT = slot_0_7_0(1, 8),
	IN_MOVELEFT = slot_0_7_0(1, 9),
	IN_MOVERIGHT = slot_0_7_0(1, 10),
	IN_ATTACK2 = slot_0_7_0(1, 11),
	IN_RUN = slot_0_7_0(1, 12),
	IN_RELOAD = slot_0_7_0(1, 13),
	IN_ALT1 = slot_0_7_0(1, 14),
	IN_ALT2 = slot_0_7_0(1, 15),
	IN_SCORE = slot_0_7_0(1, 16),
	IN_SPEED = slot_0_7_0(1, 17),
	IN_WALK = slot_0_7_0(1, 18),
	IN_ZOOM = slot_0_7_0(1, 19),
	IN_WEAPON1 = slot_0_7_0(1, 20),
	IN_WEAPON2 = slot_0_7_0(1, 21),
	IN_BULLRUSH = slot_0_7_0(1, 22),
	FL_ONGROUND = slot_0_7_0(1, 0),
	FL_DUCKING = slot_0_7_0(1, 1),
	FL_WATERJUMP = slot_0_7_0(1, 3),
	FL_ONTRAIN = slot_0_7_0(1, 4),
	FL_INRAIN = slot_0_7_0(1, 5),
	FL_FROZEN = slot_0_7_0(1, 6),
	FL_ATCONTROLS = slot_0_7_0(1, 7),
	FL_CLIENT = slot_0_7_0(1, 8),
	FL_FAKECLIENT = slot_0_7_0(1, 9),
	FL_INWATER = slot_0_7_0(1, 10)
}

function slot_0_38_0(arg_7_0, arg_7_1)
	return slot_0_12_0(arg_7_0 / arg_7_1) * arg_7_1
end

function slot_0_39_0(arg_8_0)
	arg_8_0 = tonumber(arg_8_0)

	local var_8_0 = slot_0_12_0(arg_8_0)

	if arg_8_0 < 0 and arg_8_0 - var_8_0 ~= 0 then
		arg_8_0 = var_8_0 + 1
	else
		arg_8_0 = var_8_0
	end

	return arg_8_0
end

slot_0_40_0 = {}
slot_0_40_0.hp = 0
slot_0_40_0.ref = slot_0_23_0()
slot_0_40_0.on_ground = true
slot_0_40_0.crouching = true
slot_0_40_0.velocity = 0
slot_0_40_0.ground_tickcount = 0
slot_0_40_0.eye_pos = vector(0, 0, 0)

function slot_0_40_0.update()
	local var_9_0 = slot_0_23_0()
	local var_9_1 = var_9_0.m_fFlags
	local var_9_2 = var_9_0.m_hGroundEntity

	slot_0_40_0.on_ground = var_9_2
	slot_0_40_0.ref = var_9_0
	slot_0_40_0.crouching = slot_0_6_0(var_9_1, slot_0_32_0.flags.FL_DUCKING) ~= 0 or slot_0_36_0.fakeduck
	slot_0_40_0.velocity = var_9_0.m_vecVelocity:length2d()
	slot_0_40_0.ground_tickcount = var_9_2 and slot_0_19_0(slot_0_40_0.ground_tickcount + 1, 0, 51) or 0
	slot_0_40_0.eye_pos = var_9_0:get_eye_position()
end

events.createmove:set(slot_0_40_0.update)

function slot_0_41_0(arg_10_0, arg_10_1)
	local var_10_0 = vector(arg_10_1.x - arg_10_0.x, arg_10_1.y - arg_10_0.y, arg_10_1.z - arg_10_0.z)

	return (vector(slot_0_14_0(-var_10_0.z, var_10_0:length2d()) * 180 / slot_0_8_0, slot_0_14_0(var_10_0.y, var_10_0.x) * 180 / slot_0_8_0, 0))
end

function slot_0_42_0(arg_11_0, arg_11_1, arg_11_2, arg_11_3, arg_11_4, arg_11_5, arg_11_6)
	local var_11_0 = arg_11_0:get_origin()

	if arg_11_5 then
		var_11_0 = arg_11_5
	end

	if arg_11_3 then
		var_11_0 = arg_11_0:get_hitbox_position(arg_11_3)
	end

	if arg_11_4 then
		var_11_0 = arg_11_0:get_eye_position()
	end

	local var_11_1 = arg_11_0.m_vecVelocity
	local var_11_2 = var_11_1:length()
	local var_11_3 = {}

	if var_11_2 < 5 then
		for iter_11_0 = 1, arg_11_1 do
			var_11_3[iter_11_0] = var_11_0
		end

		return var_11_0, var_11_3
	end

	if var_11_2 < 30 then
		var_11_1.x = var_11_1.x * 2
		var_11_1.y = var_11_1.y * 2
	end

	local var_11_4 = globals.tickinterval
	local var_11_5 = cvar.sv_gravity:float() * var_11_4
	local var_11_6 = cvar.sv_jump_impulse:float() * var_11_4
	local var_11_7 = slot_0_6_0(arg_11_0.m_fFlags, slot_0_32_0.flags.FL_ONGROUND) ~= 0 and 0 or var_11_5 - var_11_6

	if arg_11_2 then
		for iter_11_1 = 0, arg_11_1 do
			var_11_1.z = var_11_1.z - var_11_7

			if slot_0_21_0(var_11_0, var_11_0 + var_11_1 * var_11_4, arg_11_0, 1174421507).fraction ~= 1 and arg_11_6 then
				break
			end

			var_11_0 = var_11_0 + var_11_1 * var_11_4

			slot_0_4_0(var_11_3, var_11_0)
		end
	else
		var_11_1.x = var_11_1.x * arg_11_1
		var_11_1.y = var_11_1.y * arg_11_1
		var_11_1.z = var_11_1.z * arg_11_1 - var_11_7 * arg_11_1

		local var_11_8 = slot_0_21_0(var_11_0, var_11_0 + var_11_1 * var_11_4, arg_11_0, 1174421507, 3)

		var_11_0 = arg_11_6 and var_11_8.end_pos or var_11_0 + var_11_1 * var_11_4
	end

	return var_11_0, var_11_3
end

ffi.cdef("\n            typedef struct \n            {\n                int x;\n                int y;\n                int z;\n            } vector_t;\n\n            typedef void*(__thiscall* c_entity_list_get_client_entity_t)(void*, int);\n\n            typedef struct {\n\n                char  pad_0000[20];\n                int m_nOrder;\n                int m_nSequence; \n                float m_flPrevCycle; \n                float m_flWeight; \n                float m_flWeightDeltaRate; \n                float m_flPlaybackRate; \n                float m_flCycle; \n                void *m_pOwner; \n                char  pad_0038[4];\n            } CAnimationLayer_t;\n        ")

slot_0_43_0 = {
	bind_argument = function(arg_12_0, arg_12_1)
		return function(...)
			return arg_12_0(arg_12_1, ...)
		end
	end,
	interface_type = ffi.typeof("uintptr_t**")
}
slot_0_43_0.i_client_entity_list = slot_0_16_0(slot_0_43_0.interface_type, utils.create_interface("client.dll", "VClientEntityList003"))
slot_0_43_0.get_client_entity = slot_0_43_0.bind_argument(slot_0_16_0("c_entity_list_get_client_entity_t", slot_0_43_0.i_client_entity_list[0][3]), slot_0_43_0.i_client_entity_list)
slot_0_43_0.get_client_entity_from_handle = slot_0_43_0.bind_argument(slot_0_16_0("c_entity_list_get_client_entity_t", slot_0_43_0.i_client_entity_list[0][4]), slot_0_43_0.i_client_entity_list)
slot_0_43_0.vgui_system = slot_0_16_0(slot_0_43_0.interface_type, utils.create_interface("vgui2.dll", "VGUI_System010"))
slot_0_43_0.shell_execute = slot_0_43_0.bind_argument(slot_0_16_0("void(__thiscall*)(void*, const char*, const char*)", slot_0_43_0.vgui_system[0][3]), slot_0_43_0.vgui_system)
slot_0_43_0.get_clipboard_text_count = slot_0_43_0.bind_argument(slot_0_16_0("int(__thiscall*)(void*)", slot_0_43_0.vgui_system[0][7]), slot_0_43_0.vgui_system)
slot_0_43_0.set_clipboard_text = slot_0_43_0.bind_argument(slot_0_16_0("void(__thiscall*)(void*, const char*, int)", slot_0_43_0.vgui_system[0][9]), slot_0_43_0.vgui_system)
slot_0_43_0.get_clipboard_text_fn = slot_0_43_0.bind_argument(slot_0_16_0("void(__thiscall*)(void*, int, const char*, int)", slot_0_43_0.vgui_system[0][11]), slot_0_43_0.vgui_system)

function slot_0_43_0.get_clipboard_text()
	local var_14_0 = slot_0_43_0.get_clipboard_text_count()

	if var_14_0 > 0 then
		local var_14_1 = ffi.new("char[?]", var_14_0)
		local var_14_2 = var_14_0 * ffi.sizeof("char[?]", var_14_0)

		slot_0_43_0.get_clipboard_text_fn(0, var_14_1, var_14_2)

		return ffi.string(var_14_1, var_14_0 - 1)
	end

	return ""
end

slot_0_43_0.m_eye_angle = utils.get_vfunc(170, "vector_t*(__thiscall*)(void*)")
slot_0_43_0.EngineClient = utils.create_interface("engine.dll", "VEngineClient014")
slot_0_43_0.EngineClient_class = slot_0_16_0("void***", slot_0_43_0.EngineClient)
slot_0_43_0.console_status = slot_0_16_0("bool(__thiscall*)(void*)", slot_0_43_0.EngineClient_class[0][11])
slot_0_43_0.vgui_system = slot_0_16_0(slot_0_43_0.interface_type, utils.create_interface("vgui2.dll", "VGUI_System010"))
slot_0_43_0.shell_execute = slot_0_43_0.bind_argument(slot_0_16_0("void(__thiscall*)(void*, const char*, const char*)", slot_0_43_0.vgui_system[0][3]), slot_0_43_0.vgui_system)
slot_0_44_0 = {}
slot_0_44_0.default_alphabet = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/"
slot_0_44_0.custom_alphabet = "ulJkLANdgIcnwO79yRz6VBS8ZXQKfPv3HYejMFtmoWpb0s2xq1GEhC5aTri4U=+/"

function slot_0_44_0.encode(arg_15_0)
	local var_15_0 = slot_0_44_0.custom_alphabet

	return (arg_15_0:gsub(".", function(arg_16_0)
		local var_16_0 = ""
		local var_16_1 = arg_16_0:byte()

		for iter_16_0 = 8, 1, -1 do
			var_16_0 = var_16_0 .. (var_16_1 % 2^iter_16_0 - var_16_1 % 2^(iter_16_0 - 1) > 0 and "1" or "0")
		end

		return var_16_0
	end) .. "0000"):gsub("%d%d%d?%d?%d?%d?", function(arg_17_0)
		if #arg_17_0 < 6 then
			return ""
		end

		local var_17_0 = 0

		for iter_17_0 = 1, 6 do
			var_17_0 = var_17_0 + (arg_17_0:sub(iter_17_0, iter_17_0) == "1" and 2^(6 - iter_17_0) or 0)
		end

		return var_15_0:sub(var_17_0 + 1, var_17_0 + 1)
	end) .. ({
		"",
		"DD",
		"D"
	})[#arg_15_0 % 3 + 1]
end

function slot_0_44_0.decode(arg_18_0)
	local var_18_0 = slot_0_44_0.custom_alphabet

	arg_18_0 = string.gsub(arg_18_0, "[^" .. var_18_0 .. "D]", "")

	return (arg_18_0:gsub(".", function(arg_19_0)
		if arg_19_0 == "D" then
			return ""
		end

		local var_19_0 = ""
		local var_19_1 = var_18_0:find(arg_19_0) - 1

		for iter_19_0 = 6, 1, -1 do
			var_19_0 = var_19_0 .. (var_19_1 % 2^iter_19_0 - var_19_1 % 2^(iter_19_0 - 1) > 0 and "1" or "0")
		end

		return var_19_0
	end):gsub("%d%d%d?%d?%d?%d?%d?%d?", function(arg_20_0)
		if #arg_20_0 ~= 8 then
			return ""
		end

		local var_20_0 = 0

		for iter_20_0 = 1, 8 do
			var_20_0 = var_20_0 + (arg_20_0:sub(iter_20_0, iter_20_0) == "1" and 2^(8 - iter_20_0) or 0)
		end

		return string.char(var_20_0)
	end))
end

function slot_0_44_0.pcall_func(arg_21_0)
	return pcall(function()
		return json.parse(slot_0_44_0.decode(arg_21_0))
	end)
end

slot_0_45_0 = {}
slot_0_46_0 = {
	values = {},
	ui_tables = {}
}
slot_0_46_0.active_tab = nil
slot_0_46_0.is_loaded = false
slot_0_46_0.types = {
	"switch",
	"slider",
	"combo",
	"selectable",
	"color_picker",
	"button",
	"hotkey",
	"text_box",
	"list",
	"listable",
	"label"
}

function slot_0_46_0.get_default_ui_el_table(arg_23_0, arg_23_1, arg_23_2, arg_23_3, arg_23_4)
	local var_23_0 = {
		ref = arg_23_3
	}

	if not slot_0_46_0.values[arg_23_1] then
		slot_0_46_0.values[arg_23_1] = {}
	end

	if not slot_0_46_0.ui_tables[arg_23_1] then
		slot_0_46_0.ui_tables[arg_23_1] = {}
	end

	var_23_0.value_for_ref = arg_23_3:get()
	var_23_0.value = nil
	var_23_0._vis_func = arg_23_4
	var_23_0._dis_func = nil
	var_23_0.group_table = arg_23_0

	function var_23_0.visible(arg_24_0, arg_24_1)
		if arg_24_1 ~= nil and var_23_0._vis_state ~= arg_24_1 then
			arg_24_0.ref:visibility(arg_24_1)

			var_23_0._vis_state = arg_24_1
		end

		return var_23_0._vis_state
	end

	var_23_0._disabled = false

	function var_23_0.disabled(arg_25_0, arg_25_1)
		if arg_25_1 == nil then
			return arg_25_0.ref:disabled()
		end

		if var_23_0._disabled ~= arg_25_1 then
			var_23_0._disabled = arg_25_1

			arg_25_0.ref:disabled(arg_25_1)
		end
	end

	var_23_0._callbacks_list = {}

	function var_23_0._callback_func(arg_26_0)
		local var_26_0 = arg_23_3:get()

		var_23_0.value = var_26_0
		var_23_0.value_for_ref = var_26_0
		slot_0_46_0.values[arg_23_1][arg_23_2] = var_26_0

		local var_26_1 = var_23_0._vis_func()

		if var_23_0.group_table._vis_func then
			var_26_1 = var_26_1 and var_23_0.group_table._vis_func()
		end

		if arg_26_0 then
			for iter_26_0 = 1, #var_23_0._callbacks_list do
				var_23_0._callbacks_list[iter_26_0]()
			end
		end

		if arg_26_0 and slot_0_46_0.is_loaded then
			var_23_0.group_table:update()
		end

		if var_23_0._vis_state ~= var_26_1 then
			var_23_0._vis_state = var_26_1

			var_23_0.ref:visibility(var_23_0._vis_state)
		end

		local var_26_2 = var_23_0._dis_func and var_23_0._dis_func() or nil

		if var_23_0.group_table._dis_func then
			var_26_2 = var_26_2 and var_23_0.group_table._dis_func()
		end

		if var_26_2 ~= nil and var_23_0._disabled ~= var_26_2 then
			var_23_0._disabled = var_26_2

			var_23_0.ref:disabled(var_26_2)
		end
	end

	var_23_0.ref:set_callback(var_23_0._callback_func, true)

	function var_23_0.set_callback(arg_27_0, arg_27_1, arg_27_2)
		arg_27_0._callbacks_list[#arg_27_0._callbacks_list + 1] = arg_27_1

		if arg_27_2 then
			arg_27_1()
		end

		return arg_27_1
	end

	function var_23_0.unset_callback(arg_28_0, arg_28_1)
		for iter_28_0 = 1, #arg_28_0._callbacks_list do
			if arg_28_0._callbacks_list[iter_28_0] == arg_28_1 then
				table.remove(arg_28_0._callbacks_list, iter_28_0)

				break
			end
		end
	end

	function var_23_0.set_disable_function(arg_29_0, arg_29_1, arg_29_2)
		arg_29_0._dis_func = arg_29_1

		if arg_29_2 then
			arg_29_1()
		end
	end

	function var_23_0.tooltip(arg_30_0, arg_30_1)
		if not arg_30_1 then
			return arg_30_0.ref:tooltip()
		end

		arg_30_0.ref:tooltip(arg_30_1)
	end

	function var_23_0.name(arg_31_0, arg_31_1)
		if not arg_31_1 then
			return arg_31_0.ref:name()
		end

		arg_31_0.ref:name(arg_31_1)
	end

	if arg_23_3:type() == "color_picker" then
		return var_23_0
	end

	var_23_0.gear_ref = nil

	function var_23_0.switch(arg_32_0, arg_32_1, arg_32_2, arg_32_3, arg_32_4, arg_32_5, arg_32_6, arg_32_7)
		if not arg_32_0.gear_ref then
			arg_32_0.gear_ref = arg_32_0.ref:create()
		end

		local var_32_0 = arg_32_0.gear_ref:switch(arg_32_2, arg_32_3)
		local var_32_1 = arg_32_4 and arg_32_4 or function()
			return true
		end
		local var_32_2 = slot_0_46_0.get_default_gear_table(var_23_0, arg_23_1, arg_32_1, arg_32_5, var_32_0, var_32_1, arg_32_0.group_table)

		var_32_2.type = 1
		var_32_2.def_value = arg_32_3
		var_32_2.disabled_icon = arg_32_6 == nil and "" or arg_32_6
		var_32_2.enabled_icon = arg_32_7 == nil and "" or arg_32_7
		var_32_2.enabled_text = var_32_2.enabled_icon .. arg_32_2
		var_32_2.disabled_text = var_32_2.disabled_icon .. arg_32_2

		var_32_2:set_callback(function()
			var_32_0:name(var_32_2.value and var_32_2.enabled_text or var_32_2.disabled_text)
		end, true)

		var_32_2 = setmetatable(var_32_2, {
			__call = function(arg_35_0)
				return arg_35_0.ref
			end
		})
		slot_0_46_0.ui_tables[arg_23_1][arg_32_1] = var_32_2
		arg_23_0.elements[#arg_23_0.elements + 1] = var_32_2

		return var_32_2
	end

	function var_23_0.slider(arg_36_0, arg_36_1, arg_36_2, arg_36_3, arg_36_4, arg_36_5, arg_36_6, arg_36_7, arg_36_8, arg_36_9)
		if not arg_36_0.gear_ref then
			arg_36_0.gear_ref = arg_36_0.ref:create()
		end

		local var_36_0 = arg_36_0.gear_ref:slider(arg_36_2, arg_36_3, arg_36_4, arg_36_5, arg_36_6, arg_36_7)
		local var_36_1 = arg_36_8 and arg_36_8 or function()
			return true
		end
		local var_36_2 = slot_0_46_0.get_default_gear_table(var_23_0, arg_23_1, arg_36_1, arg_36_9, var_36_0, var_36_1, arg_36_0.group_table)

		var_36_2.type = 2
		var_36_2.def_value = arg_36_5

		local var_36_3 = setmetatable(var_36_2, {
			__call = function(arg_38_0)
				return arg_38_0.ref
			end
		})

		slot_0_46_0.ui_tables[arg_23_1][arg_36_1] = var_36_3
		arg_23_0.elements[#arg_23_0.elements + 1] = var_36_3

		return var_36_3
	end

	function var_23_0.combo(arg_39_0, arg_39_1, arg_39_2, arg_39_3, arg_39_4, arg_39_5, arg_39_6)
		if not arg_39_0.gear_ref then
			arg_39_0.gear_ref = arg_39_0.ref:create()
		end

		local var_39_0 = arg_39_0.gear_ref:combo(arg_39_2, arg_39_3)
		local var_39_1 = arg_39_5 and arg_39_5 or function()
			return true
		end
		local var_39_2 = slot_0_46_0.get_default_gear_table(var_23_0, arg_23_1, arg_39_1, arg_39_6, var_39_0, var_39_1, arg_39_0.group_table)

		var_39_2.type = 3
		var_39_2.def_value = arg_39_4
		var_39_2.elements_array = arg_39_3
		var_39_2.list_by_name = {}

		for iter_39_0 = 1, #arg_39_3 do
			var_39_2.list_by_name[arg_39_3[iter_39_0]] = iter_39_0
		end

		var_39_2.str_value = var_39_0:get()
		var_39_2.value = var_39_2.list_by_name[var_39_2.str_value]

		var_39_2.ref:unset_callback(var_39_2._callback_func)

		function var_39_2._callback_func(arg_41_0)
			local var_41_0 = var_39_2.ref:get()

			var_39_2.value = var_39_2.list_by_name[var_41_0]
			var_39_2.str_value = var_41_0
			var_39_2.value_for_ref = var_41_0
			slot_0_46_0.values[arg_23_1][arg_39_1] = var_41_0

			local var_41_1 = var_39_2._vis_func()

			if var_39_2.group_table._vis_func then
				var_41_1 = var_41_1 and var_39_2.group_table._vis_func()
			end

			var_41_1 = (arg_39_6 or var_39_2.parent_table.value) and var_41_1

			if arg_41_0 then
				for iter_41_0 = 1, #var_39_2._callbacks_list do
					var_39_2._callbacks_list[iter_41_0]()
				end
			end

			if arg_41_0 and slot_0_46_0.is_loaded then
				var_39_2.group_table:update()
			end

			local var_41_2 = var_39_2._dis_func and var_39_2._dis_func() or nil

			if var_39_2.group_table._dis_func then
				var_41_2 = var_41_2 or var_39_2.group_table._dis_func()
			end

			if var_41_2 ~= nil and var_39_2._disabled ~= var_41_2 then
				var_39_2._disabled = var_41_2

				var_39_2.ref:disabled(var_41_2)
			end

			if var_39_2._vis_state ~= var_41_1 then
				var_39_2._vis_state = var_41_1

				var_39_2.ref:visibility(var_39_2._vis_state)
			end
		end

		var_39_2.ref:set_callback(var_39_2._callback_func, true)

		var_39_2 = setmetatable(var_39_2, {
			__call = function(arg_42_0)
				return arg_42_0.ref
			end
		})
		slot_0_46_0.ui_tables[arg_23_1][arg_39_1] = var_39_2
		arg_23_0.elements[#arg_23_0.elements + 1] = var_39_2

		return var_39_2
	end

	function var_23_0.selectable(arg_43_0, arg_43_1, arg_43_2, arg_43_3, arg_43_4, arg_43_5, arg_43_6)
		if not arg_43_0.gear_ref then
			arg_43_0.gear_ref = arg_43_0.ref:create()
		end

		local var_43_0 = arg_43_0.gear_ref:selectable(arg_43_2, arg_43_3)
		local var_43_1 = arg_43_5 and arg_43_5 or function()
			return true
		end
		local var_43_2 = slot_0_46_0.get_default_gear_table(var_23_0, arg_23_1, arg_43_1, arg_43_6, var_43_0, var_43_1, arg_43_0.group_table)

		var_43_2.type = 4
		var_43_2.def_value = arg_43_4
		var_43_2.elements_array = arg_43_3
		var_43_2.list_by_name = {}

		for iter_43_0 = 1, #arg_43_3 do
			var_43_2.list_by_name[arg_43_3[iter_43_0]] = iter_43_0
		end

		var_43_2.str_value = var_43_0:get()
		var_43_2.value = var_43_0:get()
		var_43_2.value_by_name = {}

		for iter_43_1 = 1, #var_43_2.value do
			var_43_2.value_by_name[var_43_2.value[iter_43_1]] = true
		end

		var_43_2.ref:unset_callback(var_43_2._callback_func)

		function var_43_2._callback_func(arg_45_0)
			local var_45_0 = var_43_2.ref:get()

			var_43_2.value = var_45_0
			var_43_2.str_value = var_45_0
			var_43_2.value_for_ref = var_45_0
			var_43_2.value_by_name = {}

			for iter_45_0 = 1, #var_43_2.value do
				var_43_2.value_by_name[var_43_2.value[iter_45_0]] = true
			end

			slot_0_46_0.values[arg_23_1][arg_43_1] = var_45_0

			local var_45_1 = var_43_2._vis_func()

			if var_43_2.group_table._vis_func then
				var_45_1 = var_45_1 and var_43_2.group_table._vis_func()
			end

			var_45_1 = (arg_43_6 or var_43_2.parent_table.value) and var_45_1

			if arg_45_0 then
				for iter_45_1 = 1, #var_43_2._callbacks_list do
					var_43_2._callbacks_list[iter_45_1]()
				end
			end

			if arg_45_0 and slot_0_46_0.is_loaded then
				var_43_2.group_table:update()
			end

			local var_45_2 = var_43_2._dis_func and var_43_2._dis_func() or nil

			if var_43_2.group_table._dis_func then
				var_45_2 = var_45_2 or var_43_2.group_table._dis_func()
			end

			if var_45_2 ~= nil and var_43_2._disabled ~= var_45_2 then
				var_43_2._disabled = var_45_2

				var_43_2.ref:disabled(var_45_2)
			end

			if var_43_2._vis_state ~= var_45_1 then
				var_43_2._vis_state = var_45_1

				var_43_2.ref:visibility(var_43_2._vis_state)
			end
		end

		var_43_2.ref:set_callback(var_43_2._callback_func, true)

		var_43_2 = setmetatable(var_43_2, {
			__call = function(arg_46_0)
				return arg_46_0.ref
			end
		})
		slot_0_46_0.ui_tables[arg_23_1][arg_43_1] = var_43_2
		arg_23_0.elements[#arg_23_0.elements + 1] = var_43_2

		return var_43_2
	end

	function var_23_0.color_picker(arg_47_0, arg_47_1, arg_47_2, arg_47_3, arg_47_4, arg_47_5)
		if not arg_47_0.gear_ref and arg_47_2 then
			arg_47_0.gear_ref = arg_47_0.ref:create()
		end

		local var_47_0 = arg_47_0.gear_ref and arg_47_0.gear_ref:color_picker(arg_47_2, arg_47_3) or arg_47_0.ref:color_picker(arg_47_3)
		local var_47_1 = arg_47_4 and arg_47_4 or function()
			return true
		end
		local var_47_2 = slot_0_46_0.get_default_gear_table(var_23_0, arg_23_1, arg_47_1, arg_47_5, var_47_0, var_47_1, arg_47_0.group_table)

		var_47_2.type = 5
		var_47_2.def_value = arg_47_3

		local var_47_3 = setmetatable(var_47_2, {
			__call = function(arg_49_0)
				return arg_49_0.ref
			end
		})

		slot_0_46_0.ui_tables[arg_23_1][arg_47_1] = var_47_3
		arg_23_0.elements[#arg_23_0.elements + 1] = var_47_3

		return var_47_3
	end

	function var_23_0.button(arg_50_0, arg_50_1, arg_50_2, arg_50_3, arg_50_4, arg_50_5, arg_50_6)
		if not arg_50_0.gear_ref then
			arg_50_0.gear_ref = arg_50_0.ref:create()
		end

		local var_50_0 = arg_50_0.gear_ref:button(arg_50_2, arg_50_3, arg_50_4 and arg_50_4 or false)
		local var_50_1 = arg_50_5 and arg_50_5 or function()
			return true
		end
		local var_50_2 = slot_0_46_0.get_default_gear_table(var_23_0, arg_23_1, arg_50_1, arg_50_6, var_50_0, var_50_1, arg_50_0.group_table)

		var_50_2.type = 6
		var_50_2.def_value = nil

		local var_50_3 = setmetatable(var_50_2, {
			__call = function(arg_52_0)
				return arg_52_0.ref
			end
		})

		slot_0_46_0.ui_tables[arg_23_1][arg_50_1] = var_50_3
		arg_23_0.elements[#arg_23_0.elements + 1] = var_50_3

		return var_50_3
	end

	function var_23_0.hotkey(arg_53_0, arg_53_1, arg_53_2, arg_53_3, arg_53_4, arg_53_5, arg_53_6)
		if not arg_53_0.gear_ref then
			arg_53_0.gear_ref = arg_53_0.ref:create()
		end

		local var_53_0 = arg_53_0.gear_ref:hotkey(arg_53_2, arg_53_3)
		local var_53_1 = arg_53_5 and arg_53_5 or function()
			return true
		end
		local var_53_2 = slot_0_46_0.get_default_gear_table(var_23_0, arg_23_1, arg_53_1, arg_53_6, var_53_0, var_53_1, arg_53_0.group_table)

		var_53_2.type = 7
		var_53_2.def_value = arg_53_3

		function var_53_2.key(arg_55_0, arg_55_1)
			if not arg_55_1 then
				return arg_55_0.ref:key()
			end

			arg_55_0.ref:key(arg_55_1)
		end

		var_53_2.ref:unset_callback(var_53_2._callback_func)

		var_53_2._holding = false
		var_53_2.mode = arg_53_4

		if arg_53_4 == 1 then
			function var_53_2._createmove_func()
				var_53_2._holding = var_53_2.ref:get()
				var_53_2.value = var_53_2._holding

				if var_53_2._holding then
					local var_56_0 = var_53_2.callbacks_funcs

					for iter_56_0 = 1, #var_56_0 do
						var_56_0[iter_56_0]()
					end
				end
			end
		else
			var_53_2._prev_state = false

			function var_53_2._createmove_func()
				var_53_2._holding = var_53_2.ref:get()

				if not var_53_2._holding and var_53_2._prev_state then
					var_53_2.value = not var_53_2.value

					local var_57_0 = var_53_2.callbacks_funcs

					for iter_57_0 = 1, #var_57_0 do
						var_57_0[iter_57_0]()
					end
				end

				var_53_2._prev_state = var_53_2._holding
			end
		end

		events.createmove:set(var_53_2._createmove_func)

		var_53_2.callbacks_funcs = {}

		function var_53_2.set_callback(arg_58_0, arg_58_1, arg_58_2)
			arg_58_0.callbacks_funcs[#arg_58_0.callbacks_funcs + 1] = arg_58_1

			if arg_58_2 then
				arg_58_1()
			end
		end

		function var_53_2.unset_callback(arg_59_0, arg_59_1)
			for iter_59_0 = 1, #arg_59_0.callbacks_funcs do
				if arg_59_0.callbacks_funcs[iter_59_0] == arg_59_1 then
					table.remove(arg_59_0.callbacks_funcs, iter_59_0)

					break
				end
			end
		end

		var_53_2 = setmetatable(var_53_2, {
			__call = function(arg_60_0)
				return arg_60_0.ref
			end
		})
		slot_0_46_0.ui_tables[arg_23_1][arg_53_1] = var_53_2
		arg_23_0.elements[#arg_23_0.elements + 1] = var_53_2

		return var_53_2
	end

	function var_23_0.text_box(arg_61_0, arg_61_1, arg_61_2, arg_61_3, arg_61_4, arg_61_5)
		if not arg_61_0.gear_ref then
			arg_61_0.gear_ref = arg_61_0.ref:create()
		end

		local var_61_0 = arg_61_0.gear_ref:input(arg_61_2, arg_61_3)
		local var_61_1 = arg_61_4 and arg_61_4 or function()
			return true
		end
		local var_61_2 = slot_0_46_0.get_default_gear_table(var_23_0, arg_23_1, arg_61_1, arg_61_5, var_61_0, var_61_1, arg_61_0.group_table)

		var_61_2.type = 8
		var_61_2.def_value = arg_61_3

		local var_61_3 = setmetatable(var_61_2, {
			__call = function(arg_63_0)
				return arg_63_0.ref
			end
		})

		slot_0_46_0.ui_tables[arg_23_1][arg_61_1] = var_61_3
		arg_23_0.elements[#arg_23_0.elements + 1] = var_61_3

		return var_61_3
	end

	function var_23_0.list(arg_64_0, arg_64_1, arg_64_2, arg_64_3, arg_64_4, arg_64_5, arg_64_6)
		if not arg_64_0.gear_ref then
			arg_64_0.gear_ref = arg_64_0.ref:create()
		end

		local var_64_0 = arg_64_0.gear_ref:list(arg_64_2, arg_64_3)
		local var_64_1 = arg_64_5 and arg_64_5 or function()
			return true
		end
		local var_64_2 = slot_0_46_0.get_default_gear_table(var_23_0, arg_23_1, arg_64_1, arg_64_6, var_64_0, var_64_1, arg_64_0.group_table)

		var_64_2.type = 9
		var_64_2.def_value = arg_64_4
		var_64_2.elements_array = arg_64_3
		var_64_2.list_by_name = {}

		for iter_64_0 = 1, #arg_64_3 do
			var_64_2.list_by_name[arg_64_3[iter_64_0]] = iter_64_0
		end

		var_64_2.str_value = var_64_0:get()
		var_64_2.value = var_64_2.list_by_name[var_64_2.str_value]

		var_64_2.ref:unset_callback(var_64_2._callback_func)

		function var_64_2._callback_func(arg_66_0)
			local var_66_0 = var_64_2.ref:get()

			var_64_2.value = var_66_0
			var_64_2.str_value = var_64_2.elements_array[var_66_0]
			var_64_2.value_for_ref = var_66_0
			slot_0_46_0.values[arg_23_1][arg_64_1] = var_66_0

			local var_66_1 = var_64_2._vis_func()

			if var_64_2.group_table._vis_func then
				var_66_1 = var_66_1 and var_64_2.group_table._vis_func()
			end

			var_66_1 = (arg_64_6 or var_64_2.parent_table.value) and var_66_1

			if arg_66_0 then
				for iter_66_0 = 1, #var_64_2._callbacks_list do
					var_64_2._callbacks_list[iter_66_0]()
				end
			end

			if arg_66_0 and slot_0_46_0.is_loaded then
				var_64_2.group_table:update()
			end

			local var_66_2 = var_64_2._dis_func and var_64_2._dis_func() or nil

			if var_64_2.group_table._dis_func then
				var_66_2 = var_66_2 or var_64_2.group_table._dis_func()
			end

			if var_66_2 ~= nil and var_64_2._disabled ~= var_66_2 then
				var_64_2._disabled = var_66_2

				var_64_2.ref:disabled(var_66_2)
			end

			if var_64_2._vis_state ~= var_66_1 then
				var_64_2._vis_state = var_66_1

				var_64_2.ref:visibility(var_64_2._vis_state)
			end
		end

		var_64_2.ref:set_callback(var_64_2._callback_func, true)

		var_64_2 = setmetatable(var_64_2, {
			__call = function(arg_67_0)
				return arg_67_0.ref
			end
		})
		slot_0_46_0.ui_tables[arg_23_1][arg_64_1] = var_64_2
		arg_23_0.elements[#arg_23_0.elements + 1] = var_64_2

		return var_64_2
	end

	function var_23_0.listable(arg_68_0, arg_68_1, arg_68_2, arg_68_3, arg_68_4, arg_68_5, arg_68_6)
		if not arg_68_0.gear_ref then
			arg_68_0.gear_ref = arg_68_0.ref:create()
		end

		local var_68_0 = arg_68_0.gear_ref:listable(arg_68_2, arg_68_3)
		local var_68_1 = arg_68_5 and arg_68_5 or function()
			return true
		end
		local var_68_2 = slot_0_46_0.get_default_gear_table(var_23_0, arg_23_1, arg_68_1, arg_68_6, var_68_0, var_68_1, arg_68_0.group_table)

		var_68_2.type = 10
		var_68_2.def_value = arg_68_4
		var_68_2.elements_array = arg_68_3
		var_68_2.list_by_name = {}

		for iter_68_0 = 1, #arg_68_3 do
			var_68_2.list_by_name[arg_68_3[iter_68_0]] = iter_68_0
		end

		var_68_2.str_value = var_68_0:get()
		var_68_2.value = var_68_0:get()
		var_68_2.value_by_name = {}

		for iter_68_1 = 1, #var_68_2.value do
			var_68_2.value_by_name[var_68_2.value[iter_68_1]] = true
		end

		var_68_2.ref:unset_callback(var_68_2._callback_func)

		function var_68_2._callback_func(arg_70_0)
			local var_70_0 = var_68_2.ref:get()

			var_68_2.value = var_70_0
			var_68_2.str_value = var_70_0
			var_68_2.value_for_ref = var_70_0
			var_68_2.value_by_name = {}

			for iter_70_0 = 1, #var_68_2.value do
				var_68_2.value_by_name[var_68_2.value[iter_70_0]] = true
			end

			slot_0_46_0.values[arg_23_1][arg_68_1] = var_70_0

			local var_70_1 = var_68_2._vis_func()

			if var_68_2.group_table._vis_func then
				var_70_1 = var_70_1 and var_68_2.group_table._vis_func()
			end

			var_70_1 = (arg_68_6 or var_68_2.parent_table.value) and var_70_1

			if arg_70_0 then
				for iter_70_1 = 1, #var_68_2._callbacks_list do
					var_68_2._callbacks_list[iter_70_1]()
				end
			end

			if arg_70_0 and slot_0_46_0.is_loaded then
				var_68_2.group_table:update()
			end

			local var_70_2 = var_68_2._dis_func and var_68_2._dis_func() or nil

			if var_68_2.group_table._dis_func then
				var_70_2 = var_70_2 or var_68_2.group_table._dis_func()
			end

			if var_70_2 ~= nil and var_68_2._disabled ~= var_70_2 then
				var_68_2._disabled = var_70_2

				var_68_2.ref:disabled(var_70_2)
			end

			if var_68_2._vis_state ~= var_70_1 then
				var_68_2._vis_state = var_70_1

				var_68_2.ref:visibility(var_68_2._vis_state)
			end
		end

		var_68_2.ref:set_callback(var_68_2._callback_func, true)

		var_68_2 = setmetatable(var_68_2, {
			__call = function(arg_71_0)
				return arg_71_0.ref
			end
		})
		slot_0_46_0.ui_tables[arg_23_1][arg_68_1] = var_68_2
		arg_23_0.elements[#arg_23_0.elements + 1] = var_68_2

		return var_68_2
	end

	function var_23_0.label(arg_72_0, arg_72_1, arg_72_2, arg_72_3, arg_72_4, arg_72_5)
		if not arg_72_0.gear_ref then
			arg_72_0.gear_ref = arg_72_0.ref:create()
		end

		local var_72_0 = arg_72_0.gear_ref:label(arg_72_2)
		local var_72_1 = arg_72_4 and arg_72_4 or function()
			return true
		end
		local var_72_2 = slot_0_46_0.get_default_gear_table(var_23_0, "label", arg_72_1, arg_72_5, var_72_0, var_72_1, arg_72_0.group_table)

		var_72_2.type = 11
		var_72_2.def_value = arg_72_3

		local var_72_3 = setmetatable(var_72_2, {
			__call = function(arg_74_0)
				return arg_74_0.ref
			end
		})

		slot_0_46_0.ui_tables.label[arg_72_1] = var_72_3
		arg_23_0.elements[#arg_23_0.elements + 1] = var_72_3

		return var_72_3
	end

	return var_23_0
end

function slot_0_46_0.get_default_gear_table(arg_75_0, arg_75_1, arg_75_2, arg_75_3, arg_75_4, arg_75_5, arg_75_6)
	if not slot_0_46_0.values[arg_75_1] then
		slot_0_46_0.values[arg_75_1] = {}
	end

	if not slot_0_46_0.ui_tables[arg_75_1] then
		slot_0_46_0.ui_tables[arg_75_1] = {}
	end

	local var_75_0 = {
		ref = arg_75_4,
		value_for_ref = arg_75_4:get()
	}

	var_75_0.value = nil
	var_75_0._vis_func = arg_75_5
	var_75_0._vis_state = var_75_0._vis_func()
	var_75_0._dis_func = nil
	var_75_0.group_table = arg_75_6
	var_75_0.parent_table = arg_75_0
	var_75_0._callbacks_list = {}

	function var_75_0.visible(arg_76_0, arg_76_1)
		if arg_76_1 ~= nil and arg_76_0._vis_state ~= arg_76_1 then
			arg_76_0.ref:visibility(arg_76_1)

			arg_76_0._vis_state = arg_76_1
		end

		return arg_76_0._vis_state
	end

	var_75_0._disabled = false

	function var_75_0.disabled(arg_77_0, arg_77_1)
		if arg_77_1 == nil then
			return arg_77_0.ref:disabled()
		end

		if var_75_0._disabled ~= arg_77_1 then
			var_75_0._disabled = arg_77_1

			arg_77_0.ref:disabled(arg_77_1)
		end
	end

	function var_75_0._callback_func(arg_78_0)
		local var_78_0 = var_75_0.ref:get()

		var_75_0.value = var_78_0
		var_75_0.value_for_ref = var_78_0
		slot_0_46_0.values[arg_75_1][arg_75_2] = var_78_0

		local var_78_1 = var_75_0._vis_func()

		var_78_1 = (arg_75_3 or var_75_0.parent_table.value) and var_78_1

		if arg_78_0 then
			for iter_78_0 = 1, #var_75_0._callbacks_list do
				var_75_0._callbacks_list[iter_78_0]()
			end
		end

		if arg_78_0 and slot_0_46_0.is_loaded then
			var_75_0.group_table:update()
		end

		if var_75_0._vis_state ~= var_78_1 then
			var_75_0._vis_state = var_78_1

			var_75_0.ref:visibility(var_75_0._vis_state)
		end

		local var_78_2

		if var_75_0._dis_func then
			var_78_2 = var_75_0._dis_func()
		end

		if var_75_0.group_table._dis_func then
			var_78_2 = var_78_2 or var_75_0.group_table._dis_func()
		end

		if var_78_2 ~= nil and var_75_0._disabled ~= var_78_2 then
			var_75_0._disabled = var_78_2

			var_75_0.ref:disabled(var_78_2)
		end
	end

	var_75_0.ref:set_callback(var_75_0._callback_func, true)

	function var_75_0.set_callback(arg_79_0, arg_79_1, arg_79_2)
		arg_79_0._callbacks_list[#arg_79_0._callbacks_list + 1] = arg_79_1

		if arg_79_2 then
			arg_79_1()
		end

		return arg_79_1
	end

	function var_75_0.unset_callback(arg_80_0, arg_80_1)
		for iter_80_0 = 1, #arg_80_0._callbacks_list do
			if arg_80_0._callbacks_list[iter_80_0] == arg_80_1 then
				table.remove(arg_80_0._callbacks_list, iter_80_0)

				break
			end
		end
	end

	function var_75_0.set_disable_function(arg_81_0, arg_81_1)
		arg_81_0._dis_func = arg_81_1
	end

	function var_75_0.tooltip(arg_82_0, arg_82_1)
		if not arg_82_1 then
			return arg_82_0.ref:tooltip()
		end

		arg_82_0.ref:tooltip(arg_82_1)
	end

	function var_75_0.name(arg_83_0, arg_83_1)
		if not arg_83_1 then
			return arg_83_0.ref:name()
		end

		arg_83_0.ref:name(arg_83_1)
	end

	function var_75_0.visible_condition(arg_84_0, ...)
		local var_84_0 = {
			...
		}

		function arg_84_0._vis_func()
			local var_85_0 = true

			if not var_84_0[1].type then
				local var_85_1 = var_84_0[1]

				for iter_85_0 = 1, #var_85_1 do
					local var_85_2 = var_85_1[iter_85_0]
					local var_85_3 = var_85_2[1].type

					if var_85_3 == 3 or var_85_3 == 4 or var_85_3 == 9 or var_85_3 == 10 then
						if type(var_85_2[2]) == "string" then
							if var_85_2[1].str_value ~= var_85_2[2] then
								var_85_0 = false

								break
							end
						elseif var_85_2[1].value ~= var_85_2[2] then
							var_85_0 = false

							break
						end
					elseif var_85_2[1].value ~= var_85_2[2] then
						var_85_0 = false

						break
					end
				end
			else
				local var_85_4 = var_84_0
				local var_85_5 = var_85_4[1].type

				if var_85_5 == 3 or var_85_5 == 4 or var_85_5 == 9 or var_85_5 == 10 then
					if type(var_85_4[2]) == "string" then
						if var_85_4[1].str_value ~= var_85_4[2] then
							var_85_0 = false
						end
					elseif var_85_4[1].value ~= var_85_4[2] then
						var_85_0 = false
					end
				elseif var_85_4[1].value ~= var_85_4[2] then
					var_85_0 = false
				end
			end

			var_75_0:visible(var_85_0)
		end
	end

	function var_75_0.color_picker(arg_86_0, arg_86_1, arg_86_2, arg_86_3, arg_86_4)
		local var_86_0 = arg_86_0.ref:color_picker(arg_86_2)
		local var_86_1 = arg_86_3 and arg_86_3 or function()
			return true
		end
		local var_86_2 = slot_0_46_0.get_default_gear_table(var_75_0, arg_75_1, arg_86_1, arg_86_4, var_86_0, var_86_1, arg_86_0.group_table)

		var_86_2.type = 5
		var_86_2.def_value = arg_86_2

		local var_86_3 = setmetatable(var_86_2, {
			__call = function(arg_88_0)
				return arg_88_0.ref
			end
		})

		slot_0_46_0.ui_tables[arg_75_1][arg_86_1] = var_86_3
		arg_75_6.elements[#arg_75_6.elements + 1] = var_86_3

		return var_86_3
	end

	return var_75_0
end

function slot_0_46_0.create_group(arg_89_0, arg_89_1)
	local var_89_0 = {
		tab_name = slot_0_46_0.active_tab,
		elements = {},
		ref = ui.create(slot_0_46_0.active_tab, arg_89_0, arg_89_1)
	}

	var_89_0._vis_func = nil
	var_89_0._dis_func = nil

	function var_89_0.update(arg_90_0)
		local var_90_0 = arg_90_0.elements
		local var_90_1
		local var_90_2

		if arg_90_0._vis_func then
			var_90_1 = arg_90_0._vis_func()
		end

		if arg_90_0._dis_func then
			var_90_2 = arg_90_0._dis_func()
		end

		for iter_90_0 = 1, #var_90_0 do
			local var_90_3 = var_90_0[iter_90_0]

			if var_90_1 ~= nil then
				var_90_3:visible(var_90_1)
			end

			if var_90_2 ~= nil then
				var_90_3:disabled(var_90_2)
			end

			var_90_3._callback_func()
		end

		local var_90_4 = arg_90_0.callbacks_funcs

		for iter_90_1 = 1, #var_90_4 do
			var_90_4[iter_90_1]()
		end
	end

	function var_89_0.visible_condition(arg_91_0, arg_91_1)
		arg_91_0._vis_func = arg_91_1

		return arg_91_1
	end

	function var_89_0.disabled_condition(arg_92_0, arg_92_1)
		arg_92_0._dis_func = arg_92_1

		return arg_92_1
	end

	var_89_0.callbacks_funcs = {}

	function var_89_0.set_callback(arg_93_0, arg_93_1, arg_93_2)
		arg_93_0.callbacks_funcs[#arg_93_0.callbacks_funcs + 1] = arg_93_1

		if arg_93_2 then
			arg_93_1()
		end
	end

	function var_89_0.unset_callback(arg_94_0, arg_94_1)
		for iter_94_0 = 1, #arg_94_0.callbacks_funcs do
			if arg_94_0.callbacks_funcs[iter_94_0] == arg_94_1 then
				table.remove(arg_94_0.callbacks_funcs, iter_94_0)

				break
			end
		end
	end

	function var_89_0.switch(arg_95_0, arg_95_1, arg_95_2, arg_95_3, arg_95_4, arg_95_5, arg_95_6, arg_95_7)
		local var_95_0 = arg_95_0.ref:switch(arg_95_3, arg_95_4)
		local var_95_1 = arg_95_5 and arg_95_5 or function()
			return true
		end
		local var_95_2 = slot_0_46_0.get_default_ui_el_table(var_89_0, arg_95_1, arg_95_2, var_95_0, var_95_1)

		var_95_2.value = var_95_0:get()
		var_95_2.type = 1
		var_95_2.def_value = arg_95_4
		var_95_2.def_name = arg_95_3
		var_95_2.disabled_icon = arg_95_6 == nil and "" or arg_95_6
		var_95_2.enabled_icon = arg_95_7 == nil and "" or arg_95_7
		var_95_2.enabled_text = var_95_2.enabled_icon .. arg_95_3
		var_95_2.disabled_text = var_95_2.disabled_icon .. arg_95_3

		var_95_2:set_callback(function()
			var_95_0:name(var_95_2.value and var_95_2.enabled_text or var_95_2.disabled_text)
		end, true)

		var_95_2 = setmetatable(var_95_2, {
			__call = function(arg_98_0)
				return arg_98_0.ref
			end
		})
		slot_0_46_0.ui_tables[arg_95_1][arg_95_2] = var_95_2
		var_89_0.elements[#var_89_0.elements + 1] = var_95_2

		return var_95_2
	end

	function var_89_0.slider(arg_99_0, arg_99_1, arg_99_2, arg_99_3, arg_99_4, arg_99_5, arg_99_6, arg_99_7, arg_99_8, arg_99_9)
		local var_99_0 = arg_99_0.ref:slider(arg_99_3, arg_99_4, arg_99_5, arg_99_6, arg_99_7, arg_99_8)
		local var_99_1 = arg_99_9 and arg_99_9 or function()
			return true
		end
		local var_99_2 = slot_0_46_0.get_default_ui_el_table(var_89_0, arg_99_1, arg_99_2, var_99_0, var_99_1)

		var_99_2.type = 2
		var_99_2.def_value = arg_99_6

		local var_99_3 = setmetatable(var_99_2, {
			__call = function(arg_101_0)
				return arg_101_0.ref
			end
		})

		slot_0_46_0.ui_tables[arg_99_1][arg_99_2] = var_99_3
		var_89_0.elements[#var_89_0.elements + 1] = var_99_3

		return var_99_3
	end

	function var_89_0.combo(arg_102_0, arg_102_1, arg_102_2, arg_102_3, arg_102_4, arg_102_5, arg_102_6)
		local var_102_0 = arg_102_0.ref:combo(arg_102_3, arg_102_4)
		local var_102_1 = arg_102_6 and arg_102_6 or function()
			return true
		end
		local var_102_2 = slot_0_46_0.get_default_ui_el_table(var_89_0, arg_102_1, arg_102_2, var_102_0, var_102_1)

		var_102_2.type = 3
		var_102_2.def_value = arg_102_5
		var_102_2.elements_array = arg_102_4
		var_102_2.list_by_name = {}

		for iter_102_0 = 1, #arg_102_4 do
			var_102_2.list_by_name[arg_102_4[iter_102_0]] = iter_102_0
		end

		var_102_2.str_value = var_102_0:get()
		var_102_2.value = var_102_2.list_by_name[var_102_2.str_value]

		var_102_2.ref:unset_callback(var_102_2._callback_func)

		function var_102_2._callback_func(arg_104_0)
			local var_104_0 = var_102_2.ref:get()

			var_102_2.value = var_102_2.list_by_name[var_104_0]
			var_102_2.str_value = var_104_0
			var_102_2.value_for_ref = var_104_0
			slot_0_46_0.values[arg_102_1][arg_102_2] = var_104_0

			local var_104_1 = var_102_2._vis_func()

			if var_102_2.group_table._vis_func then
				var_104_1 = var_104_1 and var_102_2.group_table._vis_func()
			end

			if arg_104_0 then
				for iter_104_0 = 1, #var_102_2._callbacks_list do
					var_102_2._callbacks_list[iter_104_0]()
				end
			end

			if arg_104_0 and slot_0_46_0.is_loaded then
				var_102_2.group_table:update()
			end

			local var_104_2 = var_102_2._dis_func and var_102_2._dis_func() or nil

			if var_102_2.group_table._dis_func then
				var_104_2 = var_104_2 and var_102_2.group_table._dis_func()
			end

			if var_104_2 ~= nil and var_102_2._disabled ~= var_104_2 then
				var_102_2._disabled = var_104_2

				var_102_2.ref:disabled(var_104_2)
			end

			if var_102_2._vis_state ~= var_104_1 then
				var_102_2._vis_state = var_104_1

				var_102_2.ref:visibility(var_102_2._vis_state)
			end
		end

		var_102_2.ref:set_callback(var_102_2._callback_func)

		var_102_2 = setmetatable(var_102_2, {
			__call = function(arg_105_0)
				return arg_105_0.ref
			end
		})
		slot_0_46_0.ui_tables[arg_102_1][arg_102_2] = var_102_2
		var_89_0.elements[#var_89_0.elements + 1] = var_102_2

		return var_102_2
	end

	function var_89_0.selectable(arg_106_0, arg_106_1, arg_106_2, arg_106_3, arg_106_4, arg_106_5, arg_106_6)
		local var_106_0 = arg_106_0.ref:selectable(arg_106_3, arg_106_4)
		local var_106_1 = arg_106_6 and arg_106_6 or function()
			return true
		end
		local var_106_2 = slot_0_46_0.get_default_ui_el_table(var_89_0, arg_106_1, arg_106_2, var_106_0, var_106_1)

		var_106_2.type = 4
		var_106_2.def_value = arg_106_5
		var_106_2.elements_array = arg_106_4
		var_106_2.list_by_name = {}

		for iter_106_0 = 1, #arg_106_4 do
			var_106_2.list_by_name[arg_106_4[iter_106_0]] = iter_106_0
		end

		var_106_2.value = var_106_0:get()
		var_106_2.value_by_name = {}

		for iter_106_1 = 1, #var_106_2.value do
			var_106_2.value_by_name[var_106_2.value[iter_106_1]] = true
		end

		var_106_2.ref:unset_callback(var_106_2._callback_func)

		function var_106_2._callback_func(arg_108_0)
			local var_108_0 = var_106_2.ref:get()

			var_106_2.value = var_108_0
			var_106_2.value_for_ref = var_108_0
			var_106_2.value_by_name = {}

			for iter_108_0 = 1, #var_108_0 do
				var_106_2.value_by_name[var_108_0[iter_108_0]] = true
			end

			slot_0_46_0.values[arg_106_1][arg_106_2] = var_108_0

			local var_108_1 = var_106_2._vis_func()

			if var_106_2.group_table._vis_func then
				var_108_1 = var_108_1 and var_106_2.group_table._vis_func()
			end

			if arg_108_0 then
				for iter_108_1 = 1, #var_106_2._callbacks_list do
					var_106_2._callbacks_list[iter_108_1]()
				end
			end

			if arg_108_0 and slot_0_46_0.is_loaded then
				var_106_2.group_table:update()
			end

			if var_106_2._vis_state ~= var_108_1 then
				var_106_2._vis_state = var_108_1

				var_106_2.ref:visibility(var_106_2._vis_state)
			end
		end

		var_106_2.ref:set_callback(var_106_2._callback_func)

		var_106_2 = setmetatable(var_106_2, {
			__call = function(arg_109_0, arg_109_1)
				if arg_109_1 then
					return arg_109_0.value_by_name[arg_109_1] and true or false
				end

				return arg_109_0.ref
			end
		})
		slot_0_46_0.ui_tables[arg_106_1][arg_106_2] = var_106_2
		var_89_0.elements[#var_89_0.elements + 1] = var_106_2

		return var_106_2
	end

	function var_89_0.color_picker(arg_110_0, arg_110_1, arg_110_2, arg_110_3, arg_110_4, arg_110_5)
		local var_110_0 = arg_110_0.ref:color_picker(arg_110_3, arg_110_4)
		local var_110_1 = arg_110_5 and arg_110_5 or function()
			return true
		end
		local var_110_2 = slot_0_46_0.get_default_ui_el_table(var_89_0, arg_110_1, arg_110_2, var_110_0, var_110_1)

		var_110_2.type = 5
		var_110_2.def_value = arg_110_4
		var_110_2.value = var_110_0:get()

		local var_110_3 = setmetatable(var_110_2, {
			__call = function(arg_112_0, arg_112_1)
				if arg_112_1 then
					return arg_112_0.ref
				end

				return arg_112_0.ref
			end
		})

		slot_0_46_0.ui_tables[arg_110_1][arg_110_2] = var_110_3
		var_89_0.elements[#var_89_0.elements + 1] = var_110_3

		return var_110_3
	end

	function var_89_0.button(arg_113_0, arg_113_1, arg_113_2, arg_113_3, arg_113_4, arg_113_5, arg_113_6)
		local var_113_0 = arg_113_0.ref:button(arg_113_3, arg_113_4 and arg_113_4 or function()
			return
		end, arg_113_5 and arg_113_5 or false)
		local var_113_1 = arg_113_6 and arg_113_6 or function()
			return true
		end
		local var_113_2 = slot_0_46_0.get_default_ui_el_table(var_89_0, arg_113_1, arg_113_2, var_113_0, var_113_1)

		var_113_2.type = 6

		local var_113_3 = setmetatable(var_113_2, {
			__call = function(arg_116_0, arg_116_1)
				if arg_116_1 then
					return arg_116_0.ref
				end

				return arg_116_0.ref
			end
		})

		slot_0_46_0.ui_tables[arg_113_1][arg_113_2] = var_113_3
		var_89_0.elements[#var_89_0.elements + 1] = var_113_3

		return var_113_3
	end

	function var_89_0.hotkey(arg_117_0, arg_117_1, arg_117_2, arg_117_3, arg_117_4, arg_117_5, arg_117_6)
		local var_117_0 = arg_117_0.ref:hotkey(arg_117_3, arg_117_4)
		local var_117_1 = arg_117_6 and arg_117_6 or function()
			return true
		end
		local var_117_2 = slot_0_46_0.get_default_ui_el_table(var_89_0, arg_117_1, arg_117_2, var_117_0, var_117_1)

		var_117_2.type = 7
		var_117_2.def_value = arg_117_4

		function var_117_2.key(arg_119_0, arg_119_1)
			if not arg_119_1 then
				return arg_119_0.ref:key()
			end

			arg_119_0.ref:key(arg_119_1)
		end

		var_117_2.ref:unset_callback(var_117_2._callback_func)

		var_117_2._holding = false
		var_117_2.mode = arg_117_5

		if arg_117_5 == 1 then
			function var_117_2._createmove_func()
				var_117_2._holding = var_117_2.ref:get()
				var_117_2.value = var_117_2._holding

				if var_117_2._holding then
					local var_120_0 = var_117_2.callbacks_funcs

					for iter_120_0 = 1, #var_120_0 do
						var_120_0[iter_120_0]()
					end
				end
			end
		else
			var_117_2._prev_state = false

			function var_117_2._createmove_func()
				var_117_2._holding = var_117_2.ref:get()

				if not var_117_2._holding and var_117_2._prev_state then
					var_117_2.value = not var_117_2.value

					local var_121_0 = var_117_2.callbacks_funcs

					for iter_121_0 = 1, #var_121_0 do
						var_121_0[iter_121_0]()
					end
				end

				var_117_2._prev_state = var_117_2._holding
			end
		end

		events.createmove:set(var_117_2._createmove_func)

		var_117_2.callbacks_funcs = {}

		function var_117_2.set_callback(arg_122_0, arg_122_1, arg_122_2)
			arg_122_0.callbacks_funcs[#arg_122_0.callbacks_funcs + 1] = arg_122_1

			if arg_122_2 then
				arg_122_1()
			end
		end

		function var_117_2.unset_callback(arg_123_0, arg_123_1)
			for iter_123_0 = 1, #arg_123_0.callbacks_funcs do
				if arg_123_0.callbacks_funcs[iter_123_0] == arg_123_1 then
					table.remove(arg_123_0.callbacks_funcs, iter_123_0)

					break
				end
			end
		end

		var_117_2 = setmetatable(var_117_2, {
			__call = function(arg_124_0, arg_124_1)
				if arg_124_1 then
					return arg_124_0.ref
				end

				return arg_124_0.ref
			end
		})
		slot_0_46_0.ui_tables[arg_117_1][arg_117_2] = var_117_2
		var_89_0.elements[#var_89_0.elements + 1] = var_117_2

		return var_117_2
	end

	function var_89_0.text_box(arg_125_0, arg_125_1, arg_125_2, arg_125_3, arg_125_4, arg_125_5)
		local var_125_0 = arg_125_0.ref:input(arg_125_3, arg_125_4)
		local var_125_1 = arg_125_5 and arg_125_5 or function()
			return true
		end
		local var_125_2 = slot_0_46_0.get_default_ui_el_table(var_89_0, arg_125_1, arg_125_2, var_125_0, var_125_1)

		var_125_2.type = 8
		var_125_2.def_value = arg_125_4
		var_125_2.value = var_125_0:get()

		local var_125_3 = setmetatable(var_125_2, {
			__call = function(arg_127_0, arg_127_1)
				if arg_127_1 then
					return arg_127_0.ref
				end

				return arg_127_0.ref
			end
		})

		slot_0_46_0.ui_tables[arg_125_1][arg_125_2] = var_125_3
		var_89_0.elements[#var_89_0.elements + 1] = var_125_3

		return var_125_3
	end

	function var_89_0.list(arg_128_0, arg_128_1, arg_128_2, arg_128_3, arg_128_4, arg_128_5, arg_128_6)
		local var_128_0 = arg_128_0.ref:list(arg_128_3, arg_128_4)
		local var_128_1 = arg_128_6 and arg_128_6 or function()
			return true
		end
		local var_128_2 = slot_0_46_0.get_default_ui_el_table(var_89_0, arg_128_1, arg_128_2, var_128_0, var_128_1)

		var_128_2.type = 9
		var_128_2.def_value = arg_128_5
		var_128_2.elements_array = arg_128_4
		var_128_2.list_by_name = {}

		for iter_128_0 = 1, #arg_128_4 do
			var_128_2.list_by_name[arg_128_4[iter_128_0]] = iter_128_0
		end

		var_128_2.value = var_128_0:get()
		var_128_2.str_value = var_128_2.elements_array[var_128_2.value]

		var_128_2.ref:unset_callback(var_128_2._callback_func)

		function var_128_2._callback_func(arg_130_0)
			local var_130_0 = var_128_2.ref:get()

			var_128_2.value = var_130_0
			var_128_2.str_value = var_128_2.elements_array[var_130_0]
			var_128_2.value_for_ref = var_130_0
			slot_0_46_0.values[arg_128_1][arg_128_2] = var_130_0

			local var_130_1 = var_128_2._vis_func()

			if var_128_2.group_table._vis_func then
				var_130_1 = var_130_1 and var_128_2.group_table._vis_func()
			end

			if arg_130_0 then
				for iter_130_0 = 1, #var_128_2._callbacks_list do
					var_128_2._callbacks_list[iter_130_0]()
				end
			end

			if arg_130_0 and slot_0_46_0.is_loaded then
				var_128_2.group_table:update()
			end

			if var_128_2._vis_state ~= var_130_1 then
				var_128_2.ref:visibility(var_128_2._vis_state)
			end
		end

		var_128_2.ref:set_callback(var_128_2._callback_func)

		function var_128_2.change_default_callback_function(arg_131_0, arg_131_1)
			arg_131_0.ref:unset_callback(var_128_2._callback_func)
			arg_131_0.ref:set_callback(arg_131_1, true)

			return arg_131_1
		end

		function var_128_2.update(arg_132_0, arg_132_1)
			arg_132_0.elements_array = arg_132_1

			arg_132_0.ref:update(arg_132_1)
		end

		function var_128_2.visualize_update(arg_133_0)
			if arg_133_0.func_visualize then
				arg_133_0.func_visualize()
			end
		end

		var_128_2 = setmetatable(var_128_2, {
			__call = function(arg_134_0)
				return arg_134_0.ref
			end
		})
		slot_0_46_0.ui_tables[arg_128_1][arg_128_2] = var_128_2
		var_89_0.elements[#var_89_0.elements + 1] = var_128_2

		return var_128_2
	end

	function var_89_0.listable(arg_135_0, arg_135_1, arg_135_2, arg_135_3, arg_135_4, arg_135_5, arg_135_6)
		local var_135_0 = arg_135_0.ref:listable(arg_135_3, arg_135_4)
		local var_135_1 = arg_135_6 and arg_135_6 or function()
			return true
		end
		local var_135_2 = slot_0_46_0.get_default_ui_el_table(var_89_0, arg_135_1, arg_135_2, var_135_0, var_135_1)

		var_135_2.type = 4
		var_135_2.def_value = arg_135_5
		var_135_2.elements_array = arg_135_4
		var_135_2.list_by_name = {}

		for iter_135_0 = 1, #arg_135_4 do
			var_135_2.list_by_name[arg_135_4[iter_135_0]] = iter_135_0
		end

		var_135_2.value = var_135_0:get()
		var_135_2.value_by_name = {}

		for iter_135_1 = 1, #var_135_2.value do
			var_135_2.value_by_name[var_135_2.value[iter_135_1]] = true
		end

		var_135_2.ref:unset_callback(var_135_2._callback_func)

		function var_135_2._callback_func(arg_137_0)
			local var_137_0 = var_135_2.ref:get()

			var_135_2.value = var_137_0
			var_135_2.value_for_ref = var_137_0
			var_135_2.value_by_name = {}

			for iter_137_0 = 1, #var_137_0 do
				var_135_2.value_by_name[var_137_0[iter_137_0]] = true
			end

			slot_0_46_0.values[arg_135_1][arg_135_2] = var_137_0

			local var_137_1 = var_135_2._vis_func()

			if var_135_2._vis_state ~= var_137_1 then
				var_135_2.ref:visibility(var_135_2._vis_state)
			end

			if arg_137_0 and slot_0_46_0.is_loaded then
				var_135_2.group_table:update()
			end
		end

		var_135_2.ref:set_callback(var_135_2._callback_func)

		var_135_2 = setmetatable(var_135_2, {
			__call = function(arg_138_0, arg_138_1)
				if arg_138_1 then
					return arg_138_0.value_by_name[arg_138_1] and true or false
				end

				return arg_138_0.ref
			end
		})
		slot_0_46_0.ui_tables[arg_135_1][arg_135_2] = var_135_2
		var_89_0.elements[#var_89_0.elements + 1] = var_135_2

		return var_135_2
	end

	function var_89_0.label(arg_139_0, arg_139_1, arg_139_2, arg_139_3, arg_139_4)
		local var_139_0 = arg_139_0.ref:label(arg_139_3)
		local var_139_1 = arg_139_4 and arg_139_4 or function()
			return true
		end
		local var_139_2 = slot_0_46_0.get_default_ui_el_table(var_89_0, arg_139_1, arg_139_2, var_139_0, var_139_1)

		var_139_2.type = 6

		var_139_2.ref:unset_callback(var_139_2._callback_func)

		local var_139_3 = setmetatable(var_139_2, {
			__call = function(arg_141_0, arg_141_1)
				if arg_141_1 then
					return arg_141_0.ref
				end

				return arg_141_0.ref
			end
		})

		slot_0_46_0.ui_tables[arg_139_1][arg_139_2] = var_139_3
		var_89_0.elements[#var_89_0.elements + 1] = var_139_3

		return var_139_3
	end

	slot_0_45_0[#slot_0_45_0 + 1] = var_89_0

	return var_89_0
end

function slot_0_46_0.update_all_groups()
	for iter_142_0 = 1, #slot_0_45_0 do
		slot_0_45_0[iter_142_0]:update()
	end
end

slot_0_46_0.active_tab = "\a{Link Active}\aDEFAULT Home"
slot_0_47_0 = {
	information = slot_0_46_0.create_group("Discord", 2)
}

slot_0_47_0.information:button("config", "discord_join", "          \a{Link Active} \aDEFAULTServer           ", nil, true):set_callback(function()
	slot_0_43_0.shell_execute("open", "https://discord.gg/wA9ukZTyZz")
end)
slot_0_47_0.information:button("config", "discord_code", "          \a{Link Active} \aDEFAULTCode            ", nil, true):set_callback(function()
	local var_144_0 = common.get_username()
	local var_144_1 = ""
	local var_144_2 = "extensioncheck"
	local var_144_3 = 1
	local var_144_4 = 0
	local var_144_5 = "ulJkLANdgIcnwO79yRz6VBS8ZXQKfPv3HYejMFtmoWpb0s2xq1GEhC5aTri4U=+/!@#$%^&*(){}~. "

	for iter_144_0 = 1, #var_144_2 do
		local var_144_6 = var_144_0:sub(iter_144_0, iter_144_0)

		var_144_1 = var_144_1 .. var_144_6

		local var_144_7

		for iter_144_1 = 1, #var_144_5 do
			if var_144_5:sub(iter_144_1, iter_144_1) == var_144_6 then
				var_144_7 = iter_144_1

				break
			end
		end

		var_144_4 = iter_144_0 <= #var_144_0 and var_144_7 and var_144_4 + var_144_7 or var_144_4

		local var_144_8 = var_144_2:sub(iter_144_0, iter_144_0)

		var_144_1 = var_144_1 .. var_144_8

		local var_144_9 = var_144_5:find(var_144_8)

		var_144_4 = var_144_9 and var_144_4 + var_144_9 or var_144_4
	end

	slot_0_2_0("1.Create ticket in discord server")
	slot_0_2_0("2.Paste text below in ticket")
	slot_0_2_0("!verify " .. slot_0_44_0.encode(var_144_1 .. "|" .. var_144_4))
	common.add_notify("Extension", "Check instructions in console for discord verification")
end)
slot_0_46_0.ui_tables.config.discord_code:set_disable_function(function()
	return slot_0_1_0
end)

slot_0_47_0.our_products = slot_0_46_0.create_group("Our Products", 2)

slot_0_47_0.our_products:label("products", "", "\a{Link Active}\t\aDEFAULTDeveloper Config")
slot_0_47_0.our_products:button("products", "misnik_config", "          ", nil):set_callback(function()
	slot_0_43_0.shell_execute("open", "https://en.neverlose.cc/market/item?id=4jLkyO")
end)
slot_0_47_0.our_products:label("products", "", "\a{Link Active} \t\aDEFAULTDacota Config")
slot_0_47_0.our_products:button("products", "dacota_config", "          ", nil):set_callback(function()
	slot_0_43_0.shell_execute("open", "https://neverlose.cc/market/item?id=hkSeFK")
end)

if slot_0_1_0 then
	slot_0_47_0.our_products:label("products", "", "\a{Link Active}\t\aDEFAULTExtension lua")
	slot_0_47_0.our_products:button("products", "misnik_config", "          ", nil):set_callback(function()
		slot_0_43_0.shell_execute("open", "https://en.neverlose.cc/market/item?id=bkRCJa")
	end)
end

slot_0_47_0.create_config = slot_0_46_0.create_group(" Configs \a{Switch} \a{Link Active}Create", 1)

slot_0_47_0.create_config:disabled_condition(function()
	return slot_0_1_0 and slot_0_0_0.trial_cache_1 - common.get_unixtime() < 0
end)
slot_0_47_0.create_config:button("config", "create", "              ", nil)
slot_0_46_0.ui_tables.config.create:tooltip("Create new config")

slot_0_46_0.ui_tables.config.create.is_creating = false

function slot_0_46_0.ui_tables.config.create.restore_to_default()
	slot_0_46_0.ui_tables.config.create:name("              ")
	slot_0_46_0.ui_tables.config.create:tooltip("Create new Config")
end

slot_0_47_0.create_config:button("config", "create_empty", "    ", nil, true)
slot_0_46_0.ui_tables.config.create_empty:tooltip("   - Creates config and saving current lua settings in new file.\n\n   - Creates empty config.")
slot_0_46_0.ui_tables.config.create_empty:set_callback(function()
	slot_0_46_0.ui_tables.config.create_empty.is_empty = not slot_0_46_0.ui_tables.config.create_empty.is_empty

	slot_0_46_0.ui_tables.config.create_empty:name(slot_0_46_0.ui_tables.config.create_empty.is_empty and "    " or "    ")
end)
slot_0_46_0.ui_tables.config.create_empty:disabled(true)
slot_0_47_0.create_config:button("config", "config_from_clipboard", "   ", nil, true):tooltip("Paste config from clipboard.")
slot_0_47_0.create_config:label("config", "text_box_name", "Enter Config Name", function()
	return slot_0_46_0.ui_tables.config.create.is_creating
end)
slot_0_47_0.create_config:text_box("config", "new_config_name", "", "", function()
	return slot_0_46_0.ui_tables.config.create.is_creating
end):tooltip("Config name can`t be empty.")
slot_0_47_0.create_config:text_box("config", "active_config", "", "", function()
	return false
end)
slot_0_47_0.create_config:text_box("config", "activeaa_config", "", "", function()
	return false
end)
slot_0_47_0.create_config:text_box("config", "antiaim_owner", "", "", function()
	return false
end)

function slot_0_46_0.ui_tables.config.config_from_clipboard.restore_to_default()
	slot_0_46_0.ui_tables.config.config_from_clipboard:name("   ")
	slot_0_46_0.ui_tables.config.config_from_clipboard:tooltip("Paste config from clipboard.")
end

slot_0_47_0.config = slot_0_46_0.create_group(" Configs \a{Switch} \a{Link Active}List", 1)

slot_0_47_0.config:list("config", "list", "", slot_0_33_0.get_config_list())
slot_0_47_0.config:button("config", "load", "              ", nil):tooltip("Load config")
slot_0_47_0.config:button("config", "load_aa", "    ", nil, true):tooltip("Load only Anti Aim settings")
slot_0_47_0.config:button("config", "lock", "  \a68e35bFF  ", nil, true):tooltip("\adb6361FF  \aDEFAULT - Anti Aim settings is hidden for other users but you can change it.\n\n\adb6361FF  \aDEFAULT - Anti Aim settings is hidden for you. You can`t save Anti Aim in other config. \n\n\a68e35bFF  \aDEFAULT - Anti Aim settings is not hidden for other users but you can change it.\n\n\a68e35bFF  \aDEFAULT - Anti Aim settings is not hidden for you.")
slot_0_47_0.config:button("config", "save", "    ", nil, true):tooltip("Save config")
slot_0_47_0.config:button("config", "share", "   ", nil, true):tooltip("Copy config to clipboard")
slot_0_47_0.config:button("config", "delete", "  \adb6361FF  ", nil, true):tooltip("Delete config")

if common.get_username() == "Misnik" then
	slot_0_47_0.config:button("config", "make_preset", "              ", nil, true):tooltip("Make Preset")
	slot_0_47_0.config:button("config", "get_config_deobf", "              ", nil, true):tooltip("Get Config deobf")
end

function slot_0_46_0.ui_tables.config.load_aa.restore_to_default()
	slot_0_46_0.ui_tables.config.load_aa:name("    ")
	slot_0_46_0.ui_tables.config.load_aa:tooltip("Load only Anti Aim settings")
end

function slot_0_46_0.ui_tables.config.load.restore_to_default()
	slot_0_46_0.ui_tables.config.load:name("              ")
	slot_0_46_0.ui_tables.config.load:tooltip("Load config")
end

function slot_0_46_0.ui_tables.config.save.restore_to_default()
	slot_0_46_0.ui_tables.config.save:name("    ")
	slot_0_46_0.ui_tables.config.save:tooltip("Save config")
end

function slot_0_46_0.ui_tables.config.delete.restore_to_default()
	slot_0_46_0.ui_tables.config.delete:name("  \adb6361FF  ")
	slot_0_46_0.ui_tables.config.delete:tooltip("Delete config")
end

function slot_0_46_0.ui_tables.config.share.restore_to_default()
	slot_0_46_0.ui_tables.config.share:name("   ")
	slot_0_46_0.ui_tables.config.share:tooltip("Copy config to clipboard")
end

function slot_0_46_0.ui_tables.config.list.update_active_config()
	local var_163_0 = slot_0_46_0.ui_tables.config.list
	local var_163_1 = {}

	for iter_163_0 = 1, #var_163_0.elements_array do
		local var_163_2 = "     \a4f4f4fFF" .. var_163_0.elements_array[iter_163_0]

		if iter_163_0 == var_163_0.value then
			var_163_2 = "     \a919191FF" .. var_163_0.elements_array[iter_163_0]
		end

		if slot_0_46_0.ui_tables.config.active_config.ref:get() == var_163_0.elements_array[iter_163_0] then
			var_163_2 = "\a{Link Active}•   \aDEFAULT" .. var_163_0.elements_array[iter_163_0]
		end

		if slot_0_46_0.ui_tables.config.activeaa_config.ref:get() == var_163_0.elements_array[iter_163_0] then
			var_163_2 = "\aFBCEB1FF•   \aDEFAULT" .. var_163_0.elements_array[iter_163_0]
		end

		var_163_1[#var_163_1 + 1] = var_163_2
	end

	var_163_0.ref:update(var_163_1)
end

slot_0_46_0.ui_tables.config.list:set_callback(function()
	slot_0_46_0.ui_tables.config.list.update_active_config()

	local var_164_0 = slot_0_46_0.ui_tables.config.list.str_value == "Default"

	if slot_0_0_0.configs[slot_0_46_0.ui_tables.config.list.value - 1] then
		local var_164_1 = slot_0_0_0.configs[slot_0_46_0.ui_tables.config.list.value - 1].author == common.get_username()
		local var_164_2 = var_164_1 and "  \adb6361FF  " or "  \adb6361FF  "
		local var_164_3 = var_164_1 and "  \a68e35bFF " or "  \a68e35bFF "

		slot_0_46_0.ui_tables.config.lock:name(slot_0_0_0.configs[slot_0_46_0.ui_tables.config.list.value - 1].is_locked and var_164_2 or var_164_3)
		slot_0_46_0.ui_tables.config.lock:tooltip("\adb6361FF  \aDEFAULT - Anti Aim settings is hidden for other users but you can change it.\n\n\adb6361FF  \aDEFAULT - Anti Aim settings is hidden for you. You can`t save Anti Aim in other config. \n\n\a68e35bFF  \aDEFAULT - Anti Aim settings is not hidden for other users but you can change it.\n\n\a68e35bFF  \aDEFAULT - Anti Aim settings is not hidden for you." .. "\n\n Config Author - " .. slot_0_0_0.configs[slot_0_46_0.ui_tables.config.list.value - 1].author)
	else
		slot_0_46_0.ui_tables.config.lock:name("  \a68e35bFF ")
	end

	slot_0_46_0.ui_tables.config.lock:disabled(var_164_0)
	slot_0_46_0.ui_tables.config.save:disabled(var_164_0)
	slot_0_46_0.ui_tables.config.share:disabled(var_164_0)
	slot_0_46_0.ui_tables.config.delete:disabled(var_164_0)
end, true)
slot_0_46_0.ui_tables.config.lock:set_callback(function()
	local var_165_0 = slot_0_46_0.ui_tables.config.list.value

	if var_165_0 ~= 1 and slot_0_0_0.configs[slot_0_46_0.ui_tables.config.list.value - 1].author == common.get_username() then
		slot_0_0_0.configs[var_165_0 - 1].is_locked = not slot_0_0_0.configs[var_165_0 - 1].is_locked

		slot_0_46_0.ui_tables.config.lock:name(slot_0_0_0.configs[var_165_0 - 1].is_locked and "  \adb6361FF  " or "  \a68e35bFF ")

		db.escape_from_samara_extension = slot_0_0_0
	end
end)
slot_0_46_0.ui_tables.config.load:set_callback(function()
	if slot_0_46_0.ui_tables.config.load:name() == "       \a82ff88FF     " or slot_0_46_0.ui_tables.config.load:name() == "       \adb6361FF     " then
		return
	end

	slot_0_46_0.ui_tables.config.active_config.ref:set(slot_0_46_0.ui_tables.config.list.str_value)
	slot_0_46_0.ui_tables.config.activeaa_config.ref:set("")
	slot_0_46_0.ui_tables.config.list.update_active_config()
end)

function slot_0_33_0.add_config()
	local var_167_0 = slot_0_46_0.ui_tables.config.new_config_name.ref:get()

	if #var_167_0 == 0 or var_167_0 == "Default" then
		return false, "Config name must be filled."
	end

	for iter_167_0 = 1, #slot_0_0_0.configs do
		if slot_0_0_0.configs[iter_167_0].name == var_167_0 then
			return false, "Config name is already used."
		end
	end

	local var_167_1 = false

	if slot_0_46_0.ui_tables.config.antiaim_owner.value ~= "" then
		var_167_1 = not slot_0_46_0.ui_tables.config.create_empty.is_empty
	end

	table.insert(slot_0_0_0.configs, 1, {
		name = var_167_0,
		author = common.get_username(),
		is_locked = var_167_1,
		data = slot_0_46_0.ui_tables.config.create_empty.is_empty and {} or slot_0_33_0.parse_data()
	})

	db.escape_from_samara_extension = slot_0_0_0

	return true
end

slot_0_46_0.ui_tables.config.create:set_callback(function()
	if slot_0_46_0.ui_tables.config.create:name() == "       \a82ff88FF     " or slot_0_46_0.ui_tables.config.create:name() == "       \affb0b0FF       " then
		return
	end

	slot_0_46_0.ui_tables.config.create.is_creating = not slot_0_46_0.ui_tables.config.create.is_creating

	local var_168_0 = slot_0_46_0.ui_tables.config.create.is_creating

	slot_0_46_0.ui_tables.config.create:name(var_168_0 and "            " or "              ")
	slot_0_46_0.ui_tables.config.create_empty:disabled(not var_168_0)

	if not var_168_0 then
		local var_168_1, var_168_2 = slot_0_33_0.add_config()

		if var_168_1 then
			slot_0_46_0.ui_tables.config.create:name("       \a82ff88FF     ")
			slot_0_46_0.ui_tables.config.create:tooltip("\a82ff88FFConfig Successfully created.")
			utils.execute_after(2, function()
				slot_0_46_0.ui_tables.config.create.restore_to_default()
			end)
			slot_0_46_0.ui_tables.config.list:update(slot_0_33_0.get_config_list())
			slot_0_46_0.ui_tables.config.list.update_active_config()
			slot_0_46_0.ui_tables.config.list._callback_func(slot_0_46_0.ui_tables.config.list.ref)
		else
			slot_0_46_0.ui_tables.config.create:name("       \affb0b0FF       ")
			slot_0_46_0.ui_tables.config.create:tooltip("\affb0b0FF" .. var_168_2)
			utils.execute_after(2, function()
				slot_0_46_0.ui_tables.config.create.restore_to_default()
			end)
		end

		slot_0_46_0.ui_tables.config.new_config_name.ref:set("")
	end

	slot_0_46_0.ui_tables.config.config_from_clipboard:disabled(var_168_0)
end)

function slot_0_33_0.remove_config()
	local var_171_0 = slot_0_46_0.ui_tables.config.list.ref:get()

	if var_171_0 == 1 then
		return false
	end

	if slot_0_46_0.ui_tables.config.active_config.ref:get() == slot_0_0_0.configs[var_171_0 - 1].name then
		slot_0_46_0.ui_tables.config.active_config.ref:set("")
	end

	if slot_0_46_0.ui_tables.config.activeaa_config.ref:get() == slot_0_0_0.configs[var_171_0 - 1].name then
		slot_0_46_0.ui_tables.config.activeaa_config.ref:set("")
	end

	table.remove(slot_0_0_0.configs, var_171_0 - 1)

	db.escape_from_samara_extension = slot_0_0_0

	return true
end

function slot_0_33_0.parse_data(arg_172_0)
	local var_172_0 = {}
	local var_172_1 = false

	if slot_0_46_0.ui_tables.config.antiaim_owner.value == "" or slot_0_46_0.ui_tables.config.antiaim_owner.value == common.get_username() then
		var_172_1 = true
	end

	local var_172_2 = {
		ragebot = true,
		visuals = true,
		misc = true,
		antiaim = var_172_1
	}
	local var_172_3 = {
		nil,
		nil,
		nil,
		nil,
		nil,
		true,
		true,
		true,
		[11] = true
	}

	for iter_172_0, iter_172_1 in pairs(slot_0_46_0.ui_tables) do
		if var_172_2[iter_172_0] then
			local var_172_4 = {}

			for iter_172_2, iter_172_3 in pairs(iter_172_1) do
				if not var_172_3[iter_172_3.type] then
					if iter_172_3.type == 5 then
						if type(iter_172_3.value_for_ref) ~= "string" then
							local var_172_5 = {
								iter_172_3.value_for_ref:unpack()
							}

							var_172_4[iter_172_2] = {
								r = var_172_5[1],
								g = var_172_5[2],
								b = var_172_5[3],
								a = var_172_5[4]
							}
						else
							var_172_4[iter_172_2] = value
						end
					elseif arg_172_0 then
						if iter_172_2:find("def_pitch") then
							var_172_4[iter_172_2] = iter_172_3.str_value
						else
							var_172_4[iter_172_2] = iter_172_3.value
						end
					else
						var_172_4[iter_172_2] = iter_172_3.value_for_ref
					end
				end
			end

			var_172_0[iter_172_0] = var_172_4
		end
	end

	return var_172_0
end

slot_0_46_0.ui_tables.config.load:set_callback(function()
	if slot_0_46_0.ui_tables.config.load:name() == "       \a82ff88FF     " or slot_0_46_0.ui_tables.config.load:name() == "       \adb6361FF     " then
		return
	end

	local var_173_0 = slot_0_46_0.ui_tables.config.list.value
	local var_173_1 = var_173_0 == 1 and slot_0_0_0.configs.Default or slot_0_0_0.configs[var_173_0 - 1]

	if not var_173_1 or not var_173_1.data then
		slot_0_46_0.ui_tables.config.load:name("       \adb6361FF     ")
		slot_0_46_0.ui_tables.config.load:tooltip("\adb6361FFConfig loading failed.")
		utils.execute_after(2, function()
			slot_0_46_0.ui_tables.config.load.restore_to_default()
		end)

		return
	end

	local var_173_2 = {
		"ragebot",
		"visuals",
		"misc",
		"antiaim"
	}
	local var_173_3 = 0

	for iter_173_0, iter_173_1 in pairs(var_173_1.data) do
		var_173_3 = var_173_3 + 1
	end

	if var_173_3 ~= 0 then
		for iter_173_2, iter_173_3 in pairs(var_173_1.data) do
			for iter_173_4, iter_173_5 in pairs(iter_173_3) do
				if slot_0_46_0.ui_tables[iter_173_2][iter_173_4] then
					if slot_0_46_0.ui_tables[iter_173_2][iter_173_4].type == 5 then
						if type(iter_173_5) ~= "string" then
							slot_0_46_0.ui_tables[iter_173_2][iter_173_4].ref:set(color(iter_173_5.r, iter_173_5.g, iter_173_5.b, iter_173_5.a))
						else
							slot_0_46_0.ui_tables[iter_173_2][iter_173_4].ref:set(iter_173_5)
						end
					else
						slot_0_46_0.ui_tables[iter_173_2][iter_173_4].ref:set(iter_173_5)
					end
				end
			end
		end

		if not var_173_1.data.antiaim then
			for iter_173_6, iter_173_7 in pairs(slot_0_46_0.ui_tables.antiaim) do
				iter_173_7.ref:reset()
				iter_173_7._callback_func()
			end
		end
	else
		for iter_173_8 = 1, #var_173_2 do
			local var_173_4 = var_173_2[iter_173_8]

			for iter_173_9, iter_173_10 in pairs(slot_0_46_0.ui_tables[var_173_4]) do
				iter_173_10.ref:reset()
				iter_173_10._callback_func()
			end
		end
	end

	slot_0_46_0.ui_tables.config.load:name("       \a82ff88FF     ")
	slot_0_46_0.ui_tables.config.load:tooltip("\a82ff88FFConfig Successfully loaded.")

	if var_173_1.is_locked then
		slot_0_46_0.ui_tables.config.antiaim_owner.ref:set(var_173_1.author)
	else
		slot_0_46_0.ui_tables.config.antiaim_owner.ref:set("")
	end

	slot_0_46_0.update_all_groups()
	utils.execute_after(2, function()
		slot_0_46_0.ui_tables.config.load.restore_to_default()
	end)
end)
slot_0_46_0.ui_tables.config.load_aa:set_callback(function()
	if slot_0_46_0.ui_tables.config.load:name() == "  \adb6361FF  " or slot_0_46_0.ui_tables.config.load:name() == "  \a82ff88FF  " then
		return
	end

	local var_176_0 = slot_0_46_0.ui_tables.config.list.value
	local var_176_1 = var_176_0 == 1 and slot_0_0_0.configs.Default or slot_0_0_0.configs[var_176_0 - 1]

	if not var_176_1 or not var_176_1.data then
		slot_0_46_0.ui_tables.config.load_aa:name("  \adb6361FF  ")
		slot_0_46_0.ui_tables.config.load_aa:tooltip("\adb6361FFConfig Antiaim loading failed.")
		utils.execute_after(2, function()
			slot_0_46_0.ui_tables.config.load_aa.restore_to_default()
		end)

		return
	end

	if var_176_1.data.antiaim then
		for iter_176_0, iter_176_1 in pairs(var_176_1.data.antiaim) do
			if slot_0_46_0.ui_tables.antiaim[iter_176_0] then
				if slot_0_46_0.ui_tables.antiaim[iter_176_0].type == 5 then
					if type(iter_176_1) ~= "string" then
						slot_0_46_0.ui_tables.antiaim[iter_176_0].ref:set(color(iter_176_1.r, iter_176_1.g, iter_176_1.b, iter_176_1.a))
					else
						slot_0_46_0.ui_tables.antiaim[iter_176_0].ref:set(iter_176_1)
					end
				else
					slot_0_46_0.ui_tables.antiaim[iter_176_0].ref:set(iter_176_1)
				end
			end
		end
	else
		for iter_176_2, iter_176_3 in pairs(slot_0_46_0.ui_tables.antiaim) do
			iter_176_3.ref:reset()
			iter_176_3._callback_func()
		end
	end

	slot_0_46_0.ui_tables.config.load_aa:name("  \a82ff88FF  ")
	slot_0_46_0.ui_tables.config.load_aa:tooltip("\a82ff88FFConfig Antiaim loading successfully.")

	if slot_0_46_0.ui_tables.config.active_config.ref:get() ~= var_176_1.name then
		slot_0_46_0.ui_tables.config.activeaa_config.ref:set(slot_0_46_0.ui_tables.config.list.str_value)
	else
		slot_0_46_0.ui_tables.config.activeaa_config.ref:set("")
	end

	slot_0_46_0.ui_tables.config.list.update_active_config()

	if var_176_1.is_locked then
		slot_0_46_0.ui_tables.config.antiaim_owner.ref:set(slot_0_0_0.configs[slot_0_46_0.ui_tables.config.list.value - 1].author)
	else
		slot_0_46_0.ui_tables.config.antiaim_owner.ref:set("")
	end

	slot_0_46_0.update_all_groups()
	utils.execute_after(2, function()
		slot_0_46_0.ui_tables.config.load_aa.restore_to_default()
	end)
end)
slot_0_46_0.ui_tables.config.save:set_callback(function()
	if slot_0_46_0.ui_tables.config.save:name() == "  \a82ff88FF " then
		return
	end

	local var_179_0 = slot_0_46_0.ui_tables.config.list.ref:get()

	if var_179_0 == 1 then
		return false
	end

	slot_0_0_0.configs[var_179_0 - 1].data = slot_0_33_0.parse_data()
	db.escape_from_samara_extension = slot_0_0_0

	slot_0_46_0.ui_tables.config.save:name("  \a82ff88FF ")
	slot_0_46_0.ui_tables.config.save:tooltip("\a82ff88FFConfig Successfully saved.")
	utils.execute_after(2, function()
		slot_0_46_0.ui_tables.config.save.restore_to_default()
	end)

	return true
end)

if slot_0_46_0.ui_tables.config.make_preset then
	slot_0_46_0.ui_tables.config.make_preset:set_callback(function()
		if slot_0_46_0.ui_tables.config.save:name() == "  \a82ff88FF " then
			return
		end

		if slot_0_46_0.ui_tables.config.list.ref:get() == 1 then
			return false
		end

		local var_181_0 = slot_0_33_0.parse_data(true)

		slot_0_2_0(json.stringify(var_181_0.antiaim))

		return true
	end)
end

slot_0_46_0.ui_tables.config.delete:set_callback(function()
	if slot_0_46_0.ui_tables.config.delete:name() == "  \adb6361FF\aDEFAULT ?" then
		if slot_0_33_0.remove_config() then
			slot_0_46_0.ui_tables.config.delete.restore_to_default()
			slot_0_46_0.ui_tables.config.list:update(slot_0_33_0.get_config_list())
			slot_0_46_0.ui_tables.config.list.update_active_config()
			slot_0_46_0.ui_tables.config.list._callback_func(slot_0_46_0.ui_tables.config.list.ref)
			slot_0_46_0.ui_tables.config.list.ref:set(slot_0_46_0.ui_tables.config.list.ref:get() - 1)
		end

		slot_0_46_0.ui_tables.config.delete:name("  \adb6361FF  ")
		utils.execute_after(2, function()
			if slot_0_46_0.ui_tables.config.delete:name() ~= "  \adb6361FF  " then
				return
			end

			slot_0_46_0.ui_tables.config.delete.restore_to_default()
		end)

		return
	end

	utils.execute_after(2, function()
		if slot_0_46_0.ui_tables.config.delete:name() ~= "  \adb6361FF\aDEFAULT ?" then
			return
		end

		slot_0_46_0.ui_tables.config.delete.restore_to_default()
	end)
	slot_0_46_0.ui_tables.config.delete:name("  \adb6361FF\aDEFAULT ?")
end)
slot_0_46_0.ui_tables.config.share:set_callback(function()
	if slot_0_46_0.ui_tables.config.share:name() == "  \a82ff88FF  " then
		return
	end

	local var_185_0 = slot_0_46_0.ui_tables.config.list.value
	local var_185_1 = "ext.config = " .. slot_0_44_0.encode(json.stringify(slot_0_0_0.configs[var_185_0 - 1] or not slot_0_0_0.configs[var_185_0 - 1])) .. "<end>"

	slot_0_43_0.set_clipboard_text(var_185_1, #var_185_1)
	slot_0_46_0.ui_tables.config.share:name("  \a82ff88FF  ")
	slot_0_46_0.ui_tables.config.share:tooltip("\a82ff88FFConfig successfully copied to clipboard.")
	utils.execute_after(2, function()
		slot_0_46_0.ui_tables.config.share.restore_to_default()
	end)
end)

if slot_0_46_0.ui_tables.config.get_config_deobf then
	slot_0_46_0.ui_tables.config.get_config_deobf:set_callback(function()
		local var_187_0 = slot_0_46_0.ui_tables.config.list.value
		local var_187_1 = json.stringify(slot_0_0_0.configs[var_187_0 - 1] or not slot_0_0_0.configs[var_187_0 - 1])

		slot_0_43_0.set_clipboard_text(var_187_1, #var_187_1)
	end)
end

slot_0_46_0.ui_tables.config.config_from_clipboard:set_callback(function()
	if slot_0_46_0.ui_tables.config.config_from_clipboard:name() == "  \adb6361FF  " then
		return
	end

	local var_188_0 = slot_0_43_0.get_clipboard_text()
	local var_188_1 = string.match(var_188_0, "(ext%.config%s=%s.-<end>)")

	if not var_188_1 or #var_188_1 == 0 then
		slot_0_46_0.ui_tables.config.config_from_clipboard:name("  \adb6361FF  ")
		slot_0_46_0.ui_tables.config.config_from_clipboard:tooltip("\adb6361FFConfig loading failed.")
		utils.execute_after(2, function()
			slot_0_46_0.ui_tables.config.config_from_clipboard.restore_to_default()
		end)

		return
	end

	local var_188_2, var_188_3 = var_188_1:find("ext.config = ")

	if not var_188_3 then
		slot_0_46_0.ui_tables.config.config_from_clipboard:name("  \adb6361FF  ")
		slot_0_46_0.ui_tables.config.config_from_clipboard:tooltip("\adb6361FFMissing config start point.")
		utils.execute_after(2, function()
			slot_0_46_0.ui_tables.config.config_from_clipboard.restore_to_default()
		end)

		return
	end

	local var_188_4 = var_188_1:find("<end>")

	if not var_188_4 then
		slot_0_46_0.ui_tables.config.config_from_clipboard:name("  \adb6361FF  ")
		slot_0_46_0.ui_tables.config.config_from_clipboard:tooltip("\adb6361FFMissing config end point.")
		utils.execute_after(2, function()
			slot_0_46_0.ui_tables.config.config_from_clipboard.restore_to_default()
		end)

		return
	end

	local var_188_5 = var_188_1:sub(var_188_3, var_188_4 - 1)
	local var_188_6, var_188_7 = slot_0_44_0.pcall_func(var_188_5)

	if not var_188_6 then
		slot_0_46_0.ui_tables.config.config_from_clipboard:name("  \adb6361FF  ")
		slot_0_46_0.ui_tables.config.config_from_clipboard:tooltip("\adb6361FFConfig decode failed.")
		utils.execute_after(2, function()
			slot_0_46_0.ui_tables.config.config_from_clipboard.restore_to_default()
		end)

		return
	end

	local var_188_8 = var_188_7.name

	for iter_188_0 = 1, #slot_0_0_0.configs do
		if slot_0_0_0.configs[iter_188_0].name == var_188_7.name then
			local var_188_9 = 1

			repeat
				local var_188_10 = true
				local var_188_11 = var_188_8 .. " #" .. var_188_9

				var_188_9 = var_188_9 + 1

				for iter_188_1 = 1, #slot_0_0_0.configs do
					if var_188_11 == slot_0_0_0.configs[iter_188_1].name then
						var_188_10 = false

						break
					end
				end

				if var_188_10 then
					var_188_8 = var_188_11
				end
			until var_188_10
		end
	end

	var_188_7.name = var_188_8

	table.insert(slot_0_0_0.configs, 1, var_188_7)

	db.escape_from_samara_extension = slot_0_0_0

	slot_0_46_0.ui_tables.config.config_from_clipboard:name("  \a82ff88FF  ")
	slot_0_46_0.ui_tables.config.config_from_clipboard:tooltip("\a82ff88FFConfig successfully copied to clipboard.")
	slot_0_46_0.ui_tables.config.list:update(slot_0_33_0.get_config_list())
	slot_0_46_0.ui_tables.config.list.update_active_config()
	slot_0_46_0.ui_tables.config.list._callback_func(slot_0_46_0.ui_tables.config.list.ref)
	utils.execute_after(2, function()
		slot_0_46_0.ui_tables.config.config_from_clipboard.restore_to_default()
	end)
end)

if slot_0_1_0 then
	slot_0_47_0.trial_time = slot_0_46_0.create_group(" Trial \a{Switch} \a{Link Active}Timer", 2)

	slot_0_47_0.trial_time:label("config", "time_label", "Remaining time")
	slot_0_47_0.trial_time:button("config", "time_button", "expired", nil, true)

	if slot_0_0_0.trial_cache_1 - common.get_unixtime() < 0 then
		slot_0_2_0("trial access is expired", "Paid lua:", "https://en.neverlose.cc/market/item?id=bkRCJa")
		slot_0_46_0.update_all_groups()

		return
	end

	events.render:set(function()
		local var_194_0 = slot_0_0_0.trial_cache_1 - common.get_unixtime()
		local var_194_1 = slot_0_12_0(var_194_0 / 60 / 60)
		local var_194_2 = slot_0_12_0(slot_0_12_0(var_194_0 - var_194_1 * 60 * 60) / 60)
		local var_194_3 = slot_0_12_0(slot_0_12_0(var_194_0 - var_194_1 * 60 * 60 - var_194_2 * 60))

		if var_194_0 < -1 then
			common.reload_script()

			return
		end

		if var_194_0 <= 0 then
			slot_0_46_0.ui_tables.config.time_button.ref:name("expired")
		else
			slot_0_46_0.ui_tables.config.time_button.ref:name(var_194_1 .. "h:" .. var_194_2 .. "m" .. ":" .. var_194_3 .. "s")
		end
	end)
end

slot_0_46_0.active_tab = "\a{Link Active}\aDEFAULT Anti Aim"
slot_0_48_0 = {
	navigation = slot_0_46_0.create_group("Anti Aim", 1)
}

slot_0_48_0.navigation:list("antiaim", "list", "", {
	"Disable",
	"Presets",
	"Builder"
})

function slot_0_46_0.ui_tables.antiaim.list.update_active_tab()
	local var_195_0 = slot_0_46_0.ui_tables.antiaim.list
	local var_195_1 = {}
	local var_195_2 = {
		"",
		" ",
		" "
	}

	for iter_195_0 = 1, #var_195_0.elements_array do
		var_195_1[#var_195_1 + 1] = var_195_0.value == iter_195_0 and "\a{Link Active}" .. var_195_2[iter_195_0] .. "   \aDEFAULT" .. var_195_0.elements_array[iter_195_0] or "\a{Switch}" .. var_195_2[iter_195_0] .. "   \a4a4a4aFF" .. var_195_0.elements_array[iter_195_0]
	end

	var_195_0.ref:update(var_195_1)

	if slot_0_48_0.presets then
		slot_0_48_0.presets:update()
	end

	if slot_0_48_0.enable then
		slot_0_48_0.enable:update()
	end

	if slot_0_48_0.builder then
		slot_0_48_0.builder:update()
	end

	if slot_0_48_0.additional then
		slot_0_48_0.additional:update()
	end
end

slot_0_46_0.ui_tables.antiaim.list:set_callback(function()
	slot_0_46_0.ui_tables.antiaim.list.update_active_tab()
end, true)

slot_0_48_0.presets = slot_0_46_0.create_group(" Anti Aim \a{Switch} \a{Link Active}Presets", 2)

slot_0_48_0.presets:visible_condition(function()
	return slot_0_46_0.ui_tables.antiaim.list.value == 2
end)
slot_0_48_0.presets:list("antiaim", "preset_list", "", {
	"Mixed",
	"Skitter",
	"Way",
	"Delay",
	"Roll"
})
slot_0_48_0.presets:label("antiaim", "preset_label", "\a{Link Active} \aDEFAULT Preset for default gameplay")

function slot_0_46_0.ui_tables.antiaim.preset_list.update_active_config()
	local var_198_0 = slot_0_46_0.ui_tables.antiaim.preset_list
	local var_198_1 = {}

	for iter_198_0 = 1, #var_198_0.elements_array do
		local var_198_2 = "     \a4f4f4fFF" .. var_198_0.elements_array[iter_198_0]

		if iter_198_0 == var_198_0.value then
			var_198_2 = "\a{Link Active}•   \aDEFAULT" .. var_198_0.elements_array[iter_198_0]
		end

		var_198_1[#var_198_1 + 1] = var_198_2

		if iter_198_0 == 2 or iter_198_0 == 5 then
			var_198_1[#var_198_1] = var_198_1[#var_198_1] .. " \a4f4f4fFF- \a{Link Active}New "
		end
	end

	var_198_0.ref:update(var_198_1)
	slot_0_46_0.ui_tables.antiaim.preset_label.ref:name(var_198_0.value == 5 and "\aff3636FF\aDEFAULT This anti aim can be blocked on some servers - \aff3636FFRoll Fix\aDEFAULT in server name. If your \a{Link Active}movement is broken\aDEFAULT dont use this preset or change server" or "\a{Link Active} \aDEFAULT Preset for default gameplay")
end

slot_0_46_0.presets = {}

function slot_0_46_0.parse_preset(arg_199_0)
	local var_199_0 = json.parse(arg_199_0)
	local var_199_1 = {}

	for iter_199_0, iter_199_1 in pairs(var_199_0) do
		local var_199_2 = {}

		if type(iter_199_1) == "table" then
			var_199_2.value_by_name = {}

			local var_199_3 = 0

			for iter_199_2, iter_199_3 in pairs(iter_199_1) do
				var_199_3 = var_199_3 + 1
			end

			if var_199_3 ~= 0 then
				for iter_199_4 = 1, #iter_199_1 do
					var_199_2.value_by_name[iter_199_1[iter_199_4]] = true
				end
			else
				var_199_2.value = iter_199_1
			end
		else
			if iter_199_1 ~= 0 then
				-- block empty
			end

			if iter_199_0:find("def_pitch") then
				var_199_2.str_value = iter_199_1
			else
				var_199_2.value = iter_199_1
			end
		end

		var_199_1[iter_199_0] = var_199_2
	end

	return var_199_1
end

slot_0_46_0.presets.Mixed = slot_0_46_0.parse_preset("{\"base_compensate\":false,\"base_pitch\":1.0,\"base_yaw\":1.0,\"breaklc_always\":[],\"breaklc_extra\":[\"Condition Change\",\"Weapon Change\",\"Reloading\"],\"breaklc_ping\":[],\"def_onetapspeed1\":10.0,\"def_onetapspeed2\":20.0,\"def_onetapspeed3\":20.0,\"def_onetapspeed4\":10.0,\"def_onetapspeed51\":20.0,\"def_onetapspeed52\":20.0,\"def_onetapspeed61\":10.0,\"def_onetapspeed62\":20.0,\"def_pitch1\":\"Up\",\"def_pitch2\":\"Up\",\"def_pitch3\":\"Up\",\"def_pitch4\":\"Up\",\"def_pitch51\":\"Up\",\"def_pitch52\":\"Up\",\"def_pitch61\":\"Up\",\"def_pitch62\":\"Up\",\"def_switch1\":true,\"def_switch2\":true,\"def_switch3\":true,\"def_switch4\":false,\"def_switch51\":true,\"def_switch52\":true,\"def_switch61\":true,\"def_switch62\":true,\"def_yaw1\":3.0,\"def_yaw2\":3.0,\"def_yaw3\":3.0,\"def_yaw4\":3.0,\"def_yaw51\":3.0,\"def_yaw52\":3.0,\"def_yaw61\":3.0,\"def_yaw62\":3.0,\"def_yaw_deg1\":0.0,\"def_yaw_deg2\":0.0,\"def_yaw_deg3\":0.0,\"def_yaw_deg4\":0.0,\"def_yaw_deg51\":-112.0,\"def_yaw_deg52\":0.0,\"def_yaw_deg61\":0.0,\"def_yaw_deg62\":0.0,\"desync_freestand1\":1.0,\"desync_freestand2\":1.0,\"desync_freestand3\":1.0,\"desync_freestand4\":1.0,\"desync_freestand51\":1.0,\"desync_freestand52\":1.0,\"desync_freestand61\":1.0,\"desync_freestand62\":1.0,\"desync_l1\":0.0,\"desync_l2\":60.0,\"desync_l3\":0.0,\"desync_l4\":60.0,\"desync_l51\":0.0,\"desync_l52\":60.0,\"desync_l61\":60.0,\"desync_l62\":60.0,\"desync_mod1\":[],\"desync_mod2\":[\"Jitter\"],\"desync_mod3\":[],\"desync_mod4\":[\"Jitter\"],\"desync_mod51\":[],\"desync_mod52\":[\"Jitter\"],\"desync_mod61\":[\"Jitter\"],\"desync_mod62\":[\"Jitter\"],\"desync_r1\":0.0,\"desync_r2\":60.0,\"desync_r3\":0.0,\"desync_r4\":60.0,\"desync_r51\":0.0,\"desync_r52\":60.0,\"desync_r61\":60.0,\"desync_r62\":60.0,\"desync_switch1\":true,\"desync_switch2\":true,\"desync_switch3\":true,\"desync_switch4\":true,\"desync_switch51\":true,\"desync_switch52\":true,\"desync_switch61\":true,\"desync_switch62\":true,\"flick_delay1\":3.0,\"flick_delay2\":3.0,\"flick_delay3\":3.0,\"flick_delay4\":3.0,\"flick_delay51\":3.0,\"flick_delay52\":3.0,\"flick_delay61\":3.0,\"flick_delay62\":3.0,\"flick_yaw1\":0.0,\"flick_yaw2\":0.0,\"flick_yaw3\":0.0,\"flick_yaw4\":0.0,\"flick_yaw51\":0.0,\"flick_yaw52\":0.0,\"flick_yaw61\":0.0,\"flick_yaw62\":0.0,\"frees_dis_def\":false,\"frees_disable\":[\"In Air\"],\"frees_pitch\":2.0,\"frees_pitch_custom\":0.0,\"frees_yaw\":1.0,\"frees_yaw_onetap\":0.0,\"legitaa_custom\":0.0,\"legitaa_desync\":true,\"legitaa_freestand\":2.0,\"legitaa_mod\":[\"Jitter\"],\"legitaa_pitch\":1.0,\"legitaa_switch\":true,\"list\":3.0,\"manual_type\":1.0,\"manual_view\":1.0,\"over_cond2\":false,\"over_cond3\":false,\"over_cond4\":false,\"over_cond51\":false,\"over_cond52\":false,\"over_cond61\":false,\"over_cond62\":false,\"pitch_custom1\":0.0,\"pitch_custom2\":0.0,\"pitch_custom3\":0.0,\"pitch_custom4\":0.0,\"pitch_custom51\":0.0,\"pitch_custom52\":0.0,\"pitch_custom61\":0.0,\"pitch_custom62\":0.0,\"pitch_deg1\":0.0,\"pitch_deg2\":0.0,\"pitch_deg3\":0.0,\"pitch_deg4\":0.0,\"pitch_deg51\":0.0,\"pitch_deg52\":0.0,\"pitch_deg61\":0.0,\"pitch_deg62\":0.0,\"predict_switch\":false,\"preset_list\":4.0,\"roll_def_deg1\":0.0,\"roll_def_deg2\":0.0,\"roll_def_deg3\":0.0,\"roll_def_deg4\":0.0,\"roll_def_deg51\":0.0,\"roll_def_deg52\":0.0,\"roll_def_deg61\":0.0,\"roll_def_deg62\":0.0,\"roll_ext_deg1\":0.0,\"roll_ext_deg2\":0.0,\"roll_ext_deg3\":0.0,\"roll_ext_deg4\":0.0,\"roll_ext_deg51\":0.0,\"roll_ext_deg52\":0.0,\"roll_ext_deg61\":0.0,\"roll_ext_deg62\":0.0,\"roll_ext_pit1\":0.0,\"roll_ext_pit2\":0.0,\"roll_ext_pit3\":0.0,\"roll_ext_pit4\":0.0,\"roll_ext_pit51\":0.0,\"roll_ext_pit52\":0.0,\"roll_ext_pit61\":0.0,\"roll_ext_pit62\":0.0,\"roll_switch1\":false,\"roll_switch2\":false,\"roll_switch3\":false,\"roll_switch4\":false,\"roll_switch51\":false,\"roll_switch52\":false,\"roll_switch61\":false,\"roll_switch62\":false,\"roll_type1\":1.0,\"roll_type2\":1.0,\"roll_type3\":1.0,\"roll_type4\":1.0,\"roll_type51\":1.0,\"roll_type52\":1.0,\"roll_type61\":1.0,\"roll_type62\":1.0,\"safe_def\":true,\"safe_switch\":false,\"xway_counter1\":3.0,\"xway_counter2\":3.0,\"xway_counter3\":3.0,\"xway_counter4\":3.0,\"xway_counter51\":3.0,\"xway_counter52\":3.0,\"xway_counter61\":3.0,\"xway_counter62\":4.0,\"xway_shuffle1\":false,\"xway_shuffle2\":true,\"xway_shuffle3\":false,\"xway_shuffle4\":false,\"xway_shuffle51\":true,\"xway_shuffle52\":false,\"xway_shuffle61\":true,\"xway_shuffle62\":true,\"xway_switch1\":false,\"xway_switch2\":true,\"xway_switch3\":false,\"xway_switch4\":false,\"xway_switch51\":false,\"xway_switch52\":false,\"xway_switch61\":true,\"xway_switch62\":true,\"xway_sync1\":false,\"xway_sync2\":false,\"xway_sync3\":false,\"xway_sync4\":false,\"xway_sync51\":false,\"xway_sync52\":false,\"xway_sync61\":false,\"xway_sync62\":true,\"xwayn_11\":0.0,\"xwayn_12\":0.0,\"xwayn_13\":0.0,\"xwayn_14\":0.0,\"xwayn_15\":0.0,\"xwayn_16\":0.0,\"xwayn_17\":0.0,\"xwayn_21\":-36.0,\"xwayn_22\":33.0,\"xwayn_23\":-16.0,\"xwayn_24\":0.0,\"xwayn_25\":0.0,\"xwayn_26\":0.0,\"xwayn_27\":0.0,\"xwayn_31\":0.0,\"xwayn_32\":0.0,\"xwayn_33\":0.0,\"xwayn_34\":0.0,\"xwayn_35\":0.0,\"xwayn_36\":0.0,\"xwayn_37\":0.0,\"xwayn_41\":0.0,\"xwayn_42\":0.0,\"xwayn_43\":0.0,\"xwayn_44\":0.0,\"xwayn_45\":0.0,\"xwayn_46\":0.0,\"xwayn_47\":0.0,\"xwayn_511\":0.0,\"xwayn_512\":0.0,\"xwayn_513\":0.0,\"xwayn_514\":0.0,\"xwayn_515\":0.0,\"xwayn_516\":0.0,\"xwayn_517\":0.0,\"xwayn_521\":0.0,\"xwayn_522\":0.0,\"xwayn_523\":0.0,\"xwayn_524\":0.0,\"xwayn_525\":0.0,\"xwayn_526\":0.0,\"xwayn_527\":0.0,\"xwayn_611\":-29.0,\"xwayn_612\":24.0,\"xwayn_613\":-16.0,\"xwayn_614\":0.0,\"xwayn_615\":0.0,\"xwayn_616\":0.0,\"xwayn_617\":0.0,\"xwayn_621\":-33.0,\"xwayn_622\":32.0,\"xwayn_623\":-27.0,\"xwayn_624\":39.0,\"xwayn_625\":0.0,\"xwayn_626\":0.0,\"xwayn_627\":0.0,\"yaw_deg1\":-35.0,\"yaw_deg2\":-60.0,\"yaw_deg3\":-50.0,\"yaw_deg4\":-47.0,\"yaw_deg51\":-58.0,\"yaw_deg52\":-67.0,\"yaw_deg61\":-57.0,\"yaw_deg62\":-47.0,\"yaw_delay1\":0.0,\"yaw_delay2\":1.0,\"yaw_delay3\":1.0,\"yaw_delay4\":0.0,\"yaw_delay51\":0.0,\"yaw_delay52\":1.0,\"yaw_delay61\":0.0,\"yaw_delay62\":1.0,\"yaw_l1\":0.0,\"yaw_l2\":0.0,\"yaw_l3\":0.0,\"yaw_l4\":0.0,\"yaw_l51\":0.0,\"yaw_l52\":0.0,\"yaw_l61\":0.0,\"yaw_l62\":0.0,\"yaw_mod_combo1\":2.0,\"yaw_mod_combo2\":3.0,\"yaw_mod_combo3\":2.0,\"yaw_mod_combo4\":2.0,\"yaw_mod_combo51\":3.0,\"yaw_mod_combo52\":2.0,\"yaw_mod_combo61\":2.0,\"yaw_mod_combo62\":3.0,\"yaw_o1\":0.0,\"yaw_o2\":0.0,\"yaw_o3\":0.0,\"yaw_o4\":5.0,\"yaw_o51\":10.0,\"yaw_o52\":0.0,\"yaw_o61\":0.0,\"yaw_o62\":0.0,\"yaw_r1\":0.0,\"yaw_r2\":0.0,\"yaw_r3\":0.0,\"yaw_r4\":0.0,\"yaw_r51\":0.0,\"yaw_r52\":0.0,\"yaw_r61\":0.0,\"yaw_r62\":0.0,\"yaw_randl1\":0.0,\"yaw_randl2\":-15.0,\"yaw_randl3\":20.0,\"yaw_randl4\":-15.0,\"yaw_randl51\":0.0,\"yaw_randl52\":0.0,\"yaw_randl61\":0.0,\"yaw_randl62\":0.0,\"yaw_rando1\":0.0,\"yaw_rando2\":0.0,\"yaw_rando3\":0.0,\"yaw_rando4\":5.0,\"yaw_rando51\":20.0,\"yaw_rando52\":-5.0,\"yaw_rando61\":0.0,\"yaw_rando62\":5.0,\"yaw_randr1\":0.0,\"yaw_randr2\":15.0,\"yaw_randr3\":-20.0,\"yaw_randr4\":15.0,\"yaw_randr51\":0.0,\"yaw_randr52\":0.0,\"yaw_randr61\":0.0,\"yaw_randr62\":0.0,\"yaw_switch1\":true,\"yaw_switch2\":true,\"yaw_switch3\":true,\"yaw_switch4\":true,\"yaw_switch51\":true,\"yaw_switch52\":true,\"yaw_switch61\":true,\"yaw_switch62\":true}")
slot_0_46_0.presets.Classic = slot_0_46_0.parse_preset("{\"base_compensate\":true,\"base_pitch\":1.0,\"base_yaw\":1.0,\"breaklc_always\":[\"Standing\",\"Slow Walking\",\"Crouching\",\"In Air\",\"Safe Head\"],\"breaklc_extra\":[\"Condition Change\",\"Weapon Change\",\"Reloading\"],\"breaklc_ping\":[],\"def_onetapspeed1\":10.0,\"def_onetapspeed2\":20.0,\"def_onetapspeed3\":20.0,\"def_onetapspeed4\":20.0,\"def_onetapspeed51\":20.0,\"def_onetapspeed52\":20.0,\"def_onetapspeed61\":10.0,\"def_onetapspeed62\":20.0,\"def_pitch1\":\"Up\",\"def_pitch2\":\"Up\",\"def_pitch3\":\"Up\",\"def_pitch4\":\"Up\",\"def_pitch51\":\"Up\",\"def_pitch52\":\"Up\",\"def_pitch61\":\"Up\",\"def_pitch62\":\"Up\",\"def_switch1\":true,\"def_switch2\":false,\"def_switch3\":true,\"def_switch4\":false,\"def_switch51\":true,\"def_switch52\":true,\"def_switch61\":true,\"def_switch62\":true,\"def_yaw1\":3.0,\"def_yaw2\":3.0,\"def_yaw3\":3.0,\"def_yaw4\":3.0,\"def_yaw51\":3.0,\"def_yaw52\":3.0,\"def_yaw61\":3.0,\"def_yaw62\":3.0,\"def_yaw_deg1\":0.0,\"def_yaw_deg2\":0.0,\"def_yaw_deg3\":0.0,\"def_yaw_deg4\":0.0,\"def_yaw_deg51\":0.0,\"def_yaw_deg52\":0.0,\"def_yaw_deg61\":0.0,\"def_yaw_deg62\":0.0,\"desync_freestand1\":1.0,\"desync_freestand2\":1.0,\"desync_freestand3\":1.0,\"desync_freestand4\":1.0,\"desync_freestand51\":1.0,\"desync_freestand52\":1.0,\"desync_freestand61\":1.0,\"desync_freestand62\":1.0,\"desync_l1\":0.0,\"desync_l2\":60.0,\"desync_l3\":60.0,\"desync_l4\":60.0,\"desync_l51\":60.0,\"desync_l52\":60.0,\"desync_l61\":60.0,\"desync_l62\":60.0,\"desync_mod1\":[],\"desync_mod2\":[\"Jitter\"],\"desync_mod3\":[\"Jitter\"],\"desync_mod4\":[\"Jitter\"],\"desync_mod51\":[\"Jitter\"],\"desync_mod52\":[\"Jitter\"],\"desync_mod61\":[\"Jitter\"],\"desync_mod62\":[\"Jitter\"],\"desync_r1\":0.0,\"desync_r2\":60.0,\"desync_r3\":60.0,\"desync_r4\":60.0,\"desync_r51\":60.0,\"desync_r52\":60.0,\"desync_r61\":60.0,\"desync_r62\":60.0,\"desync_switch1\":true,\"desync_switch2\":true,\"desync_switch3\":true,\"desync_switch4\":true,\"desync_switch51\":true,\"desync_switch52\":true,\"desync_switch61\":true,\"desync_switch62\":true,\"flick_delay1\":3.0,\"flick_delay2\":3.0,\"flick_delay3\":3.0,\"flick_delay4\":3.0,\"flick_delay51\":3.0,\"flick_delay52\":3.0,\"flick_delay61\":3.0,\"flick_delay62\":3.0,\"flick_yaw1\":0.0,\"flick_yaw2\":0.0,\"flick_yaw3\":0.0,\"flick_yaw4\":0.0,\"flick_yaw51\":0.0,\"flick_yaw52\":0.0,\"flick_yaw61\":0.0,\"flick_yaw62\":0.0,\"frees_dis_def\":false,\"frees_disable\":[\"In Air\"],\"frees_pitch\":2.0,\"frees_pitch_custom\":0.0,\"frees_yaw\":1.0,\"frees_yaw_onetap\":0.0,\"legitaa_custom\":0.0,\"legitaa_desync\":true,\"legitaa_freestand\":2.0,\"legitaa_mod\":[\"Jitter\"],\"legitaa_pitch\":1.0,\"legitaa_switch\":true,\"list\":3.0,\"manual_type\":1.0,\"manual_view\":1.0,\"over_cond2\":false,\"over_cond3\":false,\"over_cond4\":false,\"over_cond51\":false,\"over_cond52\":false,\"over_cond61\":false,\"over_cond62\":false,\"pitch_custom1\":0.0,\"pitch_custom2\":0.0,\"pitch_custom3\":0.0,\"pitch_custom4\":0.0,\"pitch_custom51\":0.0,\"pitch_custom52\":0.0,\"pitch_custom61\":0.0,\"pitch_custom62\":0.0,\"pitch_deg1\":0.0,\"pitch_deg2\":0.0,\"pitch_deg3\":0.0,\"pitch_deg4\":0.0,\"pitch_deg51\":0.0,\"pitch_deg52\":0.0,\"pitch_deg61\":0.0,\"pitch_deg62\":0.0,\"predict_switch\":true,\"preset_list\":1.0,\"roll_def_deg1\":0.0,\"roll_def_deg2\":0.0,\"roll_def_deg3\":0.0,\"roll_def_deg4\":0.0,\"roll_def_deg51\":0.0,\"roll_def_deg52\":0.0,\"roll_def_deg61\":0.0,\"roll_def_deg62\":0.0,\"roll_ext_deg1\":0.0,\"roll_ext_deg2\":0.0,\"roll_ext_deg3\":0.0,\"roll_ext_deg4\":0.0,\"roll_ext_deg51\":0.0,\"roll_ext_deg52\":0.0,\"roll_ext_deg61\":0.0,\"roll_ext_deg62\":0.0,\"roll_ext_pit1\":0.0,\"roll_ext_pit2\":0.0,\"roll_ext_pit3\":0.0,\"roll_ext_pit4\":0.0,\"roll_ext_pit51\":0.0,\"roll_ext_pit52\":0.0,\"roll_ext_pit61\":0.0,\"roll_ext_pit62\":0.0,\"roll_switch1\":false,\"roll_switch2\":false,\"roll_switch3\":false,\"roll_switch4\":false,\"roll_switch51\":false,\"roll_switch52\":false,\"roll_switch61\":false,\"roll_switch62\":false,\"roll_type1\":1.0,\"roll_type2\":1.0,\"roll_type3\":1.0,\"roll_type4\":1.0,\"roll_type51\":1.0,\"roll_type52\":1.0,\"roll_type61\":1.0,\"roll_type62\":1.0,\"safe_def\":true,\"safe_switch\":true,\"xway_counter1\":3.0,\"xway_counter2\":3.0,\"xway_counter3\":3.0,\"xway_counter4\":3.0,\"xway_counter51\":3.0,\"xway_counter52\":3.0,\"xway_counter61\":3.0,\"xway_counter62\":3.0,\"xway_shuffle1\":false,\"xway_shuffle2\":false,\"xway_shuffle3\":false,\"xway_shuffle4\":false,\"xway_shuffle51\":false,\"xway_shuffle52\":false,\"xway_shuffle61\":false,\"xway_shuffle62\":false,\"xway_switch1\":false,\"xway_switch2\":false,\"xway_switch3\":false,\"xway_switch4\":false,\"xway_switch51\":false,\"xway_switch52\":false,\"xway_switch61\":false,\"xway_switch62\":false,\"xway_sync1\":false,\"xway_sync2\":false,\"xway_sync3\":false,\"xway_sync4\":false,\"xway_sync51\":false,\"xway_sync52\":false,\"xway_sync61\":false,\"xway_sync62\":false,\"xwayn_11\":0.0,\"xwayn_12\":0.0,\"xwayn_13\":0.0,\"xwayn_14\":0.0,\"xwayn_15\":0.0,\"xwayn_16\":0.0,\"xwayn_17\":0.0,\"xwayn_21\":0.0,\"xwayn_22\":0.0,\"xwayn_23\":0.0,\"xwayn_24\":0.0,\"xwayn_25\":0.0,\"xwayn_26\":0.0,\"xwayn_27\":0.0,\"xwayn_31\":0.0,\"xwayn_32\":0.0,\"xwayn_33\":0.0,\"xwayn_34\":0.0,\"xwayn_35\":0.0,\"xwayn_36\":0.0,\"xwayn_37\":0.0,\"xwayn_41\":0.0,\"xwayn_42\":0.0,\"xwayn_43\":0.0,\"xwayn_44\":0.0,\"xwayn_45\":0.0,\"xwayn_46\":0.0,\"xwayn_47\":0.0,\"xwayn_511\":0.0,\"xwayn_512\":0.0,\"xwayn_513\":0.0,\"xwayn_514\":0.0,\"xwayn_515\":0.0,\"xwayn_516\":0.0,\"xwayn_517\":0.0,\"xwayn_521\":0.0,\"xwayn_522\":0.0,\"xwayn_523\":0.0,\"xwayn_524\":0.0,\"xwayn_525\":0.0,\"xwayn_526\":0.0,\"xwayn_527\":0.0,\"xwayn_611\":0.0,\"xwayn_612\":0.0,\"xwayn_613\":0.0,\"xwayn_614\":0.0,\"xwayn_615\":0.0,\"xwayn_616\":0.0,\"xwayn_617\":0.0,\"xwayn_621\":0.0,\"xwayn_622\":0.0,\"xwayn_623\":0.0,\"xwayn_624\":0.0,\"xwayn_625\":0.0,\"xwayn_626\":0.0,\"xwayn_627\":0.0,\"yaw_deg1\":-35.0,\"yaw_deg2\":-70.0,\"yaw_deg3\":-89.0,\"yaw_deg4\":-75.0,\"yaw_deg51\":-63.0,\"yaw_deg52\":-63.0,\"yaw_deg61\":-75.0,\"yaw_deg62\":-70.0,\"yaw_delay1\":0.0,\"yaw_delay2\":0.0,\"yaw_delay3\":0.0,\"yaw_delay4\":0.0,\"yaw_delay51\":0.0,\"yaw_delay52\":0.0,\"yaw_delay61\":0.0,\"yaw_delay62\":0.0,\"yaw_l1\":0.0,\"yaw_l2\":0.0,\"yaw_l3\":0.0,\"yaw_l4\":0.0,\"yaw_l51\":0.0,\"yaw_l52\":0.0,\"yaw_l61\":0.0,\"yaw_l62\":0.0,\"yaw_mod_combo1\":2.0,\"yaw_mod_combo2\":2.0,\"yaw_mod_combo3\":2.0,\"yaw_mod_combo4\":2.0,\"yaw_mod_combo51\":2.0,\"yaw_mod_combo52\":2.0,\"yaw_mod_combo61\":2.0,\"yaw_mod_combo62\":2.0,\"yaw_o1\":0.0,\"yaw_o2\":0.0,\"yaw_o3\":0.0,\"yaw_o4\":0.0,\"yaw_o51\":0.0,\"yaw_o52\":0.0,\"yaw_o61\":0.0,\"yaw_o62\":0.0,\"yaw_r1\":0.0,\"yaw_r2\":0.0,\"yaw_r3\":0.0,\"yaw_r4\":0.0,\"yaw_r51\":0.0,\"yaw_r52\":0.0,\"yaw_r61\":0.0,\"yaw_r62\":0.0,\"yaw_randl1\":0.0,\"yaw_randl2\":0.0,\"yaw_randl3\":0.0,\"yaw_randl4\":0.0,\"yaw_randl51\":0.0,\"yaw_randl52\":0.0,\"yaw_randl61\":0.0,\"yaw_randl62\":0.0,\"yaw_rando1\":0.0,\"yaw_rando2\":-5.0,\"yaw_rando3\":-5.0,\"yaw_rando4\":-5.0,\"yaw_rando51\":-5.0,\"yaw_rando52\":-5.0,\"yaw_rando61\":5.0,\"yaw_rando62\":0.0,\"yaw_randr1\":0.0,\"yaw_randr2\":0.0,\"yaw_randr3\":0.0,\"yaw_randr4\":0.0,\"yaw_randr51\":0.0,\"yaw_randr52\":0.0,\"yaw_randr61\":0.0,\"yaw_randr62\":0.0,\"yaw_switch1\":true,\"yaw_switch2\":true,\"yaw_switch3\":true,\"yaw_switch4\":true,\"yaw_switch51\":true,\"yaw_switch52\":true,\"yaw_switch61\":true,\"yaw_switch62\":true}")
slot_0_46_0.presets.Way = slot_0_46_0.parse_preset("{\"base_compensate\":false,\"base_pitch\":1.0,\"base_yaw\":2.0,\"breaklc_always\":[],\"breaklc_extra\":[],\"breaklc_ping\":[],\"def_onetapspeed1\":10.0,\"def_onetapspeed2\":20.0,\"def_onetapspeed3\":20.0,\"def_onetapspeed4\":20.0,\"def_onetapspeed51\":20.0,\"def_onetapspeed52\":20.0,\"def_onetapspeed61\":20.0,\"def_onetapspeed62\":20.0,\"def_pitch1\":\"Disabled\",\"def_pitch2\":\"Up\",\"def_pitch3\":\"Up\",\"def_pitch4\":\"Up\",\"def_pitch51\":\"Up\",\"def_pitch52\":\"Up\",\"def_pitch61\":\"Up\",\"def_pitch62\":\"Up\",\"def_switch1\":false,\"def_switch2\":true,\"def_switch3\":true,\"def_switch4\":true,\"def_switch51\":true,\"def_switch52\":true,\"def_switch61\":true,\"def_switch62\":true,\"def_yaw1\":1.0,\"def_yaw2\":3.0,\"def_yaw3\":3.0,\"def_yaw4\":3.0,\"def_yaw51\":3.0,\"def_yaw52\":3.0,\"def_yaw61\":3.0,\"def_yaw62\":3.0,\"def_yaw_deg1\":0.0,\"def_yaw_deg2\":0.0,\"def_yaw_deg3\":0.0,\"def_yaw_deg4\":0.0,\"def_yaw_deg51\":0.0,\"def_yaw_deg52\":0.0,\"def_yaw_deg61\":0.0,\"def_yaw_deg62\":0.0,\"desync_freestand1\":1.0,\"desync_freestand2\":1.0,\"desync_freestand3\":1.0,\"desync_freestand4\":1.0,\"desync_freestand51\":1.0,\"desync_freestand52\":1.0,\"desync_freestand61\":1.0,\"desync_freestand62\":1.0,\"desync_l1\":60.0,\"desync_l2\":60.0,\"desync_l3\":60.0,\"desync_l4\":60.0,\"desync_l51\":60.0,\"desync_l52\":60.0,\"desync_l61\":60.0,\"desync_l62\":60.0,\"desync_mod1\":[],\"desync_mod2\":[],\"desync_mod3\":[],\"desync_mod4\":[],\"desync_mod51\":[],\"desync_mod52\":[],\"desync_mod61\":[],\"desync_mod62\":[],\"desync_r1\":60.0,\"desync_r2\":60.0,\"desync_r3\":60.0,\"desync_r4\":60.0,\"desync_r51\":60.0,\"desync_r52\":60.0,\"desync_r61\":60.0,\"desync_r62\":60.0,\"desync_switch1\":false,\"desync_switch2\":true,\"desync_switch3\":true,\"desync_switch4\":true,\"desync_switch51\":true,\"desync_switch52\":true,\"desync_switch61\":true,\"desync_switch62\":true,\"flick_delay1\":3.0,\"flick_delay2\":3.0,\"flick_delay3\":3.0,\"flick_delay4\":3.0,\"flick_delay51\":3.0,\"flick_delay52\":3.0,\"flick_delay61\":3.0,\"flick_delay62\":3.0,\"flick_yaw1\":0.0,\"flick_yaw2\":0.0,\"flick_yaw3\":0.0,\"flick_yaw4\":0.0,\"flick_yaw51\":0.0,\"flick_yaw52\":0.0,\"flick_yaw61\":0.0,\"flick_yaw62\":0.0,\"frees_dis_def\":true,\"frees_disable\":[],\"frees_pitch\":1.0,\"frees_pitch_custom\":0.0,\"frees_yaw\":1.0,\"frees_yaw_onetap\":0.0,\"legitaa_custom\":0.0,\"legitaa_desync\":false,\"legitaa_freestand\":1.0,\"legitaa_mod\":[],\"legitaa_pitch\":1.0,\"legitaa_switch\":false,\"list\":3.0,\"manual_type\":1.0,\"manual_view\":1.0,\"over_cond2\":false,\"over_cond3\":false,\"over_cond4\":false,\"over_cond51\":false,\"over_cond52\":false,\"over_cond61\":false,\"over_cond62\":false,\"pitch_custom1\":0.0,\"pitch_custom2\":0.0,\"pitch_custom3\":0.0,\"pitch_custom4\":0.0,\"pitch_custom51\":0.0,\"pitch_custom52\":0.0,\"pitch_custom61\":0.0,\"pitch_custom62\":0.0,\"pitch_deg1\":0.0,\"pitch_deg2\":0.0,\"pitch_deg3\":0.0,\"pitch_deg4\":0.0,\"pitch_deg51\":0.0,\"pitch_deg52\":0.0,\"pitch_deg61\":0.0,\"pitch_deg62\":0.0,\"predict_switch\":false,\"preset_list\":1.0,\"roll_def_deg1\":0.0,\"roll_def_deg2\":0.0,\"roll_def_deg3\":0.0,\"roll_def_deg4\":0.0,\"roll_def_deg51\":0.0,\"roll_def_deg52\":0.0,\"roll_def_deg61\":0.0,\"roll_def_deg62\":0.0,\"roll_ext_deg1\":0.0,\"roll_ext_deg2\":0.0,\"roll_ext_deg3\":0.0,\"roll_ext_deg4\":0.0,\"roll_ext_deg51\":0.0,\"roll_ext_deg52\":0.0,\"roll_ext_deg61\":0.0,\"roll_ext_deg62\":0.0,\"roll_ext_pit1\":0.0,\"roll_ext_pit2\":0.0,\"roll_ext_pit3\":0.0,\"roll_ext_pit4\":0.0,\"roll_ext_pit51\":0.0,\"roll_ext_pit52\":0.0,\"roll_ext_pit61\":0.0,\"roll_ext_pit62\":0.0,\"roll_switch1\":false,\"roll_switch2\":false,\"roll_switch3\":false,\"roll_switch4\":false,\"roll_switch51\":false,\"roll_switch52\":false,\"roll_switch61\":false,\"roll_switch62\":false,\"roll_type1\":1.0,\"roll_type2\":1.0,\"roll_type3\":1.0,\"roll_type4\":1.0,\"roll_type51\":1.0,\"roll_type52\":1.0,\"roll_type61\":1.0,\"roll_type62\":1.0,\"safe_def\":false,\"safe_switch\":false,\"xway_counter1\":3.0,\"xway_counter2\":3.0,\"xway_counter3\":4.0,\"xway_counter4\":3.0,\"xway_counter51\":4.0,\"xway_counter52\":3.0,\"xway_counter61\":3.0,\"xway_counter62\":3.0,\"xway_shuffle1\":false,\"xway_shuffle2\":true,\"xway_shuffle3\":true,\"xway_shuffle4\":true,\"xway_shuffle51\":true,\"xway_shuffle52\":true,\"xway_shuffle61\":false,\"xway_shuffle62\":true,\"xway_switch1\":false,\"xway_switch2\":true,\"xway_switch3\":true,\"xway_switch4\":true,\"xway_switch51\":true,\"xway_switch52\":true,\"xway_switch61\":true,\"xway_switch62\":true,\"xway_sync1\":false,\"xway_sync2\":true,\"xway_sync3\":true,\"xway_sync4\":true,\"xway_sync51\":true,\"xway_sync52\":true,\"xway_sync61\":true,\"xway_sync62\":true,\"xwayn_11\":0.0,\"xwayn_12\":0.0,\"xwayn_13\":0.0,\"xwayn_14\":0.0,\"xwayn_15\":0.0,\"xwayn_16\":0.0,\"xwayn_17\":0.0,\"xwayn_21\":-28.0,\"xwayn_22\":46.0,\"xwayn_23\":7.0,\"xwayn_24\":0.0,\"xwayn_25\":0.0,\"xwayn_26\":0.0,\"xwayn_27\":0.0,\"xwayn_31\":-51.0,\"xwayn_32\":37.0,\"xwayn_33\":-37.0,\"xwayn_34\":21.0,\"xwayn_35\":0.0,\"xwayn_36\":0.0,\"xwayn_37\":0.0,\"xwayn_41\":-28.0,\"xwayn_42\":46.0,\"xwayn_43\":-19.0,\"xwayn_44\":0.0,\"xwayn_45\":0.0,\"xwayn_46\":0.0,\"xwayn_47\":0.0,\"xwayn_511\":-42.0,\"xwayn_512\":45.0,\"xwayn_513\":-33.0,\"xwayn_514\":33.0,\"xwayn_515\":0.0,\"xwayn_516\":0.0,\"xwayn_517\":0.0,\"xwayn_521\":-30.0,\"xwayn_522\":45.0,\"xwayn_523\":17.0,\"xwayn_524\":33.0,\"xwayn_525\":0.0,\"xwayn_526\":0.0,\"xwayn_527\":0.0,\"xwayn_611\":-31.0,\"xwayn_612\":46.0,\"xwayn_613\":20.0,\"xwayn_614\":0.0,\"xwayn_615\":0.0,\"xwayn_616\":0.0,\"xwayn_617\":0.0,\"xwayn_621\":-36.0,\"xwayn_622\":38.0,\"xwayn_623\":13.0,\"xwayn_624\":0.0,\"xwayn_625\":0.0,\"xwayn_626\":0.0,\"xwayn_627\":0.0,\"yaw_deg1\":0.0,\"yaw_deg2\":-78.0,\"yaw_deg3\":-78.0,\"yaw_deg4\":-78.0,\"yaw_deg51\":-78.0,\"yaw_deg52\":-78.0,\"yaw_deg61\":-78.0,\"yaw_deg62\":-78.0,\"yaw_delay1\":0.0,\"yaw_delay2\":0.0,\"yaw_delay3\":0.0,\"yaw_delay4\":0.0,\"yaw_delay51\":0.0,\"yaw_delay52\":0.0,\"yaw_delay61\":0.0,\"yaw_delay62\":0.0,\"yaw_l1\":0.0,\"yaw_l2\":0.0,\"yaw_l3\":0.0,\"yaw_l4\":0.0,\"yaw_l51\":0.0,\"yaw_l52\":0.0,\"yaw_l61\":0.0,\"yaw_l62\":0.0,\"yaw_mod_combo1\":1.0,\"yaw_mod_combo2\":3.0,\"yaw_mod_combo3\":3.0,\"yaw_mod_combo4\":3.0,\"yaw_mod_combo51\":3.0,\"yaw_mod_combo52\":3.0,\"yaw_mod_combo61\":3.0,\"yaw_mod_combo62\":3.0,\"yaw_o1\":0.0,\"yaw_o2\":0.0,\"yaw_o3\":17.0,\"yaw_o4\":0.0,\"yaw_o51\":17.0,\"yaw_o52\":17.0,\"yaw_o61\":0.0,\"yaw_o62\":17.0,\"yaw_r1\":0.0,\"yaw_r2\":0.0,\"yaw_r3\":0.0,\"yaw_r4\":0.0,\"yaw_r51\":0.0,\"yaw_r52\":0.0,\"yaw_r61\":0.0,\"yaw_r62\":0.0,\"yaw_randl1\":0.0,\"yaw_randl2\":0.0,\"yaw_randl3\":0.0,\"yaw_randl4\":0.0,\"yaw_randl51\":0.0,\"yaw_randl52\":0.0,\"yaw_randl61\":0.0,\"yaw_randl62\":0.0,\"yaw_rando1\":0.0,\"yaw_rando2\":10.0,\"yaw_rando3\":5.0,\"yaw_rando4\":-10.0,\"yaw_rando51\":-5.0,\"yaw_rando52\":-5.0,\"yaw_rando61\":10.0,\"yaw_rando62\":-5.0,\"yaw_randr1\":0.0,\"yaw_randr2\":0.0,\"yaw_randr3\":0.0,\"yaw_randr4\":0.0,\"yaw_randr51\":0.0,\"yaw_randr52\":0.0,\"yaw_randr61\":0.0,\"yaw_randr62\":0.0,\"yaw_switch1\":false,\"yaw_switch2\":true,\"yaw_switch3\":true,\"yaw_switch4\":true,\"yaw_switch51\":true,\"yaw_switch52\":true,\"yaw_switch61\":true,\"yaw_switch62\":true}")
slot_0_46_0.presets.Delay = slot_0_46_0.parse_preset("{\"base_compensate\":false,\"base_pitch\":1.0,\"base_yaw\":1.0,\"breaklc_always\":[],\"breaklc_extra\":[],\"breaklc_ping\":[],\"def_onetapspeed1\":10.0,\"def_onetapspeed2\":20.0,\"def_onetapspeed3\":20.0,\"def_onetapspeed4\":20.0,\"def_onetapspeed51\":20.0,\"def_onetapspeed52\":20.0,\"def_onetapspeed61\":10.0,\"def_onetapspeed62\":20.0,\"def_pitch1\":\"Disabled\",\"def_pitch2\":\"Up\",\"def_pitch3\":\"Up\",\"def_pitch4\":\"Up\",\"def_pitch51\":\"Up\",\"def_pitch52\":\"Up\",\"def_pitch61\":\"Disabled\",\"def_pitch62\":\"Up\",\"def_switch1\":false,\"def_switch2\":true,\"def_switch3\":true,\"def_switch4\":true,\"def_switch51\":true,\"def_switch52\":true,\"def_switch61\":false,\"def_switch62\":true,\"def_yaw1\":1.0,\"def_yaw2\":3.0,\"def_yaw3\":3.0,\"def_yaw4\":3.0,\"def_yaw51\":3.0,\"def_yaw52\":3.0,\"def_yaw61\":1.0,\"def_yaw62\":3.0,\"def_yaw_deg1\":0.0,\"def_yaw_deg2\":0.0,\"def_yaw_deg3\":0.0,\"def_yaw_deg4\":0.0,\"def_yaw_deg51\":0.0,\"def_yaw_deg52\":0.0,\"def_yaw_deg61\":0.0,\"def_yaw_deg62\":0.0,\"desync_freestand1\":1.0,\"desync_freestand2\":1.0,\"desync_freestand3\":1.0,\"desync_freestand4\":1.0,\"desync_freestand51\":1.0,\"desync_freestand52\":1.0,\"desync_freestand61\":1.0,\"desync_freestand62\":1.0,\"desync_l1\":60.0,\"desync_l2\":60.0,\"desync_l3\":60.0,\"desync_l4\":60.0,\"desync_l51\":60.0,\"desync_l52\":60.0,\"desync_l61\":60.0,\"desync_l62\":60.0,\"desync_mod1\":[],\"desync_mod2\":[\"Jitter\"],\"desync_mod3\":[],\"desync_mod4\":[],\"desync_mod51\":[\"Jitter\"],\"desync_mod52\":[\"Jitter\"],\"desync_mod61\":[\"Jitter\"],\"desync_mod62\":[\"Jitter\"],\"desync_r1\":60.0,\"desync_r2\":60.0,\"desync_r3\":60.0,\"desync_r4\":60.0,\"desync_r51\":60.0,\"desync_r52\":60.0,\"desync_r61\":60.0,\"desync_r62\":60.0,\"desync_switch1\":false,\"desync_switch2\":true,\"desync_switch3\":false,\"desync_switch4\":true,\"desync_switch51\":true,\"desync_switch52\":true,\"desync_switch61\":true,\"desync_switch62\":true,\"flick_delay1\":3.0,\"flick_delay2\":3.0,\"flick_delay3\":3.0,\"flick_delay4\":3.0,\"flick_delay51\":3.0,\"flick_delay52\":3.0,\"flick_delay61\":3.0,\"flick_delay62\":3.0,\"flick_yaw1\":0.0,\"flick_yaw2\":0.0,\"flick_yaw3\":0.0,\"flick_yaw4\":0.0,\"flick_yaw51\":0.0,\"flick_yaw52\":0.0,\"flick_yaw61\":0.0,\"flick_yaw62\":0.0,\"frees_dis_def\":true,\"frees_disable\":[],\"frees_pitch\":1.0,\"frees_pitch_custom\":0.0,\"frees_yaw\":1.0,\"frees_yaw_onetap\":0.0,\"legitaa_custom\":0.0,\"legitaa_desync\":false,\"legitaa_freestand\":1.0,\"legitaa_mod\":[],\"legitaa_pitch\":1.0,\"legitaa_switch\":false,\"list\":3.0,\"manual_type\":1.0,\"manual_view\":1.0,\"over_cond2\":false,\"over_cond3\":false,\"over_cond4\":false,\"over_cond51\":false,\"over_cond52\":false,\"over_cond61\":false,\"over_cond62\":false,\"pitch_custom1\":0.0,\"pitch_custom2\":0.0,\"pitch_custom3\":0.0,\"pitch_custom4\":0.0,\"pitch_custom51\":0.0,\"pitch_custom52\":0.0,\"pitch_custom61\":0.0,\"pitch_custom62\":0.0,\"pitch_deg1\":0.0,\"pitch_deg2\":0.0,\"pitch_deg3\":0.0,\"pitch_deg4\":0.0,\"pitch_deg51\":0.0,\"pitch_deg52\":0.0,\"pitch_deg61\":0.0,\"pitch_deg62\":0.0,\"predict_switch\":false,\"preset_list\":4.0,\"roll_def_deg1\":0.0,\"roll_def_deg2\":0.0,\"roll_def_deg3\":0.0,\"roll_def_deg4\":0.0,\"roll_def_deg51\":0.0,\"roll_def_deg52\":0.0,\"roll_def_deg61\":0.0,\"roll_def_deg62\":0.0,\"roll_ext_deg1\":0.0,\"roll_ext_deg2\":0.0,\"roll_ext_deg3\":0.0,\"roll_ext_deg4\":0.0,\"roll_ext_deg51\":0.0,\"roll_ext_deg52\":0.0,\"roll_ext_deg61\":0.0,\"roll_ext_deg62\":0.0,\"roll_ext_pit1\":0.0,\"roll_ext_pit2\":0.0,\"roll_ext_pit3\":0.0,\"roll_ext_pit4\":0.0,\"roll_ext_pit51\":0.0,\"roll_ext_pit52\":0.0,\"roll_ext_pit61\":0.0,\"roll_ext_pit62\":0.0,\"roll_switch1\":false,\"roll_switch2\":false,\"roll_switch3\":false,\"roll_switch4\":false,\"roll_switch51\":false,\"roll_switch52\":false,\"roll_switch61\":false,\"roll_switch62\":false,\"roll_type1\":1.0,\"roll_type2\":1.0,\"roll_type3\":1.0,\"roll_type4\":1.0,\"roll_type51\":1.0,\"roll_type52\":1.0,\"roll_type61\":1.0,\"roll_type62\":1.0,\"safe_def\":false,\"safe_switch\":false,\"xway_counter1\":3.0,\"xway_counter2\":4.0,\"xway_counter3\":5.0,\"xway_counter4\":4.0,\"xway_counter51\":4.0,\"xway_counter52\":4.0,\"xway_counter61\":3.0,\"xway_counter62\":4.0,\"xway_shuffle1\":false,\"xway_shuffle2\":true,\"xway_shuffle3\":true,\"xway_shuffle4\":true,\"xway_shuffle51\":true,\"xway_shuffle52\":true,\"xway_shuffle61\":false,\"xway_shuffle62\":true,\"xway_switch1\":false,\"xway_switch2\":true,\"xway_switch3\":true,\"xway_switch4\":true,\"xway_switch51\":true,\"xway_switch52\":true,\"xway_switch61\":false,\"xway_switch62\":true,\"xway_sync1\":false,\"xway_sync2\":true,\"xway_sync3\":true,\"xway_sync4\":true,\"xway_sync51\":true,\"xway_sync52\":true,\"xway_sync61\":false,\"xway_sync62\":true,\"xwayn_11\":0.0,\"xwayn_12\":0.0,\"xwayn_13\":0.0,\"xwayn_14\":0.0,\"xwayn_15\":0.0,\"xwayn_16\":0.0,\"xwayn_17\":0.0,\"xwayn_21\":-39.0,\"xwayn_22\":26.0,\"xwayn_23\":-32.0,\"xwayn_24\":32.0,\"xwayn_25\":0.0,\"xwayn_26\":0.0,\"xwayn_27\":0.0,\"xwayn_31\":-35.0,\"xwayn_32\":38.0,\"xwayn_33\":-27.0,\"xwayn_34\":45.0,\"xwayn_35\":0.0,\"xwayn_36\":0.0,\"xwayn_37\":0.0,\"xwayn_41\":-35.0,\"xwayn_42\":38.0,\"xwayn_43\":-27.0,\"xwayn_44\":45.0,\"xwayn_45\":0.0,\"xwayn_46\":0.0,\"xwayn_47\":0.0,\"xwayn_511\":-31.0,\"xwayn_512\":44.0,\"xwayn_513\":55.0,\"xwayn_514\":-21.0,\"xwayn_515\":0.0,\"xwayn_516\":0.0,\"xwayn_517\":0.0,\"xwayn_521\":-25.0,\"xwayn_522\":41.0,\"xwayn_523\":53.0,\"xwayn_524\":-29.0,\"xwayn_525\":0.0,\"xwayn_526\":0.0,\"xwayn_527\":0.0,\"xwayn_611\":0.0,\"xwayn_612\":0.0,\"xwayn_613\":0.0,\"xwayn_614\":0.0,\"xwayn_615\":0.0,\"xwayn_616\":0.0,\"xwayn_617\":0.0,\"xwayn_621\":-35.0,\"xwayn_622\":38.0,\"xwayn_623\":-27.0,\"xwayn_624\":45.0,\"xwayn_625\":0.0,\"xwayn_626\":0.0,\"xwayn_627\":0.0,\"yaw_deg1\":0.0,\"yaw_deg2\":0.0,\"yaw_deg3\":0.0,\"yaw_deg4\":0.0,\"yaw_deg51\":0.0,\"yaw_deg52\":0.0,\"yaw_deg61\":-51.0,\"yaw_deg62\":-63.0,\"yaw_delay1\":0.0,\"yaw_delay2\":1.0,\"yaw_delay3\":3.0,\"yaw_delay4\":1.0,\"yaw_delay51\":1.0,\"yaw_delay52\":1.0,\"yaw_delay61\":0.0,\"yaw_delay62\":1.0,\"yaw_l1\":0.0,\"yaw_l2\":0.0,\"yaw_l3\":0.0,\"yaw_l4\":0.0,\"yaw_l51\":0.0,\"yaw_l52\":0.0,\"yaw_l61\":0.0,\"yaw_l62\":0.0,\"yaw_mod_combo1\":1.0,\"yaw_mod_combo2\":3.0,\"yaw_mod_combo3\":3.0,\"yaw_mod_combo4\":3.0,\"yaw_mod_combo51\":3.0,\"yaw_mod_combo52\":3.0,\"yaw_mod_combo61\":2.0,\"yaw_mod_combo62\":2.0,\"yaw_o1\":0.0,\"yaw_o2\":0.0,\"yaw_o3\":0.0,\"yaw_o4\":0.0,\"yaw_o51\":0.0,\"yaw_o52\":0.0,\"yaw_o61\":0.0,\"yaw_o62\":10.0,\"yaw_r1\":0.0,\"yaw_r2\":0.0,\"yaw_r3\":0.0,\"yaw_r4\":0.0,\"yaw_r51\":0.0,\"yaw_r52\":0.0,\"yaw_r61\":0.0,\"yaw_r62\":0.0,\"yaw_randl1\":0.0,\"yaw_randl2\":0.0,\"yaw_randl3\":0.0,\"yaw_randl4\":0.0,\"yaw_randl51\":0.0,\"yaw_randl52\":0.0,\"yaw_randl61\":0.0,\"yaw_randl62\":0.0,\"yaw_rando1\":0.0,\"yaw_rando2\":10.0,\"yaw_rando3\":-10.0,\"yaw_rando4\":-10.0,\"yaw_rando51\":5.0,\"yaw_rando52\":-5.0,\"yaw_rando61\":5.0,\"yaw_rando62\":-10.0,\"yaw_randr1\":0.0,\"yaw_randr2\":0.0,\"yaw_randr3\":0.0,\"yaw_randr4\":0.0,\"yaw_randr51\":0.0,\"yaw_randr52\":0.0,\"yaw_randr61\":0.0,\"yaw_randr62\":0.0,\"yaw_switch1\":false,\"yaw_switch2\":true,\"yaw_switch3\":true,\"yaw_switch4\":true,\"yaw_switch51\":true,\"yaw_switch52\":true,\"yaw_switch61\":true,\"yaw_switch62\":true}")
slot_0_46_0.presets.Roll = slot_0_46_0.parse_preset("{\"base_compensate\":false,\"base_pitch\":1.0,\"base_yaw\":1.0,\"breaklc_always\":[],\"breaklc_extra\":[],\"breaklc_ping\":[],\"def_onetapspeed1\":10.0,\"def_onetapspeed2\":10.0,\"def_onetapspeed3\":10.0,\"def_onetapspeed4\":10.0,\"def_onetapspeed51\":10.0,\"def_onetapspeed52\":10.0,\"def_onetapspeed61\":10.0,\"def_onetapspeed62\":10.0,\"def_pitch1\":\"Random\",\"def_pitch2\":\"Disabled\",\"def_pitch3\":\"Disabled\",\"def_pitch4\":\"Random\",\"def_pitch51\":\"Sway\",\"def_pitch52\":\"Custom\",\"def_pitch61\":\"Disabled\",\"def_pitch62\":\"Up\",\"def_switch1\":false,\"def_switch2\":false,\"def_switch3\":false,\"def_switch4\":false,\"def_switch51\":false,\"def_switch52\":false,\"def_switch61\":false,\"def_switch62\":false,\"def_yaw1\":1.0,\"def_yaw2\":1.0,\"def_yaw3\":1.0,\"def_yaw4\":1.0,\"def_yaw51\":1.0,\"def_yaw52\":1.0,\"def_yaw61\":1.0,\"def_yaw62\":1.0,\"def_yaw_deg1\":89.0,\"def_yaw_deg2\":0.0,\"def_yaw_deg3\":0.0,\"def_yaw_deg4\":89.0,\"def_yaw_deg51\":0.0,\"def_yaw_deg52\":-65.0,\"def_yaw_deg61\":0.0,\"def_yaw_deg62\":0.0,\"desync_freestand1\":1.0,\"desync_freestand2\":1.0,\"desync_freestand3\":1.0,\"desync_freestand4\":1.0,\"desync_freestand51\":1.0,\"desync_freestand52\":1.0,\"desync_freestand61\":1.0,\"desync_freestand62\":1.0,\"desync_l1\":60.0,\"desync_l2\":60.0,\"desync_l3\":60.0,\"desync_l4\":60.0,\"desync_l51\":60.0,\"desync_l52\":60.0,\"desync_l61\":60.0,\"desync_l62\":60.0,\"desync_mod1\":[],\"desync_mod2\":[],\"desync_mod3\":[],\"desync_mod4\":[\"Jitter\"],\"desync_mod51\":[],\"desync_mod52\":[],\"desync_mod61\":[],\"desync_mod62\":[],\"desync_r1\":60.0,\"desync_r2\":60.0,\"desync_r3\":60.0,\"desync_r4\":60.0,\"desync_r51\":60.0,\"desync_r52\":60.0,\"desync_r61\":60.0,\"desync_r62\":60.0,\"desync_switch1\":true,\"desync_switch2\":true,\"desync_switch3\":true,\"desync_switch4\":false,\"desync_switch51\":true,\"desync_switch52\":true,\"desync_switch61\":true,\"desync_switch62\":true,\"flick_delay1\":3.0,\"flick_delay2\":3.0,\"flick_delay3\":3.0,\"flick_delay4\":3.0,\"flick_delay51\":3.0,\"flick_delay52\":3.0,\"flick_delay61\":3.0,\"flick_delay62\":3.0,\"flick_yaw1\":0.0,\"flick_yaw2\":0.0,\"flick_yaw3\":0.0,\"flick_yaw4\":0.0,\"flick_yaw51\":0.0,\"flick_yaw52\":0.0,\"flick_yaw61\":0.0,\"flick_yaw62\":0.0,\"frees_dis_def\":true,\"frees_disable\":[],\"frees_pitch\":2.0,\"frees_pitch_custom\":0.0,\"frees_yaw\":1.0,\"frees_yaw_onetap\":0.0,\"legitaa_custom\":0.0,\"legitaa_desync\":true,\"legitaa_freestand\":2.0,\"legitaa_mod\":[\"Jitter\"],\"legitaa_pitch\":1.0,\"legitaa_switch\":true,\"list\":3.0,\"manual_type\":1.0,\"manual_view\":1.0,\"over_cond2\":false,\"over_cond3\":false,\"over_cond4\":false,\"over_cond51\":false,\"over_cond52\":false,\"over_cond61\":false,\"over_cond62\":false,\"pitch_custom1\":0.0,\"pitch_custom2\":0.0,\"pitch_custom3\":0.0,\"pitch_custom4\":0.0,\"pitch_custom51\":0.0,\"pitch_custom52\":-65.0,\"pitch_custom61\":0.0,\"pitch_custom62\":0.0,\"pitch_deg1\":89.0,\"pitch_deg2\":0.0,\"pitch_deg3\":0.0,\"pitch_deg4\":89.0,\"pitch_deg51\":89.0,\"pitch_deg52\":0.0,\"pitch_deg61\":0.0,\"pitch_deg62\":0.0,\"predict_switch\":false,\"preset_list\":5.0,\"roll_def_deg1\":60.0,\"roll_def_deg2\":65.0,\"roll_def_deg3\":80.0,\"roll_def_deg4\":89.0,\"roll_def_deg51\":115.0,\"roll_def_deg52\":80.0,\"roll_def_deg61\":45.0,\"roll_def_deg62\":45.0,\"roll_ext_deg1\":0.0,\"roll_ext_deg2\":0.0,\"roll_ext_deg3\":0.0,\"roll_ext_deg4\":0.0,\"roll_ext_deg51\":0.0,\"roll_ext_deg52\":0.0,\"roll_ext_deg61\":0.0,\"roll_ext_deg62\":0.0,\"roll_ext_pit1\":0.0,\"roll_ext_pit2\":0.0,\"roll_ext_pit3\":0.0,\"roll_ext_pit4\":0.0,\"roll_ext_pit51\":0.0,\"roll_ext_pit52\":0.0,\"roll_ext_pit61\":0.0,\"roll_ext_pit62\":0.0,\"roll_switch1\":true,\"roll_switch2\":true,\"roll_switch3\":true,\"roll_switch4\":false,\"roll_switch51\":true,\"roll_switch52\":true,\"roll_switch61\":true,\"roll_switch62\":true,\"roll_type1\":1.0,\"roll_type2\":1.0,\"roll_type3\":1.0,\"roll_type4\":1.0,\"roll_type51\":1.0,\"roll_type52\":1.0,\"roll_type61\":1.0,\"roll_type62\":1.0,\"safe_def\":true,\"safe_switch\":false,\"xway_counter1\":3.0,\"xway_counter2\":3.0,\"xway_counter3\":3.0,\"xway_counter4\":3.0,\"xway_counter51\":3.0,\"xway_counter52\":3.0,\"xway_counter61\":3.0,\"xway_counter62\":3.0,\"xway_shuffle1\":false,\"xway_shuffle2\":false,\"xway_shuffle3\":false,\"xway_shuffle4\":false,\"xway_shuffle51\":false,\"xway_shuffle52\":false,\"xway_shuffle61\":false,\"xway_shuffle62\":false,\"xway_switch1\":false,\"xway_switch2\":false,\"xway_switch3\":false,\"xway_switch4\":false,\"xway_switch51\":false,\"xway_switch52\":false,\"xway_switch61\":false,\"xway_switch62\":false,\"xway_sync1\":false,\"xway_sync2\":false,\"xway_sync3\":false,\"xway_sync4\":false,\"xway_sync51\":false,\"xway_sync52\":false,\"xway_sync61\":false,\"xway_sync62\":false,\"xwayn_11\":0.0,\"xwayn_12\":0.0,\"xwayn_13\":0.0,\"xwayn_14\":0.0,\"xwayn_15\":0.0,\"xwayn_16\":0.0,\"xwayn_17\":0.0,\"xwayn_21\":0.0,\"xwayn_22\":0.0,\"xwayn_23\":0.0,\"xwayn_24\":0.0,\"xwayn_25\":0.0,\"xwayn_26\":0.0,\"xwayn_27\":0.0,\"xwayn_31\":0.0,\"xwayn_32\":0.0,\"xwayn_33\":0.0,\"xwayn_34\":0.0,\"xwayn_35\":0.0,\"xwayn_36\":0.0,\"xwayn_37\":0.0,\"xwayn_41\":0.0,\"xwayn_42\":0.0,\"xwayn_43\":0.0,\"xwayn_44\":0.0,\"xwayn_45\":0.0,\"xwayn_46\":0.0,\"xwayn_47\":0.0,\"xwayn_511\":0.0,\"xwayn_512\":0.0,\"xwayn_513\":0.0,\"xwayn_514\":0.0,\"xwayn_515\":0.0,\"xwayn_516\":0.0,\"xwayn_517\":0.0,\"xwayn_521\":0.0,\"xwayn_522\":0.0,\"xwayn_523\":0.0,\"xwayn_524\":0.0,\"xwayn_525\":0.0,\"xwayn_526\":0.0,\"xwayn_527\":0.0,\"xwayn_611\":0.0,\"xwayn_612\":0.0,\"xwayn_613\":0.0,\"xwayn_614\":0.0,\"xwayn_615\":0.0,\"xwayn_616\":0.0,\"xwayn_617\":0.0,\"xwayn_621\":0.0,\"xwayn_622\":0.0,\"xwayn_623\":0.0,\"xwayn_624\":0.0,\"xwayn_625\":0.0,\"xwayn_626\":0.0,\"xwayn_627\":0.0,\"yaw_deg1\":-16.0,\"yaw_deg2\":0.0,\"yaw_deg3\":0.0,\"yaw_deg4\":-80.0,\"yaw_deg51\":-40.0,\"yaw_deg52\":-59.0,\"yaw_deg61\":0.0,\"yaw_deg62\":-62.0,\"yaw_delay1\":0.0,\"yaw_delay2\":0.0,\"yaw_delay3\":0.0,\"yaw_delay4\":1.0,\"yaw_delay51\":0.0,\"yaw_delay52\":0.0,\"yaw_delay61\":0.0,\"yaw_delay62\":0.0,\"yaw_l1\":0.0,\"yaw_l2\":0.0,\"yaw_l3\":0.0,\"yaw_l4\":0.0,\"yaw_l51\":0.0,\"yaw_l52\":0.0,\"yaw_l61\":0.0,\"yaw_l62\":0.0,\"yaw_mod_combo1\":1.0,\"yaw_mod_combo2\":1.0,\"yaw_mod_combo3\":1.0,\"yaw_mod_combo4\":2.0,\"yaw_mod_combo51\":1.0,\"yaw_mod_combo52\":1.0,\"yaw_mod_combo61\":1.0,\"yaw_mod_combo62\":1.0,\"yaw_o1\":29.0,\"yaw_o2\":14.0,\"yaw_o3\":38.0,\"yaw_o4\":-27.0,\"yaw_o51\":50.0,\"yaw_o52\":32.0,\"yaw_o61\":24.0,\"yaw_o62\":24.0,\"yaw_r1\":0.0,\"yaw_r2\":0.0,\"yaw_r3\":0.0,\"yaw_r4\":0.0,\"yaw_r51\":0.0,\"yaw_r52\":0.0,\"yaw_r61\":0.0,\"yaw_r62\":0.0,\"yaw_randl1\":0.0,\"yaw_randl2\":0.0,\"yaw_randl3\":0.0,\"yaw_randl4\":0.0,\"yaw_randl51\":0.0,\"yaw_randl52\":0.0,\"yaw_randl61\":0.0,\"yaw_randl62\":0.0,\"yaw_rando1\":0.0,\"yaw_rando2\":0.0,\"yaw_rando3\":0.0,\"yaw_rando4\":39.0,\"yaw_rando51\":0.0,\"yaw_rando52\":0.0,\"yaw_rando61\":0.0,\"yaw_rando62\":0.0,\"yaw_randr1\":0.0,\"yaw_randr2\":0.0,\"yaw_randr3\":0.0,\"yaw_randr4\":0.0,\"yaw_randr51\":0.0,\"yaw_randr52\":0.0,\"yaw_randr61\":0.0,\"yaw_randr62\":0.0,\"yaw_switch1\":true,\"yaw_switch2\":true,\"yaw_switch3\":true,\"yaw_switch4\":true,\"yaw_switch51\":true,\"yaw_switch52\":true,\"yaw_switch61\":true,\"yaw_switch62\":true}")
slot_0_46_0.presets.Skitter = slot_0_46_0.parse_preset("{\"base_compensate\":false,\"base_pitch\":1.0,\"base_yaw\":1.0,\"breaklc_always\":[\"Standing\",\"Slow Walking\",\"Crouching\",\"In Air\"],\"breaklc_extra\":[],\"breaklc_ping\":[],\"def_onetapspeed1\":10.0,\"def_onetapspeed2\":10.0,\"def_onetapspeed3\":10.0,\"def_onetapspeed4\":10.0,\"def_onetapspeed51\":10.0,\"def_onetapspeed52\":10.0,\"def_onetapspeed61\":10.0,\"def_onetapspeed62\":10.0,\"def_pitch1\":\"Random\",\"def_pitch2\":\"Disabled\",\"def_pitch3\":\"Disabled\",\"def_pitch4\":\"Random\",\"def_pitch51\":\"Sway\",\"def_pitch52\":\"Custom\",\"def_pitch61\":\"Disabled\",\"def_pitch62\":\"Up\",\"def_switch1\":true,\"def_switch2\":false,\"def_switch3\":false,\"def_switch4\":true,\"def_switch51\":true,\"def_switch52\":true,\"def_switch61\":false,\"def_switch62\":true,\"def_yaw1\":1.0,\"def_yaw2\":1.0,\"def_yaw3\":1.0,\"def_yaw4\":1.0,\"def_yaw51\":1.0,\"def_yaw52\":1.0,\"def_yaw61\":1.0,\"def_yaw62\":1.0,\"def_yaw_deg1\":89.0,\"def_yaw_deg2\":0.0,\"def_yaw_deg3\":0.0,\"def_yaw_deg4\":89.0,\"def_yaw_deg51\":0.0,\"def_yaw_deg52\":-65.0,\"def_yaw_deg61\":0.0,\"def_yaw_deg62\":0.0,\"desync_freestand1\":1.0,\"desync_freestand2\":1.0,\"desync_freestand3\":1.0,\"desync_freestand4\":1.0,\"desync_freestand51\":1.0,\"desync_freestand52\":1.0,\"desync_freestand61\":1.0,\"desync_freestand62\":1.0,\"desync_l1\":60.0,\"desync_l2\":60.0,\"desync_l3\":60.0,\"desync_l4\":60.0,\"desync_l51\":60.0,\"desync_l52\":60.0,\"desync_l61\":60.0,\"desync_l62\":60.0,\"desync_mod1\":[\"Randomize Jitter\"],\"desync_mod2\":[],\"desync_mod3\":[],\"desync_mod4\":[\"Jitter\"],\"desync_mod51\":[\"Jitter\"],\"desync_mod52\":[],\"desync_mod61\":[],\"desync_mod62\":[],\"desync_r1\":60.0,\"desync_r2\":60.0,\"desync_r3\":60.0,\"desync_r4\":60.0,\"desync_r51\":60.0,\"desync_r52\":60.0,\"desync_r61\":60.0,\"desync_r62\":60.0,\"desync_switch1\":true,\"desync_switch2\":false,\"desync_switch3\":false,\"desync_switch4\":false,\"desync_switch51\":true,\"desync_switch52\":false,\"desync_switch61\":false,\"desync_switch62\":false,\"flick_delay1\":3.0,\"flick_delay2\":3.0,\"flick_delay3\":3.0,\"flick_delay4\":3.0,\"flick_delay51\":3.0,\"flick_delay52\":3.0,\"flick_delay61\":3.0,\"flick_delay62\":3.0,\"flick_yaw1\":0.0,\"flick_yaw2\":0.0,\"flick_yaw3\":0.0,\"flick_yaw4\":0.0,\"flick_yaw51\":0.0,\"flick_yaw52\":0.0,\"flick_yaw61\":0.0,\"flick_yaw62\":0.0,\"frees_dis_def\":true,\"frees_disable\":[],\"frees_pitch\":2.0,\"frees_pitch_custom\":0.0,\"frees_yaw\":1.0,\"frees_yaw_onetap\":0.0,\"legitaa_custom\":0.0,\"legitaa_desync\":true,\"legitaa_freestand\":2.0,\"legitaa_mod\":[\"Jitter\"],\"legitaa_pitch\":1.0,\"legitaa_switch\":true,\"list\":3.0,\"manual_type\":1.0,\"manual_view\":1.0,\"over_cond2\":true,\"over_cond3\":true,\"over_cond4\":false,\"over_cond51\":false,\"over_cond52\":false,\"over_cond61\":true,\"over_cond62\":true,\"pitch_custom1\":0.0,\"pitch_custom2\":0.0,\"pitch_custom3\":0.0,\"pitch_custom4\":0.0,\"pitch_custom51\":0.0,\"pitch_custom52\":-65.0,\"pitch_custom61\":0.0,\"pitch_custom62\":0.0,\"pitch_deg1\":89.0,\"pitch_deg2\":0.0,\"pitch_deg3\":0.0,\"pitch_deg4\":89.0,\"pitch_deg51\":89.0,\"pitch_deg52\":0.0,\"pitch_deg61\":0.0,\"pitch_deg62\":0.0,\"predict_switch\":true,\"preset_list\":3.0,\"roll_def_deg1\":0.0,\"roll_def_deg2\":0.0,\"roll_def_deg3\":0.0,\"roll_def_deg4\":0.0,\"roll_def_deg51\":0.0,\"roll_def_deg52\":0.0,\"roll_def_deg61\":0.0,\"roll_def_deg62\":0.0,\"roll_ext_deg1\":0.0,\"roll_ext_deg2\":0.0,\"roll_ext_deg3\":0.0,\"roll_ext_deg4\":0.0,\"roll_ext_deg51\":0.0,\"roll_ext_deg52\":0.0,\"roll_ext_deg61\":0.0,\"roll_ext_deg62\":0.0,\"roll_ext_pit1\":0.0,\"roll_ext_pit2\":0.0,\"roll_ext_pit3\":0.0,\"roll_ext_pit4\":0.0,\"roll_ext_pit51\":0.0,\"roll_ext_pit52\":0.0,\"roll_ext_pit61\":0.0,\"roll_ext_pit62\":0.0,\"roll_switch1\":false,\"roll_switch2\":false,\"roll_switch3\":false,\"roll_switch4\":false,\"roll_switch51\":false,\"roll_switch52\":false,\"roll_switch61\":false,\"roll_switch62\":false,\"roll_type1\":1.0,\"roll_type2\":1.0,\"roll_type3\":1.0,\"roll_type4\":1.0,\"roll_type51\":1.0,\"roll_type52\":1.0,\"roll_type61\":1.0,\"roll_type62\":1.0,\"safe_def\":true,\"safe_switch\":true,\"xway_counter1\":3.0,\"xway_counter2\":3.0,\"xway_counter3\":3.0,\"xway_counter4\":3.0,\"xway_counter51\":3.0,\"xway_counter52\":3.0,\"xway_counter61\":3.0,\"xway_counter62\":3.0,\"xway_shuffle1\":false,\"xway_shuffle2\":false,\"xway_shuffle3\":false,\"xway_shuffle4\":false,\"xway_shuffle51\":false,\"xway_shuffle52\":false,\"xway_shuffle61\":false,\"xway_shuffle62\":false,\"xway_switch1\":false,\"xway_switch2\":false,\"xway_switch3\":false,\"xway_switch4\":false,\"xway_switch51\":false,\"xway_switch52\":false,\"xway_switch61\":false,\"xway_switch62\":false,\"xway_sync1\":false,\"xway_sync2\":false,\"xway_sync3\":false,\"xway_sync4\":false,\"xway_sync51\":false,\"xway_sync52\":false,\"xway_sync61\":false,\"xway_sync62\":false,\"xwayn_11\":0.0,\"xwayn_12\":0.0,\"xwayn_13\":0.0,\"xwayn_14\":0.0,\"xwayn_15\":0.0,\"xwayn_16\":0.0,\"xwayn_17\":0.0,\"xwayn_21\":0.0,\"xwayn_22\":0.0,\"xwayn_23\":0.0,\"xwayn_24\":0.0,\"xwayn_25\":0.0,\"xwayn_26\":0.0,\"xwayn_27\":0.0,\"xwayn_31\":0.0,\"xwayn_32\":0.0,\"xwayn_33\":0.0,\"xwayn_34\":0.0,\"xwayn_35\":0.0,\"xwayn_36\":0.0,\"xwayn_37\":0.0,\"xwayn_41\":0.0,\"xwayn_42\":0.0,\"xwayn_43\":0.0,\"xwayn_44\":0.0,\"xwayn_45\":0.0,\"xwayn_46\":0.0,\"xwayn_47\":0.0,\"xwayn_511\":0.0,\"xwayn_512\":0.0,\"xwayn_513\":0.0,\"xwayn_514\":0.0,\"xwayn_515\":0.0,\"xwayn_516\":0.0,\"xwayn_517\":0.0,\"xwayn_521\":0.0,\"xwayn_522\":0.0,\"xwayn_523\":0.0,\"xwayn_524\":0.0,\"xwayn_525\":0.0,\"xwayn_526\":0.0,\"xwayn_527\":0.0,\"xwayn_611\":0.0,\"xwayn_612\":0.0,\"xwayn_613\":0.0,\"xwayn_614\":0.0,\"xwayn_615\":0.0,\"xwayn_616\":0.0,\"xwayn_617\":0.0,\"xwayn_621\":0.0,\"xwayn_622\":0.0,\"xwayn_623\":0.0,\"xwayn_624\":0.0,\"xwayn_625\":0.0,\"xwayn_626\":0.0,\"xwayn_627\":0.0,\"yaw_deg1\":-16.0,\"yaw_deg2\":0.0,\"yaw_deg3\":0.0,\"yaw_deg4\":-80.0,\"yaw_deg51\":-40.0,\"yaw_deg52\":-59.0,\"yaw_deg61\":0.0,\"yaw_deg62\":-62.0,\"yaw_delay1\":1.0,\"yaw_delay2\":0.0,\"yaw_delay3\":0.0,\"yaw_delay4\":2.0,\"yaw_delay51\":1.0,\"yaw_delay52\":2.0,\"yaw_delay61\":0.0,\"yaw_delay62\":0.0,\"yaw_l1\":0.0,\"yaw_l2\":0.0,\"yaw_l3\":0.0,\"yaw_l4\":0.0,\"yaw_l51\":0.0,\"yaw_l52\":0.0,\"yaw_l61\":0.0,\"yaw_l62\":0.0,\"yaw_mod_combo1\":7.0,\"yaw_mod_combo2\":1.0,\"yaw_mod_combo3\":1.0,\"yaw_mod_combo4\":2.0,\"yaw_mod_combo51\":2.0,\"yaw_mod_combo52\":2.0,\"yaw_mod_combo61\":1.0,\"yaw_mod_combo62\":3.0,\"yaw_o1\":0.0,\"yaw_o2\":0.0,\"yaw_o3\":0.0,\"yaw_o4\":22.0,\"yaw_o51\":0.0,\"yaw_o52\":0.0,\"yaw_o61\":0.0,\"yaw_o62\":0.0,\"yaw_r1\":0.0,\"yaw_r2\":0.0,\"yaw_r3\":0.0,\"yaw_r4\":0.0,\"yaw_r51\":0.0,\"yaw_r52\":0.0,\"yaw_r61\":0.0,\"yaw_r62\":0.0,\"yaw_randl1\":0.0,\"yaw_randl2\":0.0,\"yaw_randl3\":0.0,\"yaw_randl4\":0.0,\"yaw_randl51\":0.0,\"yaw_randl52\":0.0,\"yaw_randl61\":0.0,\"yaw_randl62\":0.0,\"yaw_rando1\":-24.0,\"yaw_rando2\":0.0,\"yaw_rando3\":0.0,\"yaw_rando4\":-24.0,\"yaw_rando51\":0.0,\"yaw_rando52\":0.0,\"yaw_rando61\":0.0,\"yaw_rando62\":0.0,\"yaw_randr1\":0.0,\"yaw_randr2\":0.0,\"yaw_randr3\":0.0,\"yaw_randr4\":0.0,\"yaw_randr51\":0.0,\"yaw_randr52\":0.0,\"yaw_randr61\":0.0,\"yaw_randr62\":0.0,\"yaw_switch1\":true,\"yaw_switch2\":false,\"yaw_switch3\":false,\"yaw_switch4\":true,\"yaw_switch51\":true,\"yaw_switch52\":true,\"yaw_switch61\":false,\"yaw_switch62\":true}")

slot_0_46_0.ui_tables.antiaim.preset_list:set_callback(function()
	slot_0_46_0.ui_tables.antiaim.preset_list:update_active_config()
end, true)

slot_0_48_0.builder = slot_0_46_0.create_group(" Anti Aim \a{Switch} \a{Link Active}Builder", 2)

slot_0_48_0.builder:visible_condition(function()
	return slot_0_46_0.ui_tables.antiaim.list.value == 3
end)
slot_0_48_0.builder:disabled_condition(function()
	return slot_0_46_0.ui_tables.config.antiaim_owner.value ~= "" and slot_0_46_0.ui_tables.config.antiaim_owner.value ~= common.get_username()
end)
slot_0_48_0.builder:combo("unused", "condition_list", "\a{Link Active}\t\aDEFAULTCondition", {
	"Default",
	"Standing",
	"Slow Walking",
	"Moving",
	"Crouching",
	"In Air"
})

slot_0_46_0.ui_tables.unused.condition_list.table_to_copy = {
	"yaw_switch",
	"yaw_delay",
	"yaw_o",
	"yaw_l",
	"yaw_r",
	"yaw_rando",
	"yaw_randl",
	"yaw_randr",
	"yaw_mod_combo",
	"yaw_deg",
	"xway_counter",
	"xway_shuffle",
	"xway_sync",
	"xway_switch",
	"xwayn_",
	"flick_delay",
	"flick_yaw",
	"desync_switch",
	"desync_freestand",
	"desync_l",
	"desync_r",
	"desync_mod",
	"def_switch",
	"def_pitch",
	"pitch_deg",
	"pitch_custom",
	"def_yaw",
	"def_yaw_deg",
	"def_onetapspeed",
	"roll_switch",
	"roll_type",
	"roll_def_deg",
	"roll_ext_pit",
	"roll_ext_deg"
}

slot_0_46_0.ui_tables.unused.condition_list:button("copy_cond", "            ", function()
	local var_203_0 = {}
	local var_203_1 = slot_0_46_0.ui_tables.unused.condition_list.value
	local var_203_2 = slot_0_46_0.ui_tables.unused.condition_list.table_to_copy

	if var_203_1 > 4 then
		var_203_1 = var_203_1 .. slot_0_46_0.ui_tables.unused["condition_add" .. var_203_1].value
	end

	for iter_203_0 = 1, #var_203_2 do
		local var_203_3 = var_203_2[iter_203_0]

		if var_203_3 == "xwayn_" then
			for iter_203_1 = 1, 7 do
				var_203_0[var_203_3 .. iter_203_1] = slot_0_46_0.ui_tables.antiaim[var_203_3 .. var_203_1 .. iter_203_1].value_for_ref
			end
		else
			var_203_0[var_203_3] = slot_0_46_0.ui_tables.antiaim[var_203_3 .. var_203_1].value_for_ref
		end
	end

	local var_203_4 = "ext.condition = " .. slot_0_44_0.encode(json.stringify(var_203_0)) .. "<end>"

	slot_0_43_0.set_clipboard_text(var_203_4, #var_203_4)
	common.add_notify("Extension", "Condition copied")
end):tooltip("Copy to clipboard current condition settings.")
slot_0_46_0.ui_tables.unused.condition_list:button("paste_cond", "            ", function()
	local var_204_0 = slot_0_43_0.get_clipboard_text()
	local var_204_1 = string.match(var_204_0, "(ext%.condition%s=%s.-<end>)")

	if not var_204_1 or #var_204_1 == 0 then
		common.add_notify("Extension", "Condition read failed")

		return
	end

	local var_204_2, var_204_3 = var_204_1:find("ext.condition = ")

	if not var_204_3 then
		common.add_notify("Extension", "Condition read failed")

		return
	end

	local var_204_4 = var_204_1:find("<end>")

	if not var_204_4 then
		common.add_notify("Extension", "Condition read failed")

		return
	end

	local var_204_5 = var_204_1:sub(var_204_3, var_204_4 - 1)
	local var_204_6, var_204_7 = slot_0_44_0.pcall_func(var_204_5)

	if not var_204_6 then
		common.add_notify("Extension", "Condition decode failed")

		return
	end

	local var_204_8 = slot_0_46_0.ui_tables.unused.condition_list.value

	if var_204_8 > 4 then
		var_204_8 = var_204_8 .. slot_0_46_0.ui_tables.unused["condition_add" .. var_204_8].value
	end

	for iter_204_0, iter_204_1 in pairs(var_204_7) do
		local var_204_9, var_204_10 = iter_204_0:find("xwayn_")

		if var_204_10 then
			local var_204_11 = iter_204_0:sub(#iter_204_0, #iter_204_0)

			slot_0_46_0.ui_tables.antiaim[iter_204_0:sub(0, #iter_204_0 - 1) .. var_204_8 .. var_204_11].ref:set(iter_204_1)
		else
			slot_0_46_0.ui_tables.antiaim[iter_204_0 .. var_204_8].ref:set(iter_204_1)
		end
	end
end, true):tooltip("Paste condition settings from clipboard.")

function slot_0_48_0.builder.create_ui_condition(arg_205_0, arg_205_1)
	if arg_205_1 ~= 1 then
		slot_0_48_0.builder:switch("antiaim", "over_cond" .. arg_205_1, "Use Default Condition", true, function()
			return slot_0_46_0.ui_tables.unused.condition_list.value == arg_205_1
		end)
	else
		slot_0_48_0.builder:label("antiaim", "over_label" .. arg_205_1, "    ", function()
			return slot_0_46_0.ui_tables.unused.condition_list.value == arg_205_1
		end)
	end

	slot_205_2_0 = slot_0_46_0.create_group(arg_205_0, 2)

	slot_205_2_0:visible_condition(function()
		return slot_0_46_0.ui_tables.unused.condition_list.value == arg_205_1 and slot_0_46_0.ui_tables.antiaim.list.value == 3
	end)
	slot_0_46_0.ui_tables.antiaim.list:set_callback(function()
		slot_205_2_0:update()
	end)

	if arg_205_1 ~= 1 then
		slot_205_2_0:disabled_condition(function()
			return slot_0_46_0.ui_tables.antiaim["over_cond" .. arg_205_1].value or slot_0_46_0.ui_tables.config.antiaim_owner.value ~= "" and slot_0_46_0.ui_tables.config.antiaim_owner.value ~= common.get_username()
		end)
		slot_0_46_0.ui_tables.antiaim["over_cond" .. arg_205_1]:set_callback(function()
			slot_205_2_0:update()
		end)
	else
		slot_205_2_0:disabled_condition(function()
			return slot_0_46_0.ui_tables.config.antiaim_owner.value ~= "" and slot_0_46_0.ui_tables.config.antiaim_owner.value ~= common.get_username()
		end)
	end

	slot_0_46_0.ui_tables.unused.condition_list:set_callback(function()
		slot_205_2_0:update()
	end, true)

	slot_205_3_0 = slot_205_2_0:switch("antiaim", "yaw_switch" .. arg_205_1, "Yaw", false, nil, " \a{Switch}\t\aDEFAULT", " \a{Link Active}\t\aDEFAULT")

	slot_205_3_0:slider("yaw_delay" .. arg_205_1, "   \a{Link Active}\t \aDEFAULTDelay Tick", 0, 13, 0, nil, function(arg_214_0)
		if arg_214_0 == 0 then
			return "Off"
		end

		return arg_214_0 .. "t"
	end)
	slot_205_3_0:label("-", " \a{Link Active} \t\aDEFAULTAdd")
	slot_205_3_0:slider("yaw_o" .. arg_205_1, "   \a4a4a4aFF\t  \aDEFAULTShared", -180, 180, 0)
	slot_205_3_0:slider("yaw_l" .. arg_205_1, "   \a4a4a4aFF\t    \aDEFAULTLeft", -180, 180, 0)
	slot_205_3_0:slider("yaw_r" .. arg_205_1, "   \a4a4a4aFF\t    \aDEFAULTRight", -180, 180, 0)
	slot_205_3_0:label("-", " \a{Link Active}\t\aDEFAULTRandom")
	slot_205_3_0:slider("yaw_rando" .. arg_205_1, "   \a4a4a4aFF\t \aDEFAULTShared", -180, 180, 0)
	slot_205_3_0:slider("yaw_randl" .. arg_205_1, "   \a4a4a4aFF\t   \aDEFAULTLeft", -180, 180, 0)
	slot_205_3_0:slider("yaw_randr" .. arg_205_1, "   \a4a4a4aFF\t   \aDEFAULTRight", -180, 180, 0)

	slot_205_4_0 = slot_205_2_0:combo("antiaim", "yaw_mod_combo" .. arg_205_1, " \a4a4a4aFF      \aDEFAULTModifier", {
		"Disabled",
		"Center",
		"Way",
		"Random",
		"Spin",
		"Fake Flick",
		"Skitter"
	}, "Disabled", function()
		return slot_205_3_0.value
	end)

	slot_205_4_0:slider("yaw_deg" .. arg_205_1, " \a{Link Active}\t\aDEFAULTDegree", -180, 180, 0, nil, nil, function()
		return slot_205_4_0.str_value ~= "Disabled" and slot_205_4_0.str_value ~= "Fake Flick"
	end):set_disable_function(function()
		return slot_205_4_0.str_value == "Way" and slot_0_46_0.ui_tables.antiaim["xway_switch" .. arg_205_1] and slot_0_46_0.ui_tables.antiaim["xway_switch" .. arg_205_1].value
	end)
	slot_205_4_0:slider("xway_counter" .. arg_205_1, " \a{Link Active}\t\aDEFAULTWay", 3, 7, 3, nil, function(arg_218_0)
		return arg_218_0 .. "-Way"
	end, function()
		return slot_205_4_0.str_value == "Way"
	end)
	slot_205_4_0:switch("xway_shuffle" .. arg_205_1, "Shuffle", false, function()
		return slot_205_4_0.str_value == "Way"
	end, nil, " \a{Switch}\t\aDEFAULT", " \a{Link Active}\t\aDEFAULT")
	slot_205_4_0:switch("xway_sync" .. arg_205_1, "Sync Desync", false, function()
		return slot_205_4_0.str_value == "Way" or slot_205_4_0.str_value == "Skitter"
	end, nil, " \a{Switch}\t\aDEFAULT", " \a{Link Active}\t\aDEFAULT")
	slot_205_4_0:switch("xway_switch" .. arg_205_1, "Custom", false, function()
		return slot_205_4_0.str_value == "Way"
	end, nil, " \a{Switch}\t\aDEFAULT", " \a{Link Active}\t\aDEFAULT")

	for iter_205_0 = 1, 7 do
		slot_205_4_0:slider("xwayn_" .. arg_205_1 .. iter_205_0, "\a4a4a4aFF\t\a{Link Active}" .. iter_205_0 .. "\t\a4a4a4aFF\t\aDEFAULT", -180, 180, 0, nil, nil, function()
			return slot_0_46_0.ui_tables.antiaim["xway_switch" .. arg_205_1].value and slot_205_4_0.str_value == "Way" and slot_0_46_0.ui_tables.antiaim["xway_counter" .. arg_205_1].value >= iter_205_0
		end)
	end

	slot_205_4_0:slider("flick_delay" .. arg_205_1, " \a{Link Active}\t\aDEFAULTDelay", 1, 10, 3, 0.1, function(arg_224_0)
		return arg_224_0 / 10 .. "s"
	end, function()
		return slot_205_4_0.str_value == "Fake Flick"
	end)
	slot_205_4_0:slider("flick_yaw" .. arg_205_1, " \a{Link Active}\t\aDEFAULTYaw", -180, 180, 0, nil, nil, function()
		return slot_205_4_0.str_value == "Fake Flick"
	end)

	slot_205_5_0 = slot_205_2_0:switch("antiaim", "desync_switch" .. arg_205_1, "Desync", false, nil, "  \a{Switch}\t  \aDEFAULT", "  \a{Link Active}\t  \aDEFAULT")

	slot_205_5_0:combo("desync_freestand" .. arg_205_1, "\a{Link Active} \t\aDEFAULTFreestand", {
		"Disabled",
		"Peek Fake",
		"Peek Real"
	}, "Disabled")
	slot_205_5_0:label("-", "\a{Link Active} \t\aDEFAULTLimits")
	slot_205_5_0:slider("desync_l" .. arg_205_1, "  \a4a4a4aFF\t  \aDEFAULTLeft", 0, 60, 60)
	slot_205_5_0:slider("desync_r" .. arg_205_1, "  \a4a4a4aFF\t  \aDEFAULTRight", 0, 60, 60)
	slot_205_2_0:selectable("antiaim", "desync_mod" .. arg_205_1, " \a4a4a4aFF      \aDEFAULTModifier", {
		"Jitter",
		"Randomize Jitter"
	}, "", function()
		return slot_205_5_0.value
	end)

	slot_205_6_0 = slot_205_2_0:switch("antiaim", "def_switch" .. arg_205_1, "Defensive AA", false, nil, " \a{Switch}\t  \aDEFAULT", " \a{Link Active}\t  \aDEFAULT")

	slot_205_6_0:combo("def_pitch" .. arg_205_1, "\a4a4a4aFF\t\aDEFAULTPitch", {
		"Disabled",
		"Down",
		"Up",
		"Random",
		"Sway",
		"Custom"
	}, "Disabled")
	slot_205_6_0:slider("pitch_deg" .. arg_205_1, " \a{Link Active}\t\aDEFAULTDegree", 0, 89, 0, nil, nil, function()
		return slot_0_46_0.ui_tables.antiaim["def_pitch" .. arg_205_1].value == 4
	end)
	slot_205_6_0:slider("pitch_custom" .. arg_205_1, " \a{Link Active}\t\aDEFAULTDegree ", -89, 89, 0, nil, nil, function()
		return slot_0_46_0.ui_tables.antiaim["def_pitch" .. arg_205_1].value == 6
	end)
	slot_205_6_0:combo("def_yaw" .. arg_205_1, "\a4a4a4aFF\t\aDEFAULTYaw", {
		"Default",
		"Sideways",
		"Extension",
		"Random",
		"Spin",
		"Custom"
	}, "Disabled")
	slot_205_6_0:slider("def_yaw_deg" .. arg_205_1, " \a{Link Active}\t\aDEFAULTDegree", -180, 180, 0, nil, nil, function()
		return slot_0_46_0.ui_tables.antiaim["def_yaw" .. arg_205_1].value >= 4
	end)
	slot_205_6_0:slider("def_onetapspeed" .. arg_205_1, " \a{Link Active}\t\aDEFAULTSpeed", 0, 20, 10, nil, nil, function()
		return slot_0_46_0.ui_tables.antiaim["def_yaw" .. arg_205_1].value == 3
	end)

	slot_205_7_0 = slot_205_2_0:switch("antiaim", "roll_switch" .. arg_205_1, "Roll", false, nil, " \a{Switch}\t   \aDEFAULT", " \a{Link Active}\t   \aDEFAULT")
	slot_205_8_0 = slot_205_7_0:combo("roll_type" .. arg_205_1, " \a{Link Active} \t\aDEFAULTType", {
		"Default",
		"Pitch Extended"
	}, "Default")

	slot_205_7_0:slider("roll_def_deg" .. arg_205_1, "   \a4a4a4aFF\t  \aDEFAULTDegree", -180, 180, 0, nil, nil, function()
		return slot_205_8_0.value == 1
	end)
	slot_205_7_0:slider("roll_ext_pit" .. arg_205_1, "   \a4a4a4aFF\t  \aDEFAULTPitch", -180, 180, 0, nil, nil, function()
		return slot_205_8_0.value == 2
	end)
	slot_205_7_0:slider("roll_ext_deg" .. arg_205_1, "   \a4a4a4aFF\t  \aDEFAULTDegree", -180, 180, 0, nil, nil, function()
		return slot_205_8_0.value == 2
	end)
end

function slot_0_48_0.builder.create_additional_ui_condition(arg_235_0, arg_235_1, arg_235_2)
	slot_0_48_0.builder:switch("antiaim", "over_cond" .. arg_235_1 .. arg_235_2, "Use Default Condition", true, function()
		return slot_0_46_0.ui_tables.unused.condition_list.value == arg_235_1 and slot_0_46_0.ui_tables.unused["condition_add" .. arg_235_1].value == arg_235_2
	end)

	if arg_235_1 == 1 then
		slot_0_46_0.ui_tables.antiaim["over_cond" .. arg_235_1 .. arg_235_2]:set_callback(function()
			slot_0_46_0.ui_tables.antiaim["over_cond" .. arg_235_1 .. arg_235_2]:disabled(true)
		end, true)
	end

	slot_235_3_0 = slot_0_46_0.create_group(arg_235_0, 2)

	slot_235_3_0:visible_condition(function()
		return slot_0_46_0.ui_tables.antiaim.list.value == 3 and slot_0_46_0.ui_tables.unused.condition_list.value == arg_235_1 and slot_0_46_0.ui_tables.unused["condition_add" .. arg_235_1].value == arg_235_2
	end)
	slot_235_3_0:disabled_condition(function()
		return slot_0_46_0.ui_tables.config.antiaim_owner.value ~= "" and slot_0_46_0.ui_tables.config.antiaim_owner.value ~= common.get_username()
	end)
	slot_0_46_0.ui_tables.antiaim.list:set_callback(function()
		slot_235_3_0:update()
	end)
	slot_0_46_0.ui_tables.unused["condition_add" .. arg_235_1]:set_callback(function()
		slot_235_3_0:update()
	end)

	if arg_235_1 ~= 1 then
		slot_235_3_0:disabled_condition(function()
			return slot_0_46_0.ui_tables.antiaim["over_cond" .. arg_235_1 .. arg_235_2].value or slot_0_46_0.ui_tables.config.antiaim_owner.value ~= "" and slot_0_46_0.ui_tables.config.antiaim_owner.value ~= common.get_username()
		end)
		slot_0_46_0.ui_tables.antiaim["over_cond" .. arg_235_1 .. arg_235_2]:set_callback(function()
			slot_235_3_0:update()
		end)
	end

	slot_0_46_0.ui_tables.unused.condition_list:set_callback(function()
		slot_235_3_0:update()
	end, true)

	slot_235_4_0 = slot_235_3_0:switch("antiaim", "yaw_switch" .. arg_235_1 .. arg_235_2, "Yaw", false, nil, " \a{Switch}\t\aDEFAULT", " \a{Link Active}\t\aDEFAULT")

	slot_235_4_0:slider("yaw_delay" .. arg_235_1 .. arg_235_2, "   \a{Link Active}\t \aDEFAULTDelay Tick", 0, 13, 0, nil, function(arg_245_0)
		if arg_245_0 == 0 then
			return "Off"
		end

		return arg_245_0 .. "t"
	end)
	slot_235_4_0:label("-", " \a{Link Active} \t\aDEFAULTAdd")
	slot_235_4_0:slider("yaw_o" .. arg_235_1 .. arg_235_2, "   \a4a4a4aFF\t  \aDEFAULTShared", -180, 180, 0)
	slot_235_4_0:slider("yaw_l" .. arg_235_1 .. arg_235_2, "   \a4a4a4aFF\t    \aDEFAULTLeft", -180, 180, 0)
	slot_235_4_0:slider("yaw_r" .. arg_235_1 .. arg_235_2, "   \a4a4a4aFF\t    \aDEFAULTRight", -180, 180, 0)
	slot_235_4_0:label("-", " \a{Link Active}\t\aDEFAULTRandom")
	slot_235_4_0:slider("yaw_rando" .. arg_235_1 .. arg_235_2, "   \a4a4a4aFF\t \aDEFAULTShared", -180, 180, 0)
	slot_235_4_0:slider("yaw_randl" .. arg_235_1 .. arg_235_2, "   \a4a4a4aFF\t   \aDEFAULTLeft", -180, 180, 0)
	slot_235_4_0:slider("yaw_randr" .. arg_235_1 .. arg_235_2, "   \a4a4a4aFF\t   \aDEFAULTRight", -180, 180, 0)

	slot_235_5_0 = slot_235_3_0:combo("antiaim", "yaw_mod_combo" .. arg_235_1 .. arg_235_2, " \a4a4a4aFF      \aDEFAULTModifier", {
		"Disabled",
		"Center",
		"Way",
		"Random",
		"Spin",
		"Fake Flick"
	}, "Disabled", function()
		return slot_235_4_0.value
	end)

	slot_235_5_0:slider("yaw_deg" .. arg_235_1 .. arg_235_2, " \a{Link Active}\t\aDEFAULTDegree", -180, 180, 0, nil, nil, function()
		return slot_235_5_0.str_value ~= "Disabled" and slot_235_5_0.str_value ~= "Fake Flick"
	end):set_disable_function(function()
		return slot_235_5_0.str_value == "Way" and slot_0_46_0.ui_tables.antiaim["xway_switch" .. arg_235_1 .. arg_235_2] and slot_0_46_0.ui_tables.antiaim["xway_switch" .. arg_235_1 .. arg_235_2].value
	end)
	slot_235_5_0:slider("xway_counter" .. arg_235_1 .. arg_235_2, " \a{Link Active}\t\aDEFAULTWay", 3, 7, 3, nil, function(arg_249_0)
		return arg_249_0 .. "-Way"
	end, function()
		return slot_235_5_0.str_value == "Way"
	end)
	slot_235_5_0:switch("xway_shuffle" .. arg_235_1 .. arg_235_2, "Shuffle", false, function()
		return slot_235_5_0.str_value == "Way"
	end, nil, " \a{Switch}\t\aDEFAULT", " \a{Link Active}\t\aDEFAULT")
	slot_235_5_0:switch("xway_sync" .. arg_235_1 .. arg_235_2, "Sync Desync", false, function()
		return slot_235_5_0.str_value == "Way" or slot_235_5_0.str_value == "Skitter"
	end, nil, " \a{Switch}\t\aDEFAULT", " \a{Link Active}\t\aDEFAULT")
	slot_235_5_0:switch("xway_switch" .. arg_235_1 .. arg_235_2, "Custom", false, function()
		return slot_235_5_0.str_value == "Way"
	end, nil, " \a{Switch}\t\aDEFAULT", " \a{Link Active}\t\aDEFAULT")

	for iter_235_0 = 1, 7 do
		slot_235_5_0:slider("xwayn_" .. arg_235_1 .. arg_235_2 .. iter_235_0, "\a4a4a4aFF\t\a{Link Active}" .. iter_235_0 .. "\t\a4a4a4aFF\t\aDEFAULT", -180, 180, 0, nil, nil, function()
			return slot_0_46_0.ui_tables.antiaim["xway_switch" .. arg_235_1 .. arg_235_2].value and slot_235_5_0.str_value == "Way" and slot_0_46_0.ui_tables.antiaim["xway_counter" .. arg_235_1 .. arg_235_2].value >= iter_235_0
		end)
	end

	slot_235_5_0:slider("flick_delay" .. arg_235_1 .. arg_235_2, " \a{Link Active}\t\aDEFAULTDelay", 1, 10, 3, 0.1, function(arg_255_0)
		return arg_255_0 / 10 .. "s"
	end, function()
		return slot_235_5_0.str_value == "Fake Flick"
	end)
	slot_235_5_0:slider("flick_yaw" .. arg_235_1 .. arg_235_2, " \a{Link Active}\t\aDEFAULTYaw", -180, 180, 0, nil, nil, function()
		return slot_235_5_0.str_value == "Fake Flick"
	end)

	slot_235_6_0 = slot_235_3_0:switch("antiaim", "desync_switch" .. arg_235_1 .. arg_235_2, "Desync", false, nil, "  \a{Switch}\t  \aDEFAULT", "  \a{Link Active}\t  \aDEFAULT")

	slot_235_6_0:combo("desync_freestand" .. arg_235_1 .. arg_235_2, "\a{Link Active} \t\aDEFAULTFreestand", {
		"Disabled",
		"Peek Fake",
		"Peek Real"
	}, "Disabled")
	slot_235_6_0:label("-", "\a{Link Active} \t\aDEFAULTLimits")
	slot_235_6_0:slider("desync_l" .. arg_235_1 .. arg_235_2, "  \a4a4a4aFF\t  \aDEFAULTLeft", 0, 60, 60)
	slot_235_6_0:slider("desync_r" .. arg_235_1 .. arg_235_2, "  \a4a4a4aFF\t  \aDEFAULTRight", 0, 60, 60)
	slot_235_3_0:selectable("antiaim", "desync_mod" .. arg_235_1 .. arg_235_2, " \a4a4a4aFF      \aDEFAULTModifier", {
		"Jitter",
		"Randomize Jitter"
	}, "", function()
		return slot_235_6_0.value
	end)

	slot_235_7_0 = slot_235_3_0:switch("antiaim", "def_switch" .. arg_235_1 .. arg_235_2, "Defensive AA", false, nil, " \a{Switch}\t  \aDEFAULT", " \a{Link Active}\t  \aDEFAULT")

	slot_235_7_0:combo("def_pitch" .. arg_235_1 .. arg_235_2, "\a4a4a4aFF\t\aDEFAULTPitch", {
		"Disabled",
		"Down",
		"Up",
		"Random",
		"Sway",
		"Custom"
	}, "Disabled")
	slot_235_7_0:slider("pitch_deg" .. arg_235_1 .. arg_235_2, " \a{Link Active}\t\aDEFAULTDegree ", 0, 89, 0, nil, nil, function()
		return slot_0_46_0.ui_tables.antiaim["def_pitch" .. arg_235_1 .. arg_235_2].value == 4
	end)
	slot_235_7_0:slider("pitch_custom" .. arg_235_1 .. arg_235_2, " \a{Link Active}\t\aDEFAULTDegree", -89, 89, 0, nil, nil, function()
		return slot_0_46_0.ui_tables.antiaim["def_pitch" .. arg_235_1 .. arg_235_2].value == 6
	end)
	slot_235_7_0:combo("def_yaw" .. arg_235_1 .. arg_235_2, "\a4a4a4aFF\t\aDEFAULTYaw", {
		"Default",
		"Sideways",
		"Extension",
		"Random",
		"Custom"
	}, "Disabled")
	slot_235_7_0:slider("def_yaw_deg" .. arg_235_1 .. arg_235_2, " \a{Link Active}\t\aDEFAULTDegree", -180, 180, 0, nil, nil, function()
		return slot_0_46_0.ui_tables.antiaim["def_yaw" .. arg_235_1 .. arg_235_2].value >= 4
	end)
	slot_235_7_0:slider("def_onetapspeed" .. arg_235_1 .. arg_235_2, " \a{Link Active}\t\aDEFAULTSpeed", 0, 20, 10, nil, nil, function()
		return slot_0_46_0.ui_tables.antiaim["def_yaw" .. arg_235_1 .. arg_235_2].value == 3
	end)

	slot_235_8_0 = slot_235_3_0:switch("antiaim", "roll_switch" .. arg_235_1 .. arg_235_2, "Roll", false, nil, " \a{Switch}\t   \aDEFAULT", " \a{Link Active}\t   \aDEFAULT")
	slot_235_9_0 = slot_235_8_0:combo("roll_type" .. arg_235_1 .. arg_235_2, " \a{Link Active} \t\aDEFAULTType", {
		"Default",
		"Pitch Extended"
	}, "Default")

	slot_235_8_0:slider("roll_def_deg" .. arg_235_1 .. arg_235_2, "   \a4a4a4aFF\t  \aDEFAULTDegree", -180, 180, 0, nil, nil, function()
		return slot_235_9_0.value == 1
	end)
	slot_235_8_0:slider("roll_ext_pit" .. arg_235_1 .. arg_235_2, "   \a4a4a4aFF\t  \aDEFAULTPitch", -180, 180, 0, nil, nil, function()
		return slot_235_9_0.value == 2
	end)
	slot_235_8_0:slider("roll_ext_deg" .. arg_235_1 .. arg_235_2, "   \a4a4a4aFF\t  \aDEFAULTDegree", -180, 180, 0, nil, nil, function()
		return slot_235_9_0.value == 2
	end)
end

for iter_0_2 = 1, #slot_0_46_0.ui_tables.unused.condition_list.elements_array do
	slot_0_53_2 = slot_0_46_0.ui_tables.unused.condition_list.elements_array[iter_0_2]

	slot_0_48_0.builder:label("unused", "empty", "", function()
		return slot_0_46_0.ui_tables.unused.condition_list.value == iter_0_2 and slot_0_53_2 ~= "Crouching" and slot_0_53_2 ~= "In Air"
	end)

	if slot_0_53_2 == "Crouching" then
		slot_0_48_0.builder:combo("unused", "condition_add" .. iter_0_2, "\a4a4a4aFF      \aDEFAULTAdditional", {
			"Default",
			"Sneaking"
		}, "Default", function()
			return slot_0_46_0.ui_tables.unused.condition_list.str_value == "Crouching"
		end)
	end

	if slot_0_53_2 == "In Air" then
		slot_0_48_0.builder:combo("unused", "condition_add" .. iter_0_2, "\a4a4a4aFF      \aDEFAULTAdditional", {
			"Default",
			"Crouching"
		}, "Default", function()
			return slot_0_46_0.ui_tables.unused.condition_list.str_value == "In Air"
		end)
	end

	if iter_0_2 <= 4 then
		slot_0_48_0.builder.create_ui_condition(" Builder \a{Switch} \a{Link Active}" .. slot_0_53_2, iter_0_2)
	else
		slot_0_54_1 = {
			Crouching = {
				"Default",
				"Sneaking"
			},
			["In Air"] = {
				"Default",
				"Crouching"
			}
		}

		for iter_0_3 = 1, 2 do
			slot_0_48_0.builder.create_additional_ui_condition(" Builder \a{Switch}\aDEFAULT " .. slot_0_53_2 .. "\a{Switch}  \a{Link Active}" .. slot_0_54_1[slot_0_53_2][iter_0_3], iter_0_2, iter_0_3)
		end
	end
end

slot_0_48_0.additional = slot_0_46_0.create_group(" Anti Aim \a{Switch} \a{Link Active}Extra", 1)

slot_0_48_0.additional:disabled_condition(function()
	return slot_0_46_0.ui_tables.antiaim.list.value == 1
end)
slot_0_48_0.additional:label("antiaim", "base_label", "\a{Link Active}\t\aDEFAULTBase Settings")
slot_0_46_0.ui_tables.antiaim.base_label:combo("base_pitch", "\a{Link Active}   \aDEFAULTPitch", {
	"Down",
	"Disabled",
	"Fake Down",
	"Fake Up"
}, "Down")
slot_0_46_0.ui_tables.antiaim.base_label:combo("base_yaw", "Yaw Base", {
	"At Target",
	"Local View"
}, "At Target")
slot_0_46_0.ui_tables.antiaim.base_label:switch("base_compensate", "Disabled", false, nil, nil, "\a{Switch} \t  \aDEFAULT", "\a{Link Active} \t  \aDEFAULT"):set_disable_function(function()
	return true
end)
slot_0_46_0.ui_tables.antiaim.base_label:switch("predict_switch", "Predictive At Target", false, nil, nil, " \a{Switch}\t  \aDEFAULT", " \a{Link Active}\t  \aDEFAULT")
slot_0_48_0.additional:label("antiaim", "manual_label", "\a{Link Active}\t \aDEFAULTManual Base")
slot_0_46_0.ui_tables.antiaim.manual_label:combo("manual_type", "Type", {
	"Toggle",
	"Hold"
})
slot_0_46_0.ui_tables.antiaim.manual_label:combo("manual_view", "Yaw Base", {
	"Local View",
	"At Target"
})
slot_0_46_0.ui_tables.antiaim.manual_label:label("-", "\a{Link Active} \t\aDEFAULTKeybinds")
slot_0_46_0.ui_tables.antiaim.manual_label:hotkey("back_key", " \a4a4a4aFF \t  \aDEFAULTBackward", 0, 1)
slot_0_46_0.ui_tables.antiaim.manual_label:hotkey("left_key", " \a4a4a4aFF \t  \aDEFAULTLeft", 0, 1)
slot_0_46_0.ui_tables.antiaim.manual_label:hotkey("right_key", " \a4a4a4aFF \t  \aDEFAULTRight", 0, 1)
slot_0_46_0.ui_tables.antiaim.manual_label:hotkey("forward_key", " \a4a4a4aFF \t  \aDEFAULTForward", 0, 1)
slot_0_48_0.additional:label("antiaim", "frees_label", "\a{Link Active}\t \aDEFAULTFreestanding Options")
slot_0_46_0.ui_tables.antiaim.frees_label:selectable("frees_disable", "\a{Link Active}\t \aDEFAULTDisablers", {
	"Standing",
	"Moving",
	"Slow Walking",
	"Crouching",
	"In Air"
}, "")
slot_0_46_0.ui_tables.antiaim.frees_label:switch("frees_dis_def", "Disable Defensive AA", true, nil, nil, "\a{Switch}\t\aDEFAULT", "\a{Link Active}\t\aDEFAULT")
slot_0_46_0.ui_tables.antiaim.frees_label:combo("frees_pitch", "  \a4a4a4aFF\t  \aDEFAULTPitch", {
	"Disabled",
	"Down",
	"Up",
	"Sway",
	"Random",
	"Custom"
}, "Disabled"):set_disable_function(function()
	return slot_0_46_0.ui_tables.antiaim.frees_dis_def.value
end)
slot_0_46_0.ui_tables.antiaim.frees_label:slider("frees_pitch_custom", " \a{Link Active}\t\aDEFAULTCustom", -89, 89, 0, nil, nil, function()
	if slot_0_46_0.ui_tables.antiaim.frees_pitch_custom then
		slot_0_46_0.ui_tables.antiaim.frees_pitch_custom:visible(true)
	end

	return slot_0_46_0.ui_tables.antiaim.frees_pitch.str_value == "Custom"
end):set_disable_function(function()
	return slot_0_46_0.ui_tables.antiaim.frees_dis_def.value
end)
slot_0_46_0.ui_tables.antiaim.frees_label:combo("frees_yaw", "  \a4a4a4aFF\t  \aDEFAULTYaw", {
	"Reversed",
	"Default",
	"Sideways",
	"Extension",
	"Random"
}, "Reversed"):set_disable_function(function()
	return slot_0_46_0.ui_tables.antiaim.frees_dis_def.value
end)
slot_0_46_0.ui_tables.antiaim.frees_label:slider("frees_yaw_onetap", " \a{Link Active}\t\aDEFAULTSpeed", 0, 20, 0, nil, nil, function()
	if slot_0_46_0.ui_tables.antiaim.frees_yaw_onetap then
		slot_0_46_0.ui_tables.antiaim.frees_yaw_onetap:visible(true)
	end

	return slot_0_46_0.ui_tables.antiaim.frees_yaw.str_value == "Extension"
end):set_disable_function(function()
	return slot_0_46_0.ui_tables.antiaim.frees_dis_def.value
end)
slot_0_48_0.additional:label("antiaim", "breaklc_label", "\a{Link Active}\t \aDEFAULTBreak LC")
slot_0_46_0.ui_tables.antiaim.breaklc_label:selectable("breaklc_always", "\a{Link Active}\t\aDEFAULTAlways On", {
	"Standing",
	"Moving",
	"Slow Walking",
	"Crouching",
	"In Air",
	"Safe Head"
})
slot_0_46_0.ui_tables.antiaim.breaklc_label:selectable("breaklc_ping", "\a{Link Active}\t\aDEFAULTPing Based", {
	"Standing",
	"Moving",
	"Slow Walking",
	"Crouching",
	"In Air"
})
slot_0_46_0.ui_tables.antiaim.breaklc_label:selectable("breaklc_extra", "\a{Link Active}\t\aDEFAULTExtra", {
	"Condition Change",
	"Weapon Change",
	"Reloading"
})
slot_0_48_0.additional:switch("antiaim", "legitaa_switch", "Legit AA", false, nil, "\a{Switch} \t\aDEFAULT  ", "\a{Link Active} \t\aDEFAULT  ")
slot_0_46_0.ui_tables.antiaim.legitaa_switch:combo("legitaa_pitch", "\a{Link Active}       \aDEFAULTPitch", {
	"Camera Based",
	"Locked",
	"Custom"
}, "Camera Based")
slot_0_46_0.ui_tables.antiaim.legitaa_switch:slider("legitaa_custom", "\a{Link Active} \t  \aDEFAULTCustom", -89, 89, 0, nil, nil, function()
	if slot_0_46_0.ui_tables.antiaim.legitaa_custom then
		slot_0_46_0.ui_tables.antiaim.legitaa_custom:visible(true)
	end

	return slot_0_46_0.ui_tables.antiaim.legitaa_pitch.str_value == "Custom"
end)
slot_0_46_0.ui_tables.antiaim.legitaa_switch:switch("legitaa_desync", "Desync", false, nil, nil, "  \a{Switch}\t   \aDEFAULT", "  \a{Link Active}\t   \aDEFAULT")
slot_0_46_0.ui_tables.antiaim.legitaa_switch:combo("legitaa_freestand", " \a4a4a4aFF  \t\aDEFAULTFreestand", {
	"Disabled",
	"Peek Fake",
	"Peek Real"
}, "Disabled", function()
	if slot_0_46_0.ui_tables.antiaim.legitaa_freestand then
		slot_0_46_0.ui_tables.antiaim.legitaa_freestand:visible(true)
	end

	return slot_0_46_0.ui_tables.antiaim.legitaa_desync.value
end)
slot_0_46_0.ui_tables.antiaim.legitaa_switch:selectable("legitaa_mod", " \a4a4a4aFF  \t\aDEFAULTModifier", {
	"Jitter",
	"Randomize Jitter"
}, "", function()
	if slot_0_46_0.ui_tables.antiaim.legitaa_mod then
		slot_0_46_0.ui_tables.antiaim.legitaa_mod:visible(true)
	end

	return slot_0_46_0.ui_tables.antiaim.legitaa_desync.value
end)
slot_0_48_0.additional:switch("antiaim", "safe_switch", "Safe Head", false, nil, "\a{Switch}\t\aDEFAULT", "\a{Link Active}\t\aDEFAULT")
slot_0_46_0.ui_tables.antiaim.safe_switch:switch("safe_def", "Disable Defensive AA", false, nil, nil, "\a{Switch}\t\aDEFAULT", "\a{Link Active}\t\aDEFAULT")
slot_0_46_0.ui_tables.antiaim.list.update_active_tab()

slot_0_46_0.active_tab = "\a{Link Active}\aDEFAULT Other"
slot_0_49_0 = {
	navigation = slot_0_46_0.create_group("Other", 1)
}

slot_0_49_0.navigation:list("navigation", "list", "", {
	"Ragebot",
	"Visuals",
	"Misc"
})

function slot_0_46_0.ui_tables.navigation.list.update_active_tab()
	local var_280_0 = slot_0_46_0.ui_tables.navigation.list
	local var_280_1 = {}
	local var_280_2 = {
		"",
		"",
		""
	}

	for iter_280_0 = 1, #var_280_0.elements_array do
		var_280_1[#var_280_1 + 1] = var_280_0.value == iter_280_0 and "\a{Link Active}" .. var_280_2[iter_280_0] .. "   \aDEFAULT" .. var_280_0.elements_array[iter_280_0] or "\a{Switch}" .. var_280_2[iter_280_0] .. "   \a4a4a4aFF" .. var_280_0.elements_array[iter_280_0]
	end

	var_280_0.ref:update(var_280_1)
end

slot_0_46_0.ui_tables.navigation.list:set_callback(function()
	slot_0_46_0.ui_tables.navigation.list.update_active_tab()

	if slot_0_49_0.ragebot then
		slot_0_49_0.ragebot:update()
	end

	if slot_0_49_0.ragebot_hitchance then
		slot_0_49_0.ragebot_hitchance:update()
	end

	if slot_0_49_0.visuals_main_settings then
		slot_0_49_0.visuals_main_settings:update()
	end

	if slot_0_49_0.visuals_localplayer then
		slot_0_49_0.visuals_localplayer:update()
	end

	if slot_0_49_0.visuals_indicators then
		slot_0_49_0.visuals_indicators:update()
	end

	if slot_0_49_0.visuals_extra then
		slot_0_49_0.visuals_extra:update()
	end

	if slot_0_49_0.visuals_world then
		slot_0_49_0.visuals_world:update()
	end

	if slot_0_49_0.misc then
		slot_0_49_0.misc:update()
	end
end, true)

slot_0_49_0.ragebot = slot_0_46_0.create_group(" Other \a{Switch} \a{Link Active}Ragebot", 2)

slot_0_49_0.ragebot:visible_condition(function()
	return slot_0_46_0.ui_tables.navigation.list.value == 1
end)
slot_0_49_0.ragebot:switch("ragebot", "dormant_switch", "Dormant Aimbot", false, nil, "\a{Switch} \t\aDEFAULT", "\a{Link Active} \t\aDEFAULT")
slot_0_46_0.ui_tables.ragebot.dormant_switch:switch("dormant_dmgswitch", "\a{Link Active} \t \aDEFAULTDamage from Ragebot", true)
slot_0_46_0.ui_tables.ragebot.dormant_switch:slider("dormant_dmg", "\a{Link Active} \t\aDEFAULTDamage", 1, 100, 5):set_disable_function(function()
	return slot_0_46_0.ui_tables.ragebot.dormant_dmgswitch.value
end)
slot_0_49_0.ragebot:switch("ragebot", "aipeek_switch", "AI Peek", false, nil, "\a{Switch} \t\aDEFAULT", "\a{Link Active} \t\aDEFAULT")
slot_0_46_0.ui_tables.ragebot.aipeek_switch:label("ai_peek_label", "Recommended to Use with Min. Damage", nil, nil, true)
slot_0_46_0.ui_tables.ragebot.aipeek_switch:slider("aipeek_dist", "Peek Distance", 0, 100, 30, nil, nil, nil, true)
slot_0_46_0.ui_tables.ragebot.aipeek_switch:slider("aipeek_delay", "Peek Delay", 0, 5, 1, nil, function(arg_284_0)
	return arg_284_0 .. "t"
end, nil, true)
slot_0_46_0.ui_tables.ragebot.aipeek_switch:switch("aipeek_keys", "Disable if Move. Keys Pressed", true, nil, true)
slot_0_46_0.ui_tables.ragebot.aipeek_switch:switch("aipeek_dt", "Waiting for DT Charge", true, nil, true)
slot_0_46_0.ui_tables.ragebot.aipeek_switch:switch("aipeek_vis", "Visualize", false, nil, true)
slot_0_49_0.ragebot:switch("ragebot", "discharge_switch", "Auto Discharge", false, nil, "\a{Switch} \t\aDEFAULT", "\a{Link Active} \t\aDEFAULT")
slot_0_46_0.ui_tables.ragebot.discharge_switch:selectable("discharge_combo", "\a{Link Active} \t\aDEFAULTWeapons", {
	"SSG-08",
	"AWP",
	"AutoSnipers",
	"Shotguns",
	"SMGs",
	"R8 Revolver",
	"Desert Eagle",
	"Pistols",
	"Knife",
	"Zeus"
})
slot_0_46_0.ui_tables.ragebot.discharge_switch:combo("discharge_mode", "\a{Link Active}\t\aDEFAULTMode", {
	"Default",
	"Fast Fall",
	"After LC"
})
slot_0_46_0.ui_tables.ragebot.discharge_switch:slider("discharge_delay", "\a{Link Active}       \aDEFAULTDelay", 3, 11, 0, 0.1, function(arg_285_0)
	if arg_285_0 == 11 then
		return "-"
	end

	return arg_285_0 / 10 .. "s"
end):set_disable_function(function()
	return #slot_0_46_0.ui_tables.ragebot.discharge_combo.value == 0
end)
slot_0_49_0.ragebot:switch("ragebot", "air_exploit", "Air Break LC Exploit", false, nil, "\a{Switch} \t\aDEFAULT", "\a{Link Active} \t\aDEFAULT")
slot_0_49_0.ragebot:switch("ragebot", "airstop_switch", "Airstop", false, nil, "\a{Switch}  \t\aDEFAULT", "\a{Link Active}  \t\aDEFAULT")
slot_0_46_0.ui_tables.ragebot.airstop_switch:listable("airstop_cond", "Conditions", {
	"Press Shift",
	"Enemy Close"
})
slot_0_49_0.ragebot:switch("ragebot", "grenade_switch", "Grenade Release", false, nil, "\a{Switch}  \t\aDEFAULT", "\a{Link Active}  \t\aDEFAULT")
slot_0_46_0.ui_tables.ragebot.grenade_switch:slider("grenade_damage", "Damage", 1, 100, 100, nil, function(arg_287_0)
	return arg_287_0 .. "%"
end)
slot_0_49_0.ragebot:switch("ragebot", "toss_switch", "Disabled", false, nil, "\a{Switch} \t\aDEFAULT", "\a{Link Active} \t\aDEFAULT"):disabled(true)
slot_0_49_0.ragebot:switch("ragebot", "roll_resolver", "Roll Resolver", false, nil, "\a{Switch}      \aDEFAULT", "\a{Link Active}      \aDEFAULT")
slot_0_46_0.ui_tables.ragebot.roll_resolver:label("roll_label", "\aff3636FF\aDEFAULT Don't use if you don't know what you are doing")
slot_0_46_0.ui_tables.ragebot.roll_resolver:slider("roll_deg", "\a{Link Active}\t\aDEFAULTDegree", -100, 100, 50)
slot_0_46_0.ui_tables.ragebot.roll_resolver:switch("roll_pitch_switch", "Override Pitch", false, nil, nil, "\a{Switch}   \aDEFAULT", "\a{Link Active}   \aDEFAULT")
slot_0_46_0.ui_tables.ragebot.roll_resolver:slider("roll_pitch_deg", "\a{Link Active}\t\aDEFAULTDegree", 0, 180, 89, nil, nil, function()
	return slot_0_46_0.ui_tables.ragebot.roll_pitch_switch.value
end)
slot_0_49_0.ragebot:switch("ragebot", "antidef_switch", "Anti Defensive", false, nil, "\a{Switch} \t\aDEFAULT", "\a{Link Active} \t\aDEFAULT")

slot_0_49_0.ragebot_hitchance = slot_0_46_0.create_group(" Other \a{Switch}\aDEFAULT Ragebot\a{Switch}  \a{Link Active}Hitchance", 1)

slot_0_49_0.ragebot_hitchance:visible_condition(function()
	return slot_0_46_0.ui_tables.navigation.list.value == 1
end)
slot_0_49_0.ragebot_hitchance:list("unused", "hitchance_list", "", {
	"Scout",
	"AWP",
	"Auto",
	"Revolver",
	"Desert Eagle",
	"Shotguns",
	"SMG"
})

for iter_0_4 = 1, #slot_0_46_0.ui_tables.unused.hitchance_list.elements_array do
	if iter_0_4 == 1 then
		slot_0_49_0.ragebot_hitchance:switch("ragebot", "jumpscout", "Jumpscout", false, function()
			return slot_0_46_0.ui_tables.unused.hitchance_list.value == iter_0_4
		end, "\a{Switch}      \aDEFAULT", "\a{Link Active}      \aDEFAULT")
	end

	slot_0_49_0.ragebot_hitchance:slider("ragebot", "air_" .. iter_0_4, "\a{Link Active}   \t \aDEFAULTIn Air          ", -1, 100, -1, nil, function(arg_291_0)
		if arg_291_0 < 0 then
			return "Off"
		end

		if arg_291_0 == 0 then
			return "Auto"
		end

		return arg_291_0 .. " %"
	end, function()
		return slot_0_46_0.ui_tables.unused.hitchance_list.value == iter_0_4
	end)
	slot_0_46_0.ui_tables.ragebot["air_" .. iter_0_4]:set_callback(function()
		slot_0_46_0.ui_tables.unused.hitchance_list.update_active_tab()
	end)
	slot_0_49_0.ragebot_hitchance:slider("ragebot", "noscope_" .. iter_0_4, "\a{Link Active}      \aDEFAULTNo Scope", -1, 100, -1, nil, function(arg_294_0)
		if arg_294_0 < 0 then
			return "Off"
		end

		if arg_294_0 == 0 then
			return "Auto"
		end

		return arg_294_0 .. " %"
	end, function()
		return slot_0_46_0.ui_tables.unused.hitchance_list.value == iter_0_4
	end):set_disable_function(function()
		return iter_0_4 > 3
	end)
	slot_0_46_0.ui_tables.ragebot["noscope_" .. iter_0_4]:set_callback(function()
		slot_0_46_0.ui_tables.unused.hitchance_list.update_active_tab()
	end)
	slot_0_49_0.ragebot_hitchance:slider("ragebot", "noscope_dist" .. iter_0_4, "\a4a4a4aFF        \aDEFAULTDistance", 0, 101, 0, nil, function(arg_298_0)
		local var_298_0 = arg_298_0 / 10

		if arg_298_0 > 100 then
			return "inf."
		end

		return var_298_0 .. "m"
	end, function()
		return slot_0_46_0.ui_tables.unused.hitchance_list.value == iter_0_4 and slot_0_46_0.ui_tables.ragebot["noscope_" .. iter_0_4].value >= 0
	end)
end

function slot_0_46_0.ui_tables.unused.hitchance_list.update_active_tab()
	local var_300_0 = slot_0_46_0.ui_tables.unused.hitchance_list
	local var_300_1 = {}

	for iter_300_0 = 1, #var_300_0.elements_array do
		local var_300_2 = "  "

		if slot_0_46_0.ui_tables.ragebot["noscope_" .. iter_300_0].value >= 0 then
			var_300_2 = "\aFBCEB1FF•\aDEFAULT"
		end

		if slot_0_46_0.ui_tables.ragebot["air_" .. iter_300_0].value >= 0 then
			var_300_2 = "\a{Link Active}•\aDEFAULT" .. var_300_2
		else
			var_300_2 = "  " .. var_300_2
		end

		if iter_300_0 == var_300_0.value then
			var_300_2 = var_300_2 .. "   \aDEFAULT" .. var_300_0.elements_array[iter_300_0]
		else
			var_300_2 = var_300_2 .. "   \a4f4f4fFF" .. var_300_0.elements_array[iter_300_0]
		end

		var_300_1[#var_300_1 + 1] = var_300_2
	end

	var_300_0.ref:update(var_300_1)
end

slot_0_46_0.ui_tables.unused.hitchance_list:set_callback(function()
	slot_0_46_0.ui_tables.unused.hitchance_list.update_active_tab()
end, true)

slot_0_49_0.visuals_main_settings = slot_0_46_0.create_group(" Other \a{Switch}\aDEFAULT Visuals\a{Switch}  \a{Link Active}Settings", 2)

slot_0_49_0.visuals_main_settings:visible_condition(function()
	return slot_0_46_0.ui_tables.navigation.list.value == 2
end)
slot_0_49_0.visuals_main_settings:label("visuals", "color_label", "\a{Link Active}\t\aDEFAULTColor Settings")
slot_0_46_0.ui_tables.visuals.color_label:switch("color_use_theme", "Theme Colors", true, nil, nil, "\a{Switch}\t\aDEFAULT", "\a{Link Active}\t\aDEFAULT")
slot_0_46_0.ui_tables.visuals.color_label:color_picker("main_color", "Main Color", ui.get_style("Link Active")):set_disable_function(function()
	return slot_0_46_0.ui_tables.visuals.color_use_theme.value
end)
slot_0_46_0.ui_tables.visuals.color_label:color_picker("second_color", "Second Color", ui.get_style("Link Active")):set_disable_function(function()
	return slot_0_46_0.ui_tables.visuals.color_use_theme.value
end)
slot_0_49_0.visuals_main_settings:label("visuals", "settings_label", "\a{Link Active}\t\aDEFAULTDisabled"):disabled(true)
slot_0_46_0.ui_tables.visuals.settings_label:combo("dpi_scale", "\a{Link Active}\t\aDEFAULTDPI Scale", {
	"Auto",
	"100%",
	"125%",
	"150%",
	"175%",
	"200%"
})
slot_0_46_0.ui_tables.visuals.settings_label:slider("anim_speed", "\a{Link Active}\t \aDEFAULTAnim. Speed", 1, 20, 10, 0.1, function(arg_305_0)
	if #tostring(arg_305_0 / 10) ~= 1 then
		return arg_305_0 / 10 .. ""
	else
		return arg_305_0 / 10 .. ".0"
	end
end)
slot_0_49_0.visuals_main_settings:label("visuals", "widgets_label", "\a{Link Active}\t\aDEFAULTDisabled"):disabled(true)
slot_0_46_0.ui_tables.visuals.widgets_label:listable("widgets_list", "", {
	"Watermark",
	"Keybind List",
	"Spectator List",
	"Slowdown Bar"
}, nil, nil)

slot_0_49_0.visuals_localplayer = slot_0_46_0.create_group(" Other \a{Switch}\aDEFAULT Visuals\a{Switch}  \a{Link Active}Localplayer", 1)

slot_0_49_0.visuals_localplayer:visible_condition(function()
	return slot_0_46_0.ui_tables.navigation.list.value == 2
end)
slot_0_49_0.visuals_localplayer:switch("visuals", "breaker_switch", "Anim. Breakers", false, nil, "\a{Switch}\t  \aDEFAULT", "\a{Link Active}\t  \aDEFAULT")
slot_0_46_0.ui_tables.visuals.breaker_switch:listable("breaker_list", "                        Animations", {
	"Backward Legs",
	"Moon Walk",
	"Air Walk",
	"Static Legs in Air",
	"Adjust Move Lean"
})
slot_0_46_0.ui_tables.visuals.breaker_switch:slider("breaker_lean_value", "Lean Value", -1, 10, -1, 0.1, function(arg_307_0)
	if arg_307_0 == -1 then
		return "def."
	end

	if #tostring(arg_307_0 / 10) ~= 1 then
		return arg_307_0 / 10 .. ""
	else
		return arg_307_0 / 10 .. ".0"
	end
end, function()
	return slot_0_46_0.ui_tables.visuals.breaker_list.value_by_name[5] == true
end)
slot_0_49_0.visuals_localplayer:switch("visuals", "transparency_switch", "Transparency", false, nil, "\a{Switch}\t \aDEFAULT", "\a{Link Active}\t \aDEFAULT")
slot_0_46_0.ui_tables.visuals.transparency_switch:switch("transparency_keep", "Keep in Scope", false)
slot_0_46_0.ui_tables.visuals.transparency_switch:slider("transparency_alpha", "Default", 0, 100, 100, 0.01)
slot_0_46_0.ui_tables.visuals.transparency_switch:slider("transparency_scope", "Scoped", 0, 100, 50, 0.01)
slot_0_46_0.ui_tables.visuals.transparency_switch:slider("transparency_nade", "Nade", 0, 100, 50, 0.01)
slot_0_49_0.visuals_localplayer:switch("visuals", "anim_switch", "Animations", false, nil, "\a{Switch}\t\aDEFAULT", "\a{Link Active}\t\aDEFAULT")
slot_0_46_0.ui_tables.visuals.anim_switch:label("anim_label", "More will be added later.")
slot_0_46_0.ui_tables.visuals.anim_switch:switch("anim_gym", "Gym on Freezetime", false, nil, nil, "\a{Switch}\t \aDEFAULT", "\a{Link Active}\t \aDEFAULT")
slot_0_49_0.visuals_localplayer:switch("visuals", "spoofer_switch", "Cheat Spoofer", false, nil, "\a{Switch} \t \aDEFAULT", "\a{Link Active} \t \aDEFAULT")
slot_0_46_0.ui_tables.visuals.spoofer_switch:label("spoofer_label", "Imitates other cheat Shared ESP data.\n\n\af07171FFDont use cheats revealer with spoofer, they share your real cheat!")
slot_0_46_0.ui_tables.visuals.spoofer_switch:list("spoofer_list", "                            Cheats", {
	"Pandora",
	"Fatality",
	"Nixware",
	"Airflow"
})

slot_0_49_0.visuals_indicators = slot_0_46_0.create_group(" Other \a{Switch}\aDEFAULT Visuals\a{Switch}  \a{Link Active}Indicators", 2)

slot_0_49_0.visuals_indicators:visible_condition(function()
	return slot_0_46_0.ui_tables.navigation.list.value == 2
end)
slot_0_49_0.visuals_indicators:label("visuals", "additional_label", "\a{Link Active} \t \aDEFAULTAdditional Elements")
slot_0_46_0.ui_tables.visuals.additional_label:switch("damage_switch", "Damage Indicator", false, nil, nil, "\a{Switch}\t\aDEFAULT", "\a{Link Active}\t\aDEFAULT")
slot_0_46_0.ui_tables.visuals.additional_label:switch("damage_is_active", "\a4a4a4aFF     \aDEFAULT Only is Active", false, function()
	return slot_0_46_0.ui_tables.visuals.damage_switch.value
end)
slot_0_46_0.ui_tables.visuals.additional_label:combo("damage_font", "\a4a4a4aFF      \aDEFAULTFont", {
	"Pixel",
	"Verdana"
}, nil, function()
	return slot_0_46_0.ui_tables.visuals.damage_switch.value
end)
slot_0_46_0.ui_tables.visuals.additional_label:switch("manual_switch", "Manual Arrows", false, nil, nil, "\a{Switch} \t \aDEFAULT", "\a{Link Active} \t \aDEFAULT")
slot_0_49_0.visuals_indicators:switch("visuals", "indicator_switch", "Crosshair Indicator", false, nil, "\a{Switch} \t \aDEFAULT", "\a{Link Active} \t \aDEFAULT")
slot_0_46_0.ui_tables.visuals.indicator_switch:combo("indicator_style", "Style", {
	"Old",
	"Restyle",
	"Classic"
}):disabled(true)
slot_0_46_0.ui_tables.visuals.indicator_switch:switch("indicator_glow", "Glow", true)
slot_0_46_0.ui_tables.visuals.indicator_switch:slider("glow_thick", "Thickness", 0, 50, 25, nil, nil, function()
	return slot_0_46_0.ui_tables.visuals.indicator_switch.value and slot_0_46_0.ui_tables.visuals.indicator_glow.value
end)
slot_0_46_0.ui_tables.visuals.indicator_switch:slider("glow_alpha", "Alpha", 0, 100, 75, 0.01, nil, function()
	return slot_0_46_0.ui_tables.visuals.indicator_switch.value and slot_0_46_0.ui_tables.visuals.indicator_glow.value
end)
slot_0_49_0.visuals_indicators:switch("visuals", "scope_switch", "Scope Lines", false, nil, "\a{Switch} \t \aDEFAULT", "\a{Link Active} \t \aDEFAULT")

slot_0_50_0 = ui.get_style("Link Active")

slot_0_46_0.ui_tables.visuals.scope_switch:selectable("scope_type", "Type", {
	"Reversed",
	"T Style"
}):color_picker("scope_color", {
	Fade = {
		slot_0_50_0
	},
	Gradient = {
		slot_0_50_0,
		color(slot_0_50_0.r, slot_0_50_0.g, slot_0_50_0.b, 0)
	}
})
slot_0_46_0.ui_tables.visuals.scope_switch:slider("scope_size", "Size", 10, 500, 200, nil, function(arg_314_0)
	return arg_314_0 .. "px"
end)
slot_0_46_0.ui_tables.visuals.scope_switch:slider("scope_gap", "Gap", 0, 100, 6, nil, function(arg_315_0)
	return arg_315_0 .. "px"
end)
slot_0_49_0.visuals_indicators:switch("visuals", "hitlog_switch", "Hitlogs", false, nil, "\a{Switch} \t \aDEFAULT", "\a{Link Active} \t \aDEFAULT")
slot_0_46_0.ui_tables.visuals.hitlog_switch:listable("hitlog_vis_type", "                            Output", {
	"Console",
	"Screen",
	"Notification"
})
slot_0_46_0.ui_tables.visuals.hitlog_switch:slider("hitlog_duration", "Duration", 10, 50, 30, 0.1, function(arg_316_0)
	if #tostring(arg_316_0 / 10) ~= 1 then
		return arg_316_0 / 10 .. ""
	else
		return arg_316_0 / 10 .. ".0"
	end
end, function()
	return slot_0_46_0.ui_tables.visuals.hitlog_vis_type.value_by_name[2] ~= nil
end)
slot_0_46_0.ui_tables.visuals.hitlog_switch:selectable("hitlog_extra", "Extra", {
	"Icons",
	"Glow"
}, {
	"Icons",
	"Glow"
}, function()
	return slot_0_46_0.ui_tables.visuals.hitlog_vis_type.value_by_name[2] ~= nil
end)
slot_0_46_0.ui_tables.visuals.hitlog_switch:combo("hitlog_color_mode", "Color Mode", {
	"Group",
	"Per Reason"
})
slot_0_46_0.ui_tables.visuals.hitlog_switch:switch("hitlog_theme_hit", "Hit Theme Color", true):color_picker("hitlog_hit", ui.get_style("Link Active"), function()
	return not slot_0_46_0.ui_tables.visuals.hitlog_theme_hit.value
end, true)
slot_0_46_0.ui_tables.visuals.hitlog_switch:color_picker("hitlog_miss", "Miss", color(254, 62, 62), function()
	return slot_0_46_0.ui_tables.visuals.hitlog_color_mode.value == 1
end)
slot_0_46_0.ui_tables.visuals.hitlog_switch:color_picker("hitlog_resolver", "Resolver", color(254, 62, 62), function()
	return slot_0_46_0.ui_tables.visuals.hitlog_color_mode.value == 2
end)
slot_0_46_0.ui_tables.visuals.hitlog_switch:color_picker("hitlog_spread", "Spread", color(255, 193, 57), function()
	return slot_0_46_0.ui_tables.visuals.hitlog_color_mode.value == 2
end)
slot_0_46_0.ui_tables.visuals.hitlog_switch:color_picker("hitlog_pred", "Prediction Error", color(255, 66, 119), function()
	return slot_0_46_0.ui_tables.visuals.hitlog_color_mode.value == 2
end)
slot_0_46_0.ui_tables.visuals.hitlog_switch:color_picker("hitlog_death", "Death", color(165, 41, 41), function()
	return slot_0_46_0.ui_tables.visuals.hitlog_color_mode.value == 2
end)

slot_0_49_0.visuals_extra = slot_0_46_0.create_group(" Other \a{Switch}\aDEFAULT Visuals\a{Switch}  \a{Link Active}Extra", 1)

slot_0_49_0.visuals_extra:visible_condition(function()
	return slot_0_46_0.ui_tables.navigation.list.value == 2
end)
slot_0_49_0.visuals_extra:switch("viewmodel", "aspect_switch", "Aspect Ratio", slot_0_0_0.viewmodel.aspect_ratio_switch ~= nil and slot_0_0_0.viewmodel.aspect_ratio_switch or false, nil, "\a{Switch} \t \aDEFAULT", "\a{Link Active} \t \aDEFAULT")
slot_0_46_0.ui_tables.viewmodel.aspect_switch:slider("aspect_value", "Value", 0, 20, slot_0_0_0.viewmodel.aspect_ratio ~= nil and slot_0_0_0.viewmodel.aspect_ratio or 0, 0.1)
slot_0_49_0.visuals_extra:switch("visuals", "console_switch", "Console Color", false, nil, "\a{Switch} \t \aDEFAULT", "\a{Link Active} \t \aDEFAULT"):color_picker("console_color", nil, color(255))
slot_0_49_0.visuals_extra:switch("viewmodel", "viewmodel_switch", "Viewmodel", slot_0_0_0.viewmodel.switch ~= nil and slot_0_0_0.viewmodel.switch or false, nil, "\a{Switch}\t\aDEFAULT", "\a{Link Active}\t\aDEFAULT")
slot_0_46_0.ui_tables.viewmodel.viewmodel_switch:slider("viewmodel_fov", "FOV", 0, 150, slot_0_0_0.viewmodel.fov ~= nil and slot_0_0_0.viewmodel.fov or 0)
slot_0_46_0.ui_tables.viewmodel.viewmodel_switch:slider("viewmodel_x", "   X", -1000, 1000, slot_0_0_0.viewmodel.x ~= nil and slot_0_0_0.viewmodel.x or 0, 0.01)
slot_0_46_0.ui_tables.viewmodel.viewmodel_switch:slider("viewmodel_y", "   Y", -1000, 1000, slot_0_0_0.viewmodel.y ~= nil and slot_0_0_0.viewmodel.y or 0, 0.01)
slot_0_46_0.ui_tables.viewmodel.viewmodel_switch:slider("viewmodel_z", "   Z", -1000, 1000, slot_0_0_0.viewmodel.z ~= nil and slot_0_0_0.viewmodel.z or 0, 0.01)
slot_0_46_0.ui_tables.viewmodel.viewmodel_switch:button("viewmodel_undo", "Undo")

slot_0_49_0.visuals_world = slot_0_46_0.create_group(" Other \a{Switch}\aDEFAULT Visuals\a{Switch}  \a{Link Active}World", 2)

slot_0_49_0.visuals_world:visible_condition(function()
	return slot_0_46_0.ui_tables.navigation.list.value == 2
end)
slot_0_49_0.visuals_world:switch("visuals", "hitmarker_switch", "Hitmarkers", false, nil, "\a{Switch} \t \aDEFAULT", "\a{Link Active} \t \aDEFAULT")
slot_0_46_0.ui_tables.visuals.hitmarker_switch:slider("hitmarker_duration", "Duration", 10, 50, 30, 0.1, function(arg_327_0)
	if #tostring(arg_327_0 / 10) ~= 1 then
		return arg_327_0 / 10 .. ""
	else
		return arg_327_0 / 10 .. ".0"
	end
end)
slot_0_46_0.ui_tables.visuals.hitmarker_switch:switch("hitmarker_lastshot", "Last Shot Only", true)
slot_0_46_0.ui_tables.visuals.hitmarker_switch:switch("hitmarker_color_hitlog", "Colors from Hitlogs", true)
slot_0_46_0.ui_tables.visuals.hitmarker_switch:switch("hitmarker_theme_hit", "Hit Theme Color", true, function()
	return not slot_0_46_0.ui_tables.visuals.hitmarker_color_hitlog.value
end):color_picker("hitmarker_hit", ui.get_style("Link Active"), function()
	return not slot_0_46_0.ui_tables.visuals.hitmarker_theme_hit.value
end, true)
slot_0_46_0.ui_tables.visuals.hitmarker_switch:color_picker("hitmarker_miss", "Miss", color(254, 62, 62), function()
	return not slot_0_46_0.ui_tables.visuals.hitmarker_color_hitlog.value
end)
slot_0_46_0.ui_tables.visuals.hitmarker_switch:switch("hitmarker_glow", "Glow", false)
slot_0_49_0.visuals_world:switch("visuals", "nade_switch", "Grenade Radius", false, nil, "\a{Switch}\t \aDEFAULT", "\a{Link Active}\t \aDEFAULT")
slot_0_46_0.ui_tables.visuals.nade_switch:combo("nade_style", "Style", {
	"Solid",
	"Gradient"
})
slot_0_46_0.ui_tables.visuals.nade_switch:switch("nade_molotov", "Molotov", true):color_picker("nade_molotov_c", color(255, 122, 122, 150), function()
	return slot_0_46_0.ui_tables.visuals.nade_molotov.value
end, true)
slot_0_46_0.ui_tables.visuals.nade_switch:color_picker("nade_molotov_cf", "Ally Molotov", color(0, 0), function()
	return slot_0_46_0.ui_tables.visuals.nade_molotov.value
end)
slot_0_46_0.ui_tables.visuals.nade_switch:switch("nade_smoke", "Smoke", true):color_picker("nade_smoke_c", color(131, 131), function()
	return slot_0_46_0.ui_tables.visuals.nade_smoke.value
end, true)
slot_0_49_0.visuals_world:switch("visuals", "molotov_switch", "Disabled", false, nil, "\a{Switch} \t \aDEFAULT", "\a{Link Active} \t \aDEFAULT"):disabled(true)

slot_0_49_0.misc = slot_0_46_0.create_group(" Other \a{Switch}\a{Link Active} Misc", 2)

slot_0_49_0.misc:visible_condition(function()
	return slot_0_46_0.ui_tables.navigation.list.value == 3
end)
slot_0_49_0.misc:switch("misc", "avoid_switch", "Avoid Collisions", false, nil, "\a{Switch}\t \aDEFAULT", "\a{Link Active}\t \aDEFAULT")
slot_0_46_0.ui_tables.misc.avoid_switch:slider("avoid_dist", "Distance", 1, 10, 5, 0.1)
slot_0_46_0.ui_tables.misc.avoid_switch:listable("avoid_disable", "Disablers", {
	"Crouching",
	"Edge Jump"
}, {
	"Crouching",
	"Edge Jump"
})
slot_0_49_0.misc:switch("misc", "fastladder_switch", "Fast Ladder", false, nil, "\a{Switch} \t \aDEFAULT", "\a{Link Active} \t \aDEFAULT")
slot_0_49_0.misc:switch("misc", "fall_switch", "No Fall Damage", false, nil, "\a{Switch} \t\aDEFAULT", "\a{Link Active} \t\aDEFAULT")
slot_0_49_0.misc:switch("misc", "trashtalk_switch", " AI Trashtalk", false, nil, "\a{Switch}  \t\aDEFAULT", "\a{Link Active}  \t\aDEFAULT")
slot_0_46_0.ui_tables.misc.trashtalk_switch:selectable("trash_type", "Type", {
	"On Kill",
	"On Death",
	"Revenge"
}, {
	"On Kill",
	"On Death",
	"Revenge"
})
slot_0_49_0.misc:switch("misc", "clantag_switch", "Clantag", false, nil, "\a{Switch}  \t\aDEFAULT", "\a{Link Active}  \t\aDEFAULT")
slot_0_49_0.misc:switch("misc", "shared_switch", "Shared Logo", false, nil, "\a{Switch}  \t\aDEFAULT", "\a{Link Active}  \t\aDEFAULT")
slot_0_49_0.misc:switch("misc", "ping_switch", "Extended Ping", false, nil, "\a{Switch}  \t\aDEFAULT", "\a{Link Active}  \t\aDEFAULT")
slot_0_46_0.ui_tables.misc.ping_switch:slider("ping_slider", "\a{Link Active}  \t\aDEFAULTPing", 0, 200, 200)

slot_0_46_0.is_loaded = true

slot_0_46_0.update_all_groups()

slot_0_51_0 = {}
slot_0_51_0.active_condition = ""
slot_0_51_0.tick_switch = false
slot_0_51_0.spin_cache = 0
slot_0_51_0.conds_path = {}
slot_0_51_0.yaw_counter = 1
slot_0_51_0.ways = {
	{},
	{},
	{
		-2,
		180,
		2
	},
	{
		-2,
		-4,
		4,
		2
	},
	{
		-2,
		-4,
		180,
		4,
		2
	},
	{
		-2,
		-4,
		-6,
		6,
		4,
		2
	},
	{
		-2,
		-4,
		-6,
		180,
		6,
		4,
		2
	}
}
slot_0_51_0.pitch_table = {
	Up = -89,
	Down = 89,
	Disabled = 0
}
slot_0_51_0.shuffle_array = {}
slot_0_51_0.flick_delay = 0
slot_0_51_0.switch_delay = 0
slot_0_51_0.onetap_defensive_value = 0
slot_0_51_0.onetap_speed_value = 0
slot_0_51_0.lc_tickbase = globals.tickcount
slot_0_51_0.lc_timer = 0
slot_0_51_0.last_weapon = nil
slot_0_51_0.break_lc_tick_switch = false
slot_0_51_0.legitaa_list = {
	CPropDoorRotating = true,
	CHostage = true,
	CFuncBrush = true,
	CBaseButton = true
}
slot_0_51_0.safe_head = false
slot_0_51_0.predict_yaw = 0
slot_0_51_0.cache_charge = 0

function slot_0_51_0.generate_shuffle_array(arg_335_0)
	local var_335_0 = {}

	for iter_335_0 = 1, arg_335_0 do
		var_335_0[iter_335_0] = iter_335_0
	end

	for iter_335_1 = 1, #var_335_0 do
		local var_335_1 = utils.random_int(1, arg_335_0)

		var_335_0[var_335_1], var_335_0[iter_335_1] = var_335_0[iter_335_1], var_335_0[var_335_1]
	end

	return var_335_0
end

function slot_0_51_0.legit_aa(arg_336_0)
	slot_336_1_0 = slot_0_40_0.ref
	slot_336_2_0 = slot_0_40_0.crouching
	slot_336_3_0 = slot_336_1_0.m_iTeamNum
	slot_336_4_0 = entity.get_entities("CPlantedC4")
	slot_336_5_0 = #slot_336_4_0 > 0
	slot_336_6_0 = slot_0_40_0.eye_pos
	slot_336_7_0 = render.camera_angles()
	slot_336_8_0 = utils.trace_line(slot_336_6_0, slot_336_6_0 + vector():angles(slot_336_7_0.x, slot_336_7_0.y, 0) * 130, slot_336_1_0, 1073741825, 3)

	if slot_336_8_0.entity then
		slot_336_9_1 = false

		if slot_336_8_0.entity:is_weapon() then
			slot_336_10_2 = slot_336_8_0.entity:get_weapon_info().weapon_name
			slot_336_9_1 = slot_0_51_0.legitaa_list[slot_336_10_2] or slot_336_10_2:find("weapon")
		else
			slot_336_10_1 = slot_336_8_0.entity:get_classname()
			slot_336_9_1 = slot_0_51_0.legitaa_list[slot_336_10_1]
		end

		if slot_336_9_1 then
			slot_0_51_0.active_condition = slot_336_2_0 and 61 or 2

			return
		end
	end

	if slot_336_5_0 and slot_336_1_0:get_origin():dist(slot_336_4_0[#slot_336_4_0]:get_origin()) < 62 and slot_336_3_0 == 3 then
		slot_0_51_0.active_condition = slot_336_2_0 and 61 or 2

		return
	end

	slot_336_9_0 = slot_0_46_0.ui_tables.antiaim.legitaa_pitch.value

	slot_0_37_0.pitch:override("Disabled")

	if not arg_336_0.in_attack then
		if slot_336_9_0 == 2 then
			arg_336_0.view_angles.x = 0
		end

		if slot_336_9_0 == 3 then
			arg_336_0.view_angles.x = slot_0_46_0.ui_tables.antiaim.legitaa_custom.value
		end
	end

	slot_0_37_0.yaw_offset:override(180)
	slot_0_37_0.yaw_at_targets:override("Local View")
	slot_0_35_0.desync:set(slot_0_46_0.ui_tables.antiaim.legitaa_desync.value)

	slot_336_10_0 = nil

	if slot_0_46_0.ui_tables.antiaim.legitaa_desync.value then
		slot_336_11_1 = slot_0_46_0.ui_tables.antiaim.legitaa_mod.value_by_name

		if slot_336_11_1.Jitter then
			slot_336_10_0 = slot_0_51_0.break_lc_tick_switch
		end

		if slot_336_11_1["Randomize Jitter"] then
			slot_336_10_0 = utils.random_int(0, 1) == 1
		end
	end

	slot_336_11_0 = entity.get_threat()
	slot_336_12_0 = slot_0_46_0.ui_tables.antiaim.legitaa_freestand.value

	if slot_336_11_0 and slot_336_12_0 ~= 1 then
		slot_336_13_0 = rage.antiaim:get_target()
		slot_336_14_0 = slot_0_40_0.eye_pos
		slot_336_14_0.z = slot_336_1_0:get_hitbox_position(0).z
		slot_336_15_0 = slot_336_1_0:get_origin()
		slot_336_16_0 = slot_336_11_0:get_origin()
		slot_336_16_0.z = slot_336_16_0.z + 64
		slot_336_17_0 = slot_336_1_0.m_vecMins
		slot_336_18_0 = slot_336_1_0.m_vecMaxs
		slot_336_19_0 = nil
		slot_336_20_0 = nil
		slot_336_21_1 = nil

		for iter_336_0 = 1, 3 do
			slot_336_26_1 = vector():angles(0, slot_336_13_0 - 90, 0) * 20 * iter_336_0
			slot_336_27_3 = utils.trace_hull(slot_336_15_0, slot_336_15_0 + slot_336_26_1, slot_336_17_0, slot_336_18_0, slot_336_1_0, 33636363, 3)
			slot_336_27_3.end_pos.z = slot_336_14_0.z
			slot_336_27_2 = slot_336_27_3.end_pos

			if utils.trace_bullet(slot_336_11_0, slot_336_16_0, slot_336_27_2) > 0 then
				slot_336_19_0 = true

				break
			end
		end

		for iter_336_1 = 1, 3 do
			slot_336_26_0 = vector():angles(0, slot_336_13_0 + 90, 0) * 20 * iter_336_1
			slot_336_27_1 = utils.trace_hull(slot_336_15_0, slot_336_15_0 + slot_336_26_0, slot_336_17_0, slot_336_18_0, slot_336_1_0, 33636363, 3)
			slot_336_27_1.end_pos.z = slot_336_14_0.z
			slot_336_27_0 = slot_336_27_1.end_pos

			if utils.trace_bullet(slot_336_11_0, slot_336_16_0, slot_336_27_0) > 0 then
				slot_336_20_0 = true

				break
			end
		end

		slot_336_21_0 = utils.trace_bullet(slot_336_11_0, slot_336_16_0, slot_336_14_0) > 0

		if slot_336_19_0 and slot_336_20_0 or slot_336_21_0 then
			-- block empty
		elseif slot_336_19_0 then
			slot_336_10_0 = slot_336_12_0 == 2
			slot_336_10_0 = not slot_336_10_0
		elseif slot_336_20_0 then
			slot_336_10_0 = slot_336_12_0 == 3
			slot_336_10_0 = not slot_336_10_0
		end
	end

	slot_0_51_0.desync_side = slot_336_10_0

	slot_0_37_0.inverter:override(slot_336_10_0)
	slot_0_37_0.defensive:override(nil)
	slot_0_37_0.hide_shots_defensive:override(nil)
	slot_0_37_0.freestand:override(false)
	slot_0_37_0.hidden_yaw:override(false)
	slot_0_37_0.left_limit:override(60)
	slot_0_37_0.right_limit:override(60)

	slot_0_34_0.legit_aa = true
	arg_336_0.buttons = slot_0_6_0(arg_336_0.buttons, bit.bnot(32))
end

slot_0_51_0.last_button = nil
slot_0_51_0.manual_state = 0

function slot_0_51_0.manual_function()
	local var_337_0 = slot_0_46_0.ui_tables.antiaim

	if var_337_0.forward_key.value then
		if slot_0_51_0.last_button ~= 3 then
			slot_0_51_0.manual_state = slot_0_51_0.manual_state == 3 and 0 or 3
			slot_0_51_0.last_button = 3
		end

		return
	end

	if var_337_0.left_key.value then
		if slot_0_51_0.last_button ~= 1 then
			slot_0_51_0.manual_state = slot_0_51_0.manual_state == 1 and 0 or 1
			slot_0_51_0.last_button = 1
		end

		return
	end

	if var_337_0.right_key.value then
		if slot_0_51_0.last_button ~= 2 then
			slot_0_51_0.manual_state = slot_0_51_0.manual_state == 2 and 0 or 2
			slot_0_51_0.last_button = 2
		end

		return
	end

	if var_337_0.back_key.value then
		if slot_0_51_0.last_button ~= 4 then
			slot_0_51_0.manual_state = 0
			slot_0_51_0.last_button = 4
		end

		return
	end

	if var_337_0.manual_type.str_value == "Hold" then
		slot_0_51_0.manual_state = 0
	end

	slot_0_51_0.last_button = nil
end

function slot_0_51_0.main_aa(arg_338_0)
	slot_338_1_0 = slot_0_40_0.ref
	slot_338_2_0 = 1
	slot_338_3_1 = 1
	slot_338_4_0 = slot_0_40_0.velocity
	slot_338_5_0 = slot_0_40_0.ground_tickcount > 1
	slot_338_6_0 = slot_0_40_0.crouching
	slot_338_7_0 = rage.exploit:get()

	if slot_338_5_0 then
		if slot_338_6_0 then
			slot_338_2_0 = slot_338_4_0 <= 2 and 51 or 52
		elseif slot_338_4_0 <= 2 then
			slot_338_2_0 = 2
		else
			slot_338_2_0 = slot_0_36_0.slowwalk and 3 or 4
		end
	else
		slot_338_2_0 = slot_338_6_0 and 62 or 61
	end

	slot_338_8_0 = slot_0_46_0.ui_tables.antiaim
	slot_338_3_0 = slot_338_2_0

	if slot_0_46_0.ui_tables.antiaim.list.value == 2 then
		slot_338_8_0 = slot_0_46_0.presets[slot_0_46_0.ui_tables.antiaim.preset_list.str_value]
	end

	slot_338_2_0 = slot_338_8_0["over_cond" .. slot_338_2_0].value and 1 or slot_338_2_0

	if arg_338_0.choked_commands == 0 then
		slot_0_51_0.switch_delay = slot_0_51_0.switch_delay + 1

		if slot_338_8_0["yaw_delay" .. slot_338_2_0].value < slot_0_51_0.switch_delay or slot_338_7_0 == 0 then
			if slot_0_11_0(slot_0_51_0.lc_timer - globals.tickcount) >= 12 or not slot_338_8_0["def_switch" .. slot_338_2_0].value then
				slot_0_51_0.tick_switch = not slot_0_51_0.tick_switch
				slot_0_51_0.yaw_counter = slot_0_51_0.yaw_counter + 1
			end

			slot_0_51_0.break_lc_tick_switch = not slot_0_51_0.break_lc_tick_switch
			slot_0_51_0.switch_delay = 0
		end
	else
		if slot_0_6_0(arg_338_0.buttons, slot_0_32_0.flags.IN_USE) ~= 0 and slot_0_46_0.ui_tables.antiaim.legitaa_switch.value then
			slot_0_51_0.legit_aa(arg_338_0)
		end

		if slot_338_8_0["roll_switch" .. slot_338_2_0].value then
			if slot_338_8_0["roll_type" .. slot_338_2_0].value == 1 then
				arg_338_0.view_angles.z = slot_338_8_0["roll_def_deg" .. slot_338_2_0].value
				arg_338_0.jitter_move = false

				slot_0_37_0.exales:override()
				slot_0_37_0.exales_pitch:override()
				slot_0_37_0.exales_roll:override()
			else
				slot_0_37_0.exales:override(true)
				slot_0_37_0.exales_pitch:override(slot_338_8_0["roll_ext_pit" .. slot_338_2_0].value)
				slot_0_37_0.exales_roll:override(slot_338_8_0["roll_ext_deg" .. slot_338_2_0].value)
			end
		else
			slot_0_37_0.exales:override()
			slot_0_37_0.exales_pitch:override()
			slot_0_37_0.exales_roll:override()
		end

		return
	end

	if slot_0_6_0(arg_338_0.buttons, slot_0_32_0.flags.IN_USE) ~= 0 and slot_0_46_0.ui_tables.antiaim.legitaa_switch.value then
		slot_0_51_0.legit_aa(arg_338_0)

		return
	end

	if slot_0_34_0.legit_aa then
		slot_0_37_0.pitch:override()
		slot_0_37_0.freestand:override()
		slot_0_37_0.yaw_at_targets:override()
		slot_0_37_0.hidden_yaw:override()

		slot_0_34_0.legit_aa = nil
	end

	slot_338_9_0 = entity.get_threat()
	slot_338_10_0 = slot_0_36_0.inverter

	slot_0_35_0.desync:override(slot_338_8_0["desync_switch" .. slot_338_2_0].value)

	if slot_338_8_0["desync_switch" .. slot_338_2_0].value then
		slot_0_37_0.left_limit:override(slot_338_8_0["desync_l" .. slot_338_2_0].value)
		slot_0_37_0.right_limit:override(slot_338_8_0["desync_r" .. slot_338_2_0].value)

		slot_338_11_1 = slot_338_8_0["desync_mod" .. slot_338_2_0].value_by_name

		if slot_338_11_1.Jitter then
			slot_338_10_0 = slot_0_51_0.tick_switch
		end

		if slot_338_11_1["Randomize Jitter"] then
			slot_338_10_0 = slot_0_13_0(0, 1) == 1
		end

		slot_338_12_2 = slot_338_8_0["desync_freestand" .. slot_338_2_0].value

		if slot_338_9_0 and slot_338_12_2 ~= 1 then
			slot_338_13_2 = rage.antiaim:get_target()
			slot_338_14_5 = slot_0_40_0.eye_pos
			slot_338_14_5.z = slot_338_1_0:get_hitbox_position(0).z
			slot_338_15_4 = slot_338_1_0:get_origin()
			slot_338_16_2 = slot_338_9_0:get_origin()
			slot_338_16_2.z = slot_338_16_2.z + 64
			slot_338_17_1 = slot_338_1_0.m_vecMins
			slot_338_18_2 = slot_338_1_0.m_vecMaxs
			slot_338_19_1 = nil
			slot_338_20_1 = nil
			slot_338_21_2 = nil

			for iter_338_0 = 1, 3 do
				slot_338_26_2 = vector():angles(0, slot_338_13_2 - 90, 0) * 20 * iter_338_0
				slot_338_27_5 = utils.trace_hull(slot_338_15_4, slot_338_15_4 + slot_338_26_2, slot_338_17_1, slot_338_18_2, slot_338_1_0, 33636363, 3)
				slot_338_27_5.end_pos.z = slot_338_14_5.z
				slot_338_27_4 = slot_338_27_5.end_pos

				if utils.trace_bullet(slot_338_9_0, slot_338_16_2, slot_338_27_4) > 0 then
					slot_338_19_1 = true

					break
				end
			end

			for iter_338_1 = 1, 3 do
				slot_338_26_1 = vector():angles(0, slot_338_13_2 + 90, 0) * 20 * iter_338_1
				slot_338_27_3 = utils.trace_hull(slot_338_15_4, slot_338_15_4 + slot_338_26_1, slot_338_17_1, slot_338_18_2, slot_338_1_0, 33636363, 3)
				slot_338_27_3.end_pos.z = slot_338_14_5.z
				slot_338_27_2 = slot_338_27_3.end_pos

				if utils.trace_bullet(slot_338_9_0, slot_338_16_2, slot_338_27_2) > 0 then
					slot_338_20_1 = true

					break
				end
			end

			slot_338_21_1 = utils.trace_bullet(slot_338_9_0, slot_338_16_2, slot_338_14_5) > 0

			if slot_338_19_1 and slot_338_20_1 or slot_338_21_1 then
				-- block empty
			elseif slot_338_19_1 then
				slot_338_10_0 = slot_338_12_2 == 2

				if slot_338_2_0 == 9 then
					slot_338_10_0 = not slot_338_10_0
				end
			elseif slot_338_20_1 then
				slot_338_10_0 = slot_338_12_2 == 3

				if slot_338_2_0 == 9 then
					slot_338_10_0 = not slot_338_10_0
				end
			end
		end
	end

	slot_338_11_0 = 0

	if slot_338_8_0["yaw_switch" .. slot_338_2_0].value then
		slot_0_37_0.yaw_base:override("Backward")
		slot_0_37_0.yaw_modifier:override("Disabled")

		if slot_338_8_0["desync_switch" .. slot_338_2_0].value then
			slot_338_11_0 = slot_338_10_0 and slot_338_8_0["yaw_l" .. slot_338_2_0].value or slot_338_8_0["yaw_r" .. slot_338_2_0].value
			slot_338_11_0 = slot_338_11_0 + (slot_338_10_0 and utils.random_int(0, slot_338_8_0["yaw_randl" .. slot_338_2_0].value) or utils.random_int(0, slot_338_8_0["yaw_randr" .. slot_338_2_0].value))
		else
			slot_338_11_0 = slot_0_51_0.tick_switch and slot_338_8_0["yaw_l" .. slot_338_2_0].value or slot_338_8_0["yaw_r" .. slot_338_2_0].value
			slot_338_11_0 = slot_338_11_0 + (slot_0_51_0.tick_switch and utils.random_int(0, slot_338_8_0["yaw_randl" .. slot_338_2_0].value) or utils.random_int(0, slot_338_8_0["yaw_randr" .. slot_338_2_0].value))
		end

		slot_338_11_0 = slot_338_11_0 + slot_338_8_0["yaw_o" .. slot_338_2_0].value
		slot_338_11_0 = slot_338_11_0 + utils.random_int(0, slot_338_8_0["yaw_rando" .. slot_338_2_0].value)
		slot_338_12_1 = slot_338_8_0["yaw_mod_combo" .. slot_338_2_0].value

		if slot_338_12_1 ~= 1 then
			slot_338_13_1 = slot_338_8_0["yaw_deg" .. slot_338_2_0].value

			if slot_338_12_1 == 2 then
				slot_338_13_1 = slot_0_12_0(slot_338_13_1 / 2)
				slot_338_11_0 = slot_0_51_0.tick_switch and slot_338_13_1 + slot_338_11_0 or -slot_338_13_1 + slot_338_11_0
			end

			if slot_338_12_1 == 4 then
				slot_338_13_1 = utils.random_float(-1, 1) * slot_338_13_1
				slot_338_11_0 = slot_0_51_0.tick_switch and slot_338_13_1 + slot_338_11_0 or -slot_338_13_1 + slot_338_11_0
			end

			if slot_338_12_1 == 5 then
				slot_338_14_4 = slot_0_51_0.spin_cache
				slot_0_51_0.spin_cache = slot_338_14_4 < math.abs(slot_338_13_1) and slot_338_14_4 + 2 or 0

				if slot_338_13_1 > 0 then
					slot_338_11_0 = slot_338_10_0 and -slot_338_14_4 + slot_338_11_0 or -slot_338_14_4 + slot_338_11_0
				else
					slot_338_11_0 = slot_338_10_0 and slot_338_14_4 + slot_338_11_0 or slot_338_14_4 + slot_338_11_0
				end
			end

			if slot_338_12_1 == 3 then
				slot_338_14_3 = slot_338_8_0["xway_counter" .. slot_338_2_0].value

				if slot_338_14_3 < slot_0_51_0.yaw_counter then
					slot_0_51_0.yaw_counter = 1

					if slot_338_8_0["xway_shuffle" .. slot_338_2_0].value then
						slot_0_51_0.shuffle_array = slot_0_51_0.generate_shuffle_array(slot_338_14_3)
					end
				end

				slot_338_15_3 = slot_0_51_0.ways[slot_338_14_3]
				slot_338_16_1 = slot_0_51_0.yaw_counter
				slot_338_13_1 = slot_338_8_0["xway_switch" .. slot_338_2_0].value and slot_338_8_0["xwayn_" .. slot_338_2_0 .. slot_338_16_1].value or slot_0_12_0(slot_338_13_1 / slot_338_15_3[slot_338_16_1])

				if not slot_0_51_0.shuffle_array or slot_338_14_3 ~= #slot_0_51_0.shuffle_array then
					slot_0_51_0.shuffle_array = slot_0_51_0.generate_shuffle_array(slot_338_14_3)
				end

				slot_338_13_1 = slot_338_8_0["xway_switch" .. slot_338_2_0].value and slot_338_8_0["xwayn_" .. slot_338_2_0 .. slot_0_51_0.shuffle_array[slot_338_16_1]].value or slot_0_12_0(slot_338_8_0["yaw_deg" .. slot_338_2_0].value / slot_338_15_3[slot_0_51_0.shuffle_array[slot_338_16_1]])

				if slot_338_8_0["xway_sync" .. slot_338_2_0].value then
					slot_338_10_0 = slot_338_13_1 < 0
				end

				slot_338_11_0 = slot_338_13_1 + slot_338_11_0
			end

			if slot_338_12_1 == 6 and slot_0_11_0(slot_0_51_0.flick_delay - globals.curtime) > slot_338_8_0["flick_delay" .. slot_338_2_0].value / 10 then
				slot_338_11_0 = slot_338_11_0 + slot_338_8_0["flick_yaw" .. slot_338_2_0].value

				slot_0_37_0.desync:override(false)

				arg_338_0.no_choke = true
				slot_0_51_0.flick_delay = globals.curtime
			end

			if slot_338_12_1 == 7 then
				if slot_0_51_0.yaw_counter > 3 then
					slot_0_51_0.yaw_counter = 1
					slot_0_51_0.shuffle_array = slot_0_51_0.generate_shuffle_array(3)
				end

				slot_338_14_2 = slot_0_51_0.yaw_counter
				slot_338_15_2 = slot_0_51_0.ways[3]

				if not slot_0_51_0.shuffle_array or #slot_0_51_0.shuffle_array ~= 3 then
					slot_0_51_0.shuffle_array = slot_0_51_0.generate_shuffle_array(3)
				end

				slot_338_11_0 = slot_338_11_0 + slot_0_12_0(slot_338_13_1 * 4 / slot_338_15_2[slot_0_51_0.shuffle_array[slot_338_14_2]])

				if slot_338_8_0["xway_sync" .. slot_338_2_0].value then
					slot_338_10_0 = slot_338_13_1 < 0
				end
			end
		end
	end

	slot_0_37_0.hidden_yaw:override(slot_338_8_0["def_switch" .. slot_338_2_0].value)

	slot_338_12_0 = nil
	slot_338_13_0 = nil

	if slot_338_8_0["def_switch" .. slot_338_2_0].value and slot_338_7_0 == 1 then
		slot_338_14_1 = slot_338_8_0["def_yaw" .. slot_338_2_0].value
		slot_338_13_0 = 0

		if slot_338_14_1 == 1 then
			slot_338_13_0 = nil
		end

		if slot_338_14_1 == 2 then
			slot_338_13_0 = slot_0_51_0.break_lc_tick_switch and -90 or 90
		end

		if slot_338_14_1 == 3 then
			slot_0_51_0.onetap_speed_value = slot_0_12_0(math.sin(globals.curtime) * slot_338_8_0["def_onetapspeed" .. slot_338_2_0].value)
			slot_0_51_0.onetap_defensive_value = slot_0_51_0.onetap_defensive_value + slot_0_51_0.onetap_speed_value

			if slot_0_11_0(slot_0_51_0.onetap_defensive_value) > 100000 then
				slot_0_51_0.onetap_defensive_value = 0
			end

			slot_338_13_0 = slot_0_51_0.onetap_defensive_value + 180
		end

		if slot_338_14_1 == 4 then
			slot_338_13_0 = utils.random_float(-1, 1) * slot_338_8_0["def_yaw_deg" .. slot_338_2_0].value
		end

		if slot_338_14_1 == 5 then
			slot_338_13_0 = slot_338_8_0["def_yaw_deg" .. slot_338_2_0].value
		end

		slot_338_15_1 = slot_338_8_0["def_pitch" .. slot_338_2_0].str_value
		slot_338_12_0 = slot_0_51_0.pitch_table[slot_338_15_1]

		if slot_338_15_1 == "Sway" then
			slot_338_12_0 = math.sin(globals.curtime) * 89
		end

		if slot_338_15_1 == "Random" then
			slot_338_12_0 = slot_0_12_0(utils.random_float(-1, 1) * slot_338_8_0["pitch_deg" .. slot_338_2_0].value)
		end

		if slot_338_15_1 == "Custom" then
			slot_338_12_0 = slot_338_8_0["pitch_custom" .. slot_338_2_0].value
		end
	end

	slot_338_14_0 = slot_338_3_0

	if slot_338_14_0 > 10 then
		slot_338_14_0 = tonumber(tostring(slot_338_14_0):sub(0, 1))
	end

	slot_338_15_0 = nil
	slot_338_16_0 = slot_0_46_0.ui_tables.unused.condition_list.elements_array[slot_338_14_0]

	if slot_0_46_0.ui_tables.antiaim.breaklc_ping.value_by_name[slot_338_16_0] and slot_338_9_0 and entity.get_player_resource().m_iPing[slot_338_9_0:get_index()] > 50 then
		slot_338_15_0 = true
	end

	if slot_0_46_0.ui_tables.antiaim.breaklc_always.value_by_name[slot_338_16_0] then
		slot_338_15_0 = true
	end

	if slot_0_46_0.ui_tables.antiaim.breaklc_extra.value_by_name["Condition Change"] then
		if slot_0_34_0.cond_change ~= slot_338_3_0 then
			slot_0_34_0.lc_active = globals.tickcount
		end

		slot_0_34_0.cond_change = slot_338_3_0
	end

	slot_338_17_0 = slot_338_1_0:get_player_weapon()

	if slot_338_17_0 then
		if slot_0_46_0.ui_tables.antiaim.breaklc_extra.value_by_name["Weapon Change"] then
			slot_338_18_1 = slot_338_17_0:get_weapon_index()

			if slot_0_34_0.last_weapon ~= slot_338_18_1 then
				slot_0_34_0.lc_active = globals.tickcount
			end

			slot_0_34_0.last_weapon = slot_338_18_1
		end

		if slot_0_46_0.ui_tables.antiaim.breaklc_extra.value_by_name.Reloading and slot_338_17_0:get_weapon_reload() ~= -1 then
			slot_338_15_0 = true
		end
	end

	slot_0_34_0.lc_active = slot_0_34_0.lc_active == nil and 0 or slot_0_34_0.lc_active

	if slot_0_11_0(slot_0_34_0.lc_active - globals.tickcount) < 16 then
		slot_338_15_0 = true
	end

	slot_0_37_0.inverter:override(slot_0_46_0.ui_tables.antiaim.preset_list.str_value ~= "Roll" and slot_338_10_0 or false)
	slot_0_37_0.fake_opt:override("")

	slot_338_18_0 = slot_338_1_0.m_nTickBase

	if slot_338_18_0 - 3 > slot_0_51_0.lc_tickbase and slot_338_7_0 == 1 then
		slot_0_51_0.lc_timer = globals.tickcount
	end

	slot_0_51_0.lc_tickbase = slot_338_18_0
	slot_338_19_0 = 0
	slot_338_20_0 = 0
	slot_338_21_0 = rage.antiaim:get_target(true)

	if slot_0_46_0.ui_tables.antiaim.base_compensate.value and slot_338_6_0 and slot_338_5_0 and arg_338_0.forwardmove ~= 0 and arg_338_0.sidemove == 450 then
		slot_338_22_5 = slot_338_10_0 and slot_0_37_0.left_limit.override_value or slot_0_37_0.right_limit.override_value
		slot_338_20_0 = slot_338_10_0 and 0 or 65

		if slot_338_10_0 then
			-- block empty
		else
			slot_338_22_4 = math.min(0.1, slot_338_22_5 / 60)
			slot_338_22_4 = (slot_0_37_0.desync.override_value == nil and slot_0_37_0.desync.value or slot_0_37_0.desync.override_value) and slot_338_22_4 or 0.6
			slot_338_20_0 = slot_338_10_0 and 0 or 65
			slot_338_20_0 = slot_338_20_0 * math.min(slot_338_4_0 / 80, 1) * slot_338_22_4
		end

		slot_338_11_0 = slot_338_20_0 + slot_338_11_0
	end

	if slot_0_46_0.ui_tables.antiaim.base_yaw.str_value == "At Target" and slot_0_46_0.ui_tables.antiaim.predict_switch.value and slot_338_9_0 and not entity.get_threat(true) and not slot_338_21_0 then
		slot_338_22_3 = slot_338_1_0:get_hitbox_position(3)
		slot_338_23_2 = rage.antiaim:get_target()
		slot_338_24_3 = slot_338_9_0:get_eye_position()
		slot_338_25_2 = nil

		for iter_338_2 = 1, 10 do
			slot_338_31_0 = slot_338_24_3 + vector():angles(0, slot_338_23_2 - 90, 0) * 20 * iter_338_2
			slot_338_32_1, slot_338_33_1 = utils.trace_bullet(slot_338_9_0, slot_338_31_0, slot_338_22_3)

			if slot_338_32_1 > 0 and slot_338_33_1.entity == slot_338_1_0 then
				slot_338_25_2 = slot_338_31_0

				break
			end
		end

		slot_338_26_0 = nil

		for iter_338_3 = 1, 10 do
			slot_338_32_0 = slot_338_24_3 + vector():angles(0, slot_338_23_2 + 90, 0) * 20 * iter_338_3
			slot_338_33_0, slot_338_34_0 = utils.trace_bullet(slot_338_9_0, slot_338_32_0, slot_338_22_3)

			if slot_338_33_0 > 0 and slot_338_34_0.entity == slot_338_1_0 then
				if not slot_338_25_2 then
					slot_338_25_2 = slot_338_32_0

					break
				end

				slot_338_26_0 = slot_338_32_0

				break
			end
		end

		if slot_338_25_2 then
			slot_338_25_2.z = 0
			slot_338_22_3.z = 0
			slot_338_25_1 = (slot_338_22_3 - slot_338_25_2):angles()
			slot_338_27_1 = slot_338_23_2 - slot_0_12_0(slot_338_25_1.y)
			slot_338_19_0 = -math.normalize_yaw(slot_338_27_1)

			if slot_338_26_0 and slot_338_25_1 then
				slot_338_19_0 = 0
			end
		end
	end

	slot_0_51_0.predict_yaw = slot_338_19_0

	slot_0_37_0.yaw_offset:override((slot_0_11_0(slot_0_51_0.lc_timer - globals.tickcount) >= 12 or not slot_338_8_0["def_switch" .. slot_338_2_0].value) and slot_338_11_0 + slot_338_19_0 or 0)

	if slot_338_8_0["roll_switch" .. slot_338_2_0].value then
		if slot_338_8_0["roll_type" .. slot_338_2_0].value == 1 then
			arg_338_0.view_angles.z = slot_338_8_0["roll_def_deg" .. slot_338_2_0].value
			arg_338_0.jitter_move = false

			slot_0_37_0.exales:override()
			slot_0_37_0.exales_pitch:override()
			slot_0_37_0.exales_roll:override()
		else
			slot_0_37_0.exales:override(true)
			slot_0_37_0.exales_pitch:override(slot_338_8_0["roll_ext_pit" .. slot_338_2_0].value)
			slot_0_37_0.exales_roll:override(slot_338_8_0["roll_ext_deg" .. slot_338_2_0].value)
		end
	else
		slot_0_37_0.exales:override()
		slot_0_37_0.exales_pitch:override()
		slot_0_37_0.exales_roll:override()
	end

	if slot_338_17_0 and slot_338_17_0:get_weapon_info().weapon_type == 9 and slot_338_17_0.m_bPinPulled then
		slot_338_15_0 = nil
	end

	if slot_0_37_0.freestand.value then
		slot_338_22_2 = rage.antiaim:get_target(true)

		if slot_0_46_0.ui_tables.antiaim.frees_dis_def.value then
			if slot_338_22_2 then
				slot_338_12_0 = nil
				slot_338_13_0 = nil
				slot_338_15_0 = nil

				slot_0_37_0.hidden_yaw:override(false)
			end
		elseif slot_338_7_0 == 1 and slot_338_22_2 then
			slot_338_23_1 = slot_0_46_0.ui_tables.antiaim.frees_yaw.value
			slot_338_13_0 = 0

			if slot_338_23_1 == 1 then
				slot_338_24_2 = rage.antiaim:get_target()
				slot_338_13_0 = slot_0_11_0(slot_338_22_2 - math.normalize_yaw(slot_338_24_2 - 90)) < slot_0_11_0(slot_338_22_2 - math.normalize_yaw(slot_338_24_2 + 90)) and slot_338_22_2 - math.normalize_yaw(slot_338_24_2 + 90) or slot_338_22_2 - math.normalize_yaw(slot_338_24_2 - 90)
			end

			if slot_338_23_1 == 2 then
				slot_338_13_0 = nil
			end

			if slot_338_23_1 == 3 then
				slot_338_13_0 = slot_0_51_0.break_lc_tick_switch and -90 or 90
			end

			if slot_338_23_1 == 4 then
				slot_0_51_0.onetap_speed_value = slot_0_12_0(math.sin(globals.curtime) * slot_0_46_0.ui_tables.antiaim.frees_yaw_onetap.value)
				slot_0_51_0.onetap_defensive_value = slot_0_51_0.onetap_defensive_value + slot_0_51_0.onetap_speed_value

				if slot_0_11_0(slot_0_51_0.onetap_defensive_value) > 100000 then
					slot_0_51_0.onetap_defensive_value = 0
				end

				slot_338_13_0 = slot_0_51_0.onetap_defensive_value + 180
			end

			if slot_338_23_1 == 5 then
				slot_338_13_0 = utils.random_float(-1, 1) * 180
			end

			slot_338_24_1 = slot_0_46_0.ui_tables.antiaim.frees_pitch.str_value
			slot_338_12_0 = slot_0_51_0.pitch_table[slot_338_24_1]

			if slot_338_24_1 == "Sway" then
				slot_338_12_0 = math.sin(globals.curtime) * 89
			end

			if slot_338_24_1 == "Random" then
				slot_338_12_0 = slot_0_12_0(utils.random_float(-1, 1) * 89)
			end

			if slot_338_24_1 == "Custom" then
				slot_338_12_0 = slot_0_46_0.ui_tables.antiaim.frees_pitch_custom.value
			end

			if slot_338_3_0 ~= 2 then
				slot_338_15_0 = nil
			else
				slot_338_15_0 = true

				slot_0_37_0.hidden_yaw:override(true)
			end
		end
	end

	slot_0_51_0.safe_head = false

	if slot_0_46_0.ui_tables.antiaim.safe_switch.value and slot_338_9_0 and slot_0_51_0.manual_state == 0 and not rage.antiaim:get_target(true) then
		slot_338_22_1 = slot_338_1_0:get_hitbox_position(0).z
		slot_338_23_0 = slot_0_40_0.eye_pos
		slot_338_24_0 = slot_338_9_0:get_eye_position()
		slot_338_25_0 = rage.antiaim:get_target()
		slot_338_27_0 = slot_338_23_0 + vector():angles(0, slot_338_25_0, 0) * 10
		slot_338_27_0.z = slot_338_22_1 + 4.5
		slot_338_28_1 = nil
		slot_338_29_1 = nil
		slot_338_30_0 = (slot_338_23_0 + (slot_338_24_0 - slot_338_23_0):normalized() * 30):closest_ray_point(slot_338_24_0, slot_338_27_0)
		slot_338_28_0, slot_338_29_0 = utils.trace_bullet(slot_338_9_0, slot_338_30_0, slot_338_27_0, entity.get(0))

		if slot_338_29_0 and slot_338_29_0.entity == slot_338_1_0 and slot_338_29_0.hitbox ~= 0 then
			slot_0_37_0.left_limit:override(0)
			slot_0_37_0.right_limit:override(0)

			if slot_338_3_0 == 51 then
				slot_0_37_0.yaw_offset:override(12 + slot_338_19_0)
			else
				slot_0_37_0.yaw_offset:override(0 + slot_338_19_0 + slot_338_20_0)
			end

			if slot_0_46_0.ui_tables.antiaim.safe_def.value then
				slot_338_12_0 = nil
				slot_338_13_0 = 0
			end

			if not slot_0_46_0.ui_tables.antiaim.breaklc_always.value_by_name["Safe Head"] then
				slot_338_15_0 = nil
			end

			slot_0_51_0.safe_head = true
		end
	end

	if slot_338_12_0 ~= nil then
		rage.antiaim:override_hidden_pitch(slot_338_12_0)
	end

	if slot_338_13_0 ~= nil then
		rage.antiaim:override_hidden_yaw_offset(slot_338_13_0)
	end

	slot_0_37_0.yaw_at_targets:override(slot_0_46_0.ui_tables.antiaim.base_yaw.str_value)

	if slot_0_51_0.manual_state ~= 0 then
		if slot_0_51_0.manual_state == 1 then
			slot_338_15_0 = nil

			slot_0_37_0.yaw_offset:override(-90)
			slot_0_35_0.inverter:set(true)
		end

		if slot_0_51_0.manual_state == 2 then
			slot_338_15_0 = nil

			slot_0_37_0.yaw_offset:override(90)
			slot_0_35_0.inverter:set(true)
		end

		if slot_0_51_0.manual_state == 3 then
			slot_338_15_0 = nil

			slot_0_37_0.yaw_offset:override(180)
			slot_0_35_0.inverter:set(true)
		end

		slot_0_37_0.yaw_at_targets:override(slot_0_46_0.ui_tables.antiaim.manual_view.str_value)
	end

	slot_338_22_0 = nil

	if slot_0_46_0.ui_tables.antiaim.frees_disable.value_by_name[slot_338_16_0] then
		slot_338_22_0 = false
	end

	if entity.get_game_rules().m_fRoundStartTime > globals.curtime then
		slot_338_15_0 = nil
	end

	slot_0_51_0.desync_side = slot_338_10_0

	slot_0_37_0.freestand:override(slot_338_22_0)
	slot_0_37_0.defensive:override(slot_338_15_0 and "Always On" or slot_338_15_0)
	slot_0_37_0.hide_shots_defensive:override(slot_338_15_0 and "Break LC" or slot_338_15_0)
	slot_0_37_0.pitch:override(slot_0_46_0.ui_tables.antiaim.base_pitch.str_value)
end

function slot_0_51_0.restore_menu()
	slot_0_37_0.pitch:override()
	slot_0_37_0.yaw_base:override()
	slot_0_37_0.yaw_at_targets:override()
	slot_0_37_0.yaw_offset:override()
	slot_0_37_0.yaw_modifier:override()
	slot_0_37_0.yaw_modifier_offset:override()
	slot_0_37_0.desync:override()
	slot_0_35_0.desync:override()
	slot_0_37_0.inverter:override()
	slot_0_37_0.fake_opt:override()
	slot_0_37_0.left_limit:override()
	slot_0_37_0.right_limit:override()
	slot_0_37_0.desync_freestand:override()
	slot_0_37_0.exales:override()
	slot_0_37_0.exales_pitch:override()
	slot_0_37_0.exales_roll:override()
	slot_0_37_0.freestand:override()
	slot_0_37_0.defensive:override()
	slot_0_37_0.fakelag_slider:override()
	slot_0_37_0.double_tap_fl:override()
	slot_0_37_0.hidden_yaw:override()

	slot_0_51_0.manual_state = 0
	slot_0_51_0.safe_head = false
	slot_0_51_0.predict_yaw = 0
end

slot_0_46_0.ui_tables.antiaim.list:set_callback(function()
	if slot_0_46_0.ui_tables.antiaim.list.value == 1 then
		slot_0_51_0.restore_menu()
		events.createmove:unset(slot_0_51_0.manual_function)
		events.createmove:unset(slot_0_51_0.main_aa)
	else
		events.createmove:set(slot_0_51_0.manual_function)
		events.createmove:set(slot_0_51_0.main_aa)
	end
end, true)
events.shutdown:set(function()
	slot_0_51_0.restore_menu()
end)

slot_0_52_0 = {
	hitgroup_str = {
		[0] = "generic",
		"head",
		"chest",
		"stomach",
		"left arm",
		"right arm",
		"left leg",
		"right leg",
		"neck",
		"generic",
		"dormant"
	},
	last_bullet_impact = {},
	shot_array = {},
	dormant_memory = {},
	spread_check = function(arg_342_0)
		if not arg_342_0 or not arg_342_0.shot_info or not arg_342_0.bullet_impact_info then
			return 0
		end

		local var_342_0 = slot_0_41_0(arg_342_0.shot_info.l_pos, arg_342_0.bullet_impact_info.vector)

		return slot_0_11_0(var_342_0.y - arg_342_0.shot_info.viewangles.y) + slot_0_11_0(var_342_0.x - arg_342_0.shot_info.viewangles.x)
	end
}

function slot_0_52_0.dormant_shot(arg_343_0)
	if not slot_0_52_0.shot_array[#slot_0_52_0.shot_array] or slot_0_52_0.shot_array[#slot_0_52_0.shot_array].tickcount ~= globals.tickcount then
		slot_0_52_0.shot_array[#slot_0_52_0.shot_array + 1] = {
			tickcount = globals.tickcount,
			shot_info = arg_343_0
		}
	end
end

function slot_0_52_0.dormant_bullet_impact(arg_344_0)
	if #slot_0_52_0.shot_array == 0 then
		return
	end

	if entity.get(arg_344_0.userid, true) ~= slot_0_40_0.ref then
		return
	end

	local var_344_0 = vector(arg_344_0.x, arg_344_0.y, arg_344_0.z)

	if not slot_0_52_0.last_bullet_impact.tickcount or slot_0_52_0.last_bullet_impact.tickcount ~= globals.tickcount then
		slot_0_52_0.last_bullet_impact = {
			tickcount = globals.tickcount,
			vector = var_344_0
		}
		slot_0_52_0.shot_array[1].bullet_impact_info = slot_0_52_0.last_bullet_impact
		slot_0_52_0.shot_array[1].bullet_impact_tickcount = globals.tickcount
	end
end

function slot_0_52_0.dormant_player_hurt(arg_345_0)
	if #slot_0_52_0.shot_array == 0 then
		return
	end

	local var_345_0 = entity.get(arg_345_0.userid, true)

	if not var_345_0 or var_345_0 == slot_0_40_0.ref then
		return
	end

	if entity.get(arg_345_0.attacker, true) ~= slot_0_40_0.ref then
		return
	end

	slot_0_52_0.shot_array[1].player_hurt_info = {
		damage = arg_345_0.dmg_health,
		hitgroup = arg_345_0.hitgroup
	}
end

function slot_0_52_0.dormant_registered_shot()
	if #slot_0_52_0.shot_array == 0 then
		return
	end

	local var_346_0 = utils.net_channel()

	for iter_346_0 = 1, #slot_0_52_0.shot_array do
		if not slot_0_52_0.shot_array[iter_346_0] then
			-- block empty
		else
			local var_346_1 = slot_0_52_0.shot_array[iter_346_0]
			local var_346_2 = (var_346_0.latency[0] + var_346_0.latency[1]) / globals.tickinterval + 20
			local var_346_3 = entity.get(var_346_1.shot_info.index)

			if var_346_1.tickcount + var_346_2 < globals.tickcount then
				slot_0_5_0(slot_0_52_0.shot_array, iter_346_0)
			elseif not var_346_1.bullet_impact_tickcount then
				-- block empty
			else
				if var_346_1.player_hurt_info then
					local var_346_4 = {
						wanted_hitgroup = 10,
						backtrack = 0,
						target = var_346_3,
						damage = var_346_1.player_hurt_info.damage,
						hitchance = var_346_1.shot_info.hitchance,
						hitgroup = var_346_1.player_hurt_info.hitgroup,
						wanted_damage = var_346_1.shot_info.damage
					}

					slot_0_31_0.register_hitlog(var_346_4)

					if slot_0_46_0.ui_tables.visuals.hitmarker_switch.value then
						slot_0_4_0(slot_0_31_0.hitmarkers_list, #slot_0_31_0.hitmarkers_list, {
							color = "hit",
							alpha = 0.1,
							pos = var_346_1.shot_info.shooting_pos,
							reason = var_346_1.player_hurt_info.damage,
							curtime = globals.curtime
						})
					end
				else
					local var_346_5 = slot_0_52_0.spread_check(var_346_1)

					if var_346_5 < 2.5 or var_346_5 > 50 then
						slot_0_52_0.dormant_memory[var_346_1.shot_info.index].miss_pos = entity.get(var_346_1.shot_info.index):get_origin()

						local var_346_6 = {
							state = "dormancy",
							wanted_hitgroup = 10,
							wanted_damage = 0,
							hitgroup = 3,
							damage = 0,
							backtrack = 0,
							target = var_346_3,
							hitchance = var_346_1.shot_info.hitchance
						}

						slot_0_31_0.register_hitlog(var_346_6)

						if slot_0_46_0.ui_tables.visuals.hitmarker_switch.value then
							slot_0_4_0(slot_0_31_0.hitmarkers_list, #slot_0_31_0.hitmarkers_list, {
								color = "dormancy",
								alpha = 0.1,
								reason = "DORMANCY",
								pos = var_346_1.shot_info.shooting_pos,
								curtime = globals.curtime
							})
						end
					else
						local var_346_7 = {
							state = "spread",
							wanted_hitgroup = 10,
							wanted_damage = 0,
							hitgroup = 3,
							damage = 0,
							backtrack = 0,
							target = var_346_3,
							hitchance = var_346_1.shot_info.hitchance
						}

						slot_0_31_0.register_hitlog(var_346_7)

						if slot_0_46_0.ui_tables.visuals.hitmarker_switch.value then
							slot_0_4_0(slot_0_31_0.hitmarkers_list, #slot_0_31_0.hitmarkers_list, {
								color = "spread",
								alpha = 0.1,
								reason = "SPREAD",
								pos = var_346_1.shot_info.shooting_pos,
								curtime = globals.curtime
							})
						end
					end
				end

				slot_0_5_0(slot_0_52_0.shot_array, iter_346_0)
			end
		end
	end
end

function slot_0_52_0.hitchance_calc(arg_347_0, arg_347_1, arg_347_2)
	local var_347_0 = 0
	local var_347_1 = slot_0_23_0()
	local var_347_2 = var_347_1:get_eye_position()
	local var_347_3 = var_347_1:get_player_weapon()
	local var_347_4 = (var_347_3:get_inaccuracy() + var_347_3:get_spread()) * 1
	local var_347_5 = slot_0_41_0(var_347_2, arg_347_2)

	for iter_347_0 = 0, 128 do
		local var_347_6 = var_347_2 + (arg_347_0 + vector(utils.random_float(-var_347_4, var_347_4), utils.random_float(-var_347_4, var_347_4), utils.random_float(-var_347_4, var_347_4))) * #arg_347_1
		local var_347_7, var_347_8 = utils.trace_bullet(var_347_1, var_347_2, var_347_6)
		local var_347_9 = var_347_5 - slot_0_41_0(var_347_2, var_347_8.end_pos)

		if math.abs(var_347_9.x) + math.abs(var_347_9.y) < 2 then
			var_347_0 = var_347_0 + 1
		end
	end

	return var_347_0 / 128 * 100
end

function slot_0_52_0.save_pos_on_death(arg_348_0)
	local var_348_0 = entity.get(arg_348_0.userid, true)
	local var_348_1 = var_348_0:get_index()
	local var_348_2 = slot_0_52_0.dormant_memory[var_348_1]

	if var_348_0:is_enemy() then
		if not var_348_2 then
			slot_0_52_0.dormant_memory[var_348_1] = {}
			slot_0_52_0.dormant_memory[var_348_1].miss_pos = var_348_0:get_origin()
			slot_0_52_0.dormant_memory[var_348_1].last_pos = vector(0, 0, 0)
			slot_0_52_0.dormant_memory[var_348_1].last_update = globals.tickcount
			slot_0_52_0.dormant_memory[var_348_1].last_alpha = 0

			local var_348_3 = slot_0_52_0.dormant_memory[var_348_1]
		else
			slot_0_52_0.dormant_memory[var_348_1].miss_pos = var_348_0:get_origin()
		end
	end
end

events.player_death:set(slot_0_52_0.save_pos_on_death)
events.player_connect_full:set(slot_0_52_0.save_pos_on_death)
events.player_team:set(slot_0_52_0.save_pos_on_death)
events.round_start:set(function()
	local var_349_0 = entity.get_players(true, true)

	for iter_349_0 = 1, #var_349_0 do
		local var_349_1 = var_349_0[iter_349_0]

		if not var_349_1 then
			-- block empty
		else
			local var_349_2 = var_349_1:get_index()
			local var_349_3 = slot_0_52_0.dormant_memory[var_349_2]

			if var_349_1:is_enemy() then
				if not var_349_3 then
					slot_0_52_0.dormant_memory[var_349_2] = {}
					slot_0_52_0.dormant_memory[var_349_2].miss_pos = var_349_1:get_origin()
					slot_0_52_0.dormant_memory[var_349_2].last_pos = vector(0, 0, 0)
					slot_0_52_0.dormant_memory[var_349_2].last_update = globals.tickcount
					slot_0_52_0.dormant_memory[var_349_2].last_alpha = 0

					local var_349_4 = slot_0_52_0.dormant_memory[var_349_2]
				else
					slot_0_52_0.dormant_memory[var_349_2].miss_pos = var_349_1:get_origin()
				end
			end
		end
	end
end)

slot_0_52_0.dormant_weapons = {
	[38] = true,
	[40] = true,
	[64] = true,
	[11] = true,
	[9] = true
}
slot_0_53_0 = 0

function slot_0_52_0.dormant_aimbot_func(arg_350_0)
	if entity.get_game_rules().m_fRoundStartTime + 1 > globals.curtime then
		return
	end

	slot_350_1_0 = slot_0_40_0.ref
	slot_350_2_0 = slot_350_1_0:get_eye_position()
	slot_350_3_0 = slot_0_40_0.velocity
	slot_350_4_0 = slot_0_40_0.ground_tickcount > 1
	slot_350_5_0 = slot_0_40_0.crouching
	slot_350_6_0 = rage.exploit:get()
	slot_350_7_0 = slot_0_35_0.dmg:get()
	slot_350_7_0 = slot_0_46_0.ui_tables.ragebot.dormant_dmgswitch.value and slot_350_7_0 or slot_0_46_0.ui_tables.ragebot.dormant_dmg.value
	slot_350_8_0 = slot_350_1_0:get_player_weapon()

	if not slot_350_8_0 then
		return
	end

	slot_350_9_0 = slot_350_8_0:get_weapon_index()

	if not slot_0_52_0.dormant_weapons[slot_350_9_0] then
		return
	end

	if slot_350_8_0.m_flNextSecondaryAttack and slot_350_8_0.m_flNextSecondaryAttack - globals.curtime > 0 and slot_0_53_0 < 17 then
		slot_0_53_0 = slot_0_53_0 + 1
	else
		slot_0_53_0 = 0
	end

	slot_350_10_0 = slot_0_35_0.hide_shots:get() and 0.05 or 0
	slot_350_10_0 = slot_0_35_0.double_tap:get() and 0 or slot_350_10_0

	if slot_350_8_0.m_iClip1 == 0 then
		return
	end

	if slot_350_8_0.m_flNextPrimaryAttack + slot_350_10_0 > globals.curtime then
		return
	end

	slot_350_11_0 = slot_350_1_0.m_flDuckAmount
	slot_350_12_0 = slot_0_35_0.fakeduck:get() and slot_350_11_0 > 0.8 or true
	slot_350_13_0 = slot_0_35_0.double_tap:get() and 1 or 0
	slot_350_14_0 = entity.get_players(true, true)

	for iter_350_0 = 1, #slot_350_14_0 do
		slot_350_19_0 = slot_350_14_0[iter_350_0]

		if not slot_350_19_0 then
			-- block empty
		else
			slot_350_20_0 = slot_350_19_0:get_index()
			slot_350_21_0 = slot_0_52_0.dormant_memory[slot_350_20_0]

			if not slot_350_21_0 then
				slot_0_52_0.dormant_memory[slot_350_20_0] = {}
				slot_0_52_0.dormant_memory[slot_350_20_0].miss_pos = vector(0, 0, 0)
				slot_0_52_0.dormant_memory[slot_350_20_0].last_pos = vector(0, 0, 0)
				slot_0_52_0.dormant_memory[slot_350_20_0].last_update = globals.tickcount
				slot_0_52_0.dormant_memory[slot_350_20_0].last_alpha = 0
				slot_350_21_0 = slot_0_52_0.dormant_memory[slot_350_20_0]
			end

			if not slot_350_19_0:is_alive() then
				-- block empty
			else
				slot_350_22_0 = slot_350_19_0:get_network_state()

				if slot_350_22_0 == 0 or slot_350_22_0 == 1 then
					slot_350_21_0.miss_pos = vector(0, 0, 0)
					slot_0_52_0.dormant_memory[slot_350_20_0].last_update = globals.tickcount
				else
					slot_350_23_0 = slot_350_19_0:get_bbox()

					if slot_0_52_0.dormant_memory[slot_350_20_0].last_alpha ~= 1 and slot_350_23_0.alpha == 1 then
						slot_350_21_0.miss_pos = vector(0, 0, 0)
						slot_0_52_0.dormant_memory[slot_350_20_0].last_update = globals.tickcount
					end

					slot_0_52_0.dormant_memory[slot_350_20_0].last_alpha = slot_350_23_0.alpha
					slot_350_24_0 = slot_350_19_0:get_origin()
					slot_350_25_0 = slot_350_19_0.m_vecMaxs
					slot_350_26_0 = slot_350_19_0.m_vecMins
					slot_350_25_0 = slot_350_25_0 == vector(0, 0, 0) and vector(16, 16, 72) or slot_350_25_0
					slot_350_26_0 = slot_350_26_0 == vector(0, 0, 0) and vector(-16, -16, 0) or slot_350_26_0
					slot_350_27_0 = slot_350_24_0 + vector((slot_350_26_0.x + slot_350_25_0.x) / 4, (slot_350_26_0.y + slot_350_25_0.y) / 16, slot_350_26_0.z)

					if slot_350_24_0:dist(slot_350_21_0.miss_pos) < 5 then
						-- block empty
					else
						slot_350_28_0 = {
							{
								damage = 0,
								pos = vector(0, 0, 0),
								scale = vector(0, 0, slot_350_25_0.z / 1.8)
							},
							{
								damage = 0,
								pos = vector(0, 0, 0),
								scale = vector(0, 0, slot_350_25_0.z / 1.35)
							}
						}

						for iter_350_1 = 1, 2 do
							slot_350_33_0 = slot_350_28_0[iter_350_1]
							slot_350_34_0, slot_350_35_0 = utils.trace_bullet(slot_350_1_0, slot_350_2_0, slot_350_27_0 + slot_350_33_0.scale)
							slot_350_28_0[iter_350_1].pos = slot_350_27_0 + slot_350_33_0.scale
							slot_350_28_0[iter_350_1].damage = slot_350_35_0.entity ~= entity.get(0) and (slot_350_35_0.entity == slot_350_19_0 and slot_350_34_0 or 0) or slot_350_34_0
						end

						slot_350_29_0 = 0
						slot_350_30_0 = {
							index = slot_350_19_0:get_index(),
							l_pos = slot_350_2_0,
							player_pos = slot_350_27_0
						}

						if slot_350_28_0[2].damage > slot_350_28_0[1].damage then
							slot_350_27_0 = slot_350_28_0[2].pos
							slot_350_29_0 = slot_350_28_0[2].damage
						else
							slot_350_27_0 = slot_350_28_0[1].pos
							slot_350_29_0 = slot_350_28_0[1].damage
						end

						if slot_350_29_0 <= 0 or slot_350_29_0 < slot_350_7_0 then
							-- block empty
						else
							if slot_350_9_0 ~= 64 and not slot_350_1_0.m_bIsScoped then
								arg_350_0.buttons = slot_0_15_0(arg_350_0.buttons, slot_0_32_0.flags.IN_ZOOM)

								return
							end

							slot_0_52_0.player_pos_visual = slot_350_27_0
							slot_350_31_0 = slot_0_41_0(slot_350_2_0, slot_350_27_0)
							slot_350_32_0 = slot_0_12_0(slot_0_52_0.hitchance_calc(vector():angles(slot_350_31_0), slot_350_2_0 - slot_350_27_0, slot_350_27_0))
							arg_350_0.block_movement = 1

							if slot_350_32_0 >= (slot_350_4_0 and 70 or 40) and slot_350_12_0 then
								arg_350_0.view_angles.x = slot_350_31_0.x
								arg_350_0.view_angles.y = slot_350_31_0.y
								arg_350_0.view_angles.z = 0
								slot_350_30_0.viewangles = arg_350_0.view_angles
								slot_350_30_0.hitchance = slot_350_32_0
								slot_350_30_0.shooting_pos = slot_350_27_0
								slot_350_30_0.damage = slot_350_29_0

								if slot_350_9_0 ~= 64 or slot_0_53_0 > 16 - slot_350_13_0 and slot_0_53_0 < 18 - slot_350_13_0 then
									arg_350_0.buttons = slot_0_15_0(arg_350_0.buttons, 1)

									if slot_350_9_0 ~= 64 or slot_0_53_0 == 17 - slot_350_13_0 then
										slot_0_52_0.dormant_shot(slot_350_30_0)
									end
								end

								break
							else
								return
							end
						end
					end
				end
			end
		end
	end
end

slot_0_46_0.ui_tables.ragebot.dormant_switch:set_callback(function()
	if slot_0_46_0.ui_tables.ragebot.dormant_switch.value then
		events.createmove:set(slot_0_52_0.dormant_aimbot_func)
		events.bullet_impact:set(slot_0_52_0.dormant_bullet_impact)
		events.player_hurt:set(slot_0_52_0.dormant_player_hurt)
		events.render:set(slot_0_52_0.dormant_registered_shot)
		ui.find("Aimbot", "Ragebot", "Main", "Enabled", "Dormant Aimbot"):override(false)
	else
		events.createmove:unset(slot_0_52_0.dormant_aimbot_func)
		events.bullet_impact:unset(slot_0_52_0.dormant_bullet_impact)
		events.player_hurt:unset(slot_0_52_0.dormant_player_hurt)
		events.render:unset(slot_0_52_0.dormant_registered_shot)
		ui.find("Aimbot", "Ragebot", "Main", "Enabled", "Dormant Aimbot"):override()
	end
end, true)
events.shutdown:set(function()
	ui.find("Aimbot", "Ragebot", "Main", "Enabled", "Dormant Aimbot"):override()
end)

slot_0_52_0.ai_cache = {}

function slot_0_52_0.go_to_pos(arg_353_0, arg_353_1)
	local var_353_0 = slot_0_40_0.ref:get_origin()
	local var_353_1 = var_353_0.x - arg_353_1.x
	local var_353_2 = var_353_0.y - arg_353_1.y
	local var_353_3 = render.camera_angles().y

	arg_353_0.forwardmove = -22 * (var_353_1 * slot_0_10_0(var_353_3 / 180 * slot_0_8_0) + var_353_2 * slot_0_9_0(var_353_3 / 180 * slot_0_8_0))
	arg_353_0.sidemove = 22 * (var_353_2 * slot_0_10_0(var_353_3 / 180 * slot_0_8_0) - var_353_1 * slot_0_9_0(var_353_3 / 180 * slot_0_8_0))
end

slot_0_54_0 = {}
slot_0_52_0.ai_peek_start_pos = nil
slot_0_52_0.ai_peek_side = nil
slot_0_52_0.ai_peek_ent_idx = nil
slot_0_52_0.ai_peek_cache_tickcount = 0
slot_0_52_0.ai_peek_cache_dt = nil
slot_0_52_0.ai_peek_damage_tick_cache = 0
slot_0_52_0.ai_peek_shoot_points = nil

function slot_0_52_0.ai_peek_func(arg_354_0)
	slot_354_1_0 = slot_0_40_0.ref
	slot_354_2_0 = slot_354_1_0:get_origin()

	if not slot_0_52_0.ai_peek_start_pos then
		slot_0_52_0.ai_peek_start_pos = slot_354_2_0
	end

	if not entity.get_threat() or slot_0_40_0.ground_tickcount <= 1 then
		slot_0_54_0 = {}

		return
	end

	slot_354_4_0 = slot_354_1_0:get_player_weapon()

	if not slot_354_4_0 then
		return
	end

	slot_354_5_0 = slot_354_1_0.m_vecMins
	slot_354_6_0 = slot_354_1_0.m_vecMaxs
	slot_354_7_0 = rage.antiaim:get_target()
	slot_354_8_0 = slot_354_1_0:get_eye_position()
	slot_0_54_0 = {}

	for iter_354_0 = 0, 1 do
		slot_354_13_1 = nil
		slot_354_14_1 = slot_0_52_0.ai_peek_start_pos
		slot_354_15_1 = slot_0_52_0.ai_peek_side ~= nil and 5 or slot_0_46_0.ui_tables.ragebot.aipeek_dist.value

		if slot_0_52_0.ai_peek_side ~= nil then
			if slot_0_52_0.ai_peek_side == 0 then
				slot_354_13_1 = vector():angles(0, slot_354_7_0 - 90, 0)
				slot_354_14_1 = slot_0_21_0(slot_354_14_1, slot_354_14_1 + slot_354_13_1 * slot_354_15_1 / 2, slot_354_1_0, nil, 1).end_pos
			else
				slot_354_13_1 = vector():angles(0, slot_354_7_0 + 90, 0)
				slot_354_14_1 = slot_0_21_0(slot_354_14_1, slot_354_14_1 + slot_354_13_1 * slot_354_15_1 / 2, slot_354_1_0, nil, 1).end_pos
			end
		elseif iter_354_0 == 0 then
			slot_354_13_1 = vector():angles(0, slot_354_7_0 - 90, 0)
			slot_354_14_1 = slot_0_21_0(slot_354_14_1, slot_354_14_1 + slot_354_13_1 * slot_354_15_1, slot_354_1_0, nil, 1).end_pos
		else
			slot_354_13_1 = vector():angles(0, slot_354_7_0 + 90, 0)
			slot_354_14_1 = slot_0_21_0(slot_354_14_1, slot_354_14_1 + slot_354_13_1 * slot_354_15_1, slot_354_1_0, nil, 1).end_pos
		end

		slot_354_16_1 = slot_354_14_1
		slot_354_17_1 = slot_354_1_0:simulate_movement(slot_0_52_0.ai_peek_start_pos, vector(0, 0, 0))

		slot_354_17_1:think(1)

		slot_354_18_2 = slot_354_17_1.view_offset
		slot_354_16_1.z = slot_354_16_1.z + slot_354_18_2

		for iter_354_1 = 0, slot_0_52_0.ai_peek_side ~= nil and 6 or 0 do
			slot_354_23_1 = slot_0_52_0.ai_peek_side ~= nil and slot_354_16_1 + slot_354_13_1 * slot_0_46_0.ui_tables.ragebot.aipeek_dist.value / 7 or slot_354_16_1
			slot_354_24_3 = slot_0_21_0(slot_354_16_1, slot_354_23_1, slot_354_1_0, nil, 1)
			slot_354_25_4 = slot_0_21_0(slot_354_24_3.end_pos, slot_354_24_3.end_pos - vector(0, 0, slot_354_18_2 + 50), slot_354_1_0, nil, 0)
			slot_354_26_1 = slot_354_24_3.end_pos
			slot_354_16_1 = slot_354_26_1
			slot_354_26_1.z = slot_354_8_0.z

			slot_0_4_0(slot_0_54_0, {
				pos = slot_354_26_1,
				side = slot_0_52_0.ai_peek_side ~= nil and slot_0_52_0.ai_peek_side or iter_354_0
			})

			if slot_0_52_0.ai_peek_side ~= nil and slot_354_24_3.fraction ~= 1 then
				break
			end
		end

		if slot_0_52_0.ai_peek_side then
			break
		end
	end

	weap_type = slot_354_4_0:get_weapon_info().weapon_type
	weap_type = weap_type ~= 0 and weap_type ~= 9 and weap_type ~= 7 and weap_type ~= 11

	if slot_0_46_0.ui_tables.ragebot.aipeek_keys.value and (arg_354_0.sidemove ~= 0 or arg_354_0.forwardmove ~= 0) then
		return
	end

	if slot_0_46_0.ui_tables.ragebot.aipeek_dt.value and slot_0_37_0.double_tap.value and rage.exploit:get() ~= 1 then
		return
	end

	if slot_354_4_0.m_iIronSightMode == 2 or slot_354_4_0.m_flNextPrimaryAttack > globals.curtime or not weap_type or slot_354_4_0.m_iClip1 == 0 then
		slot_0_52_0.ai_cache = {}
		slot_0_52_0.ai_peek_damage_tick_cache = 0
		slot_0_52_0.ai_peek_shoot_points = nil

		return
	end

	slot_354_9_0 = entity.get_players(true)
	slot_354_10_0 = nil
	slot_354_11_0 = globals.tickcount
	slot_354_12_0 = math.max(slot_0_35_0.dmg:get() - 5, 5)
	slot_354_13_0 = {}
	slot_354_14_0 = entity.get_players()

	for iter_354_2 = 1, #slot_354_14_0 do
		if not slot_354_14_0[iter_354_2]:is_enemy() then
			slot_0_4_0(slot_354_13_0, slot_354_14_0[iter_354_2])
		end
	end

	slot_354_15_0 = slot_0_35_0.hitboxes:get(1)
	slot_354_16_0 = slot_0_35_0.hitboxes:get(2)
	slot_354_17_0 = slot_0_35_0.hitboxes:get(3)
	slot_354_18_0 = slot_0_46_0.ui_tables.ragebot.aipeek_delay.value

	if slot_0_52_0.ai_peek_ent_idx then
		slot_354_19_0 = entity.get(slot_0_52_0.ai_peek_ent_idx)
		slot_354_20_0 = slot_0_52_0.ai_peek_ent_idx

		if slot_354_19_0 and slot_354_19_0:is_alive() and not slot_354_19_0:is_dormant() then
			slot_354_21_1 = slot_354_19_0:get_simulation_time()
			slot_354_22_2 = slot_354_21_1.current - slot_354_21_1.old

			if not slot_0_52_0.ai_cache[slot_354_20_0] then
				slot_0_52_0.ai_cache[slot_354_20_0] = {
					tickcount = 0,
					backtrack = {}
				}
			end

			if slot_354_22_2 <= -0.01 then
				slot_0_52_0.ai_cache[slot_354_20_0].tickcount = slot_354_11_0 + 12
			end

			if (slot_0_52_0.ai_cache[slot_354_20_0].tickcount and slot_354_11_0 < slot_0_52_0.ai_cache[slot_354_20_0].tickcount or false) and slot_354_19_0.m_hGroundEntity then
				slot_354_24_2 = {}

				if slot_354_16_0 then
					slot_354_24_2[#slot_354_24_2 + 1] = slot_354_19_0:get_hitbox_position(5)
				end

				if slot_354_17_0 then
					slot_354_24_2[#slot_354_24_2 + 1] = slot_354_19_0:get_hitbox_position(2)
				end

				if #slot_354_24_2 == 0 then
					return
				end

				for iter_354_3 = 1, #slot_0_54_0 do
					for iter_354_4 = 1, #slot_354_24_2 do
						slot_354_33_3, slot_354_34_1 = utils.trace_bullet(slot_354_1_0, slot_0_54_0[iter_354_3].pos, slot_354_24_2[iter_354_4], slot_354_1_0)

						if slot_354_34_1.entity and slot_354_34_1.entity == slot_354_19_0 and slot_354_33_3 >= math.min(slot_354_12_0, slot_354_19_0.m_iHealth) then
							slot_354_10_0 = {
								pos = slot_0_54_0[iter_354_3].pos,
								hitbox_pos = slot_354_24_2[iter_354_4],
								side = slot_0_54_0[iter_354_3].side
							}

							break
						end
					end

					if slot_354_10_0 then
						break
					end
				end
			else
				slot_0_52_0.ai_cache[slot_354_20_0].hitbox_def = nil
				slot_354_24_1 = {}

				if slot_354_15_0 then
					slot_354_25_3 = slot_354_19_0:get_hitbox_position(0)
					slot_354_25_3.z = slot_354_25_3.z + 2
					slot_354_24_1[#slot_354_24_1 + 1] = slot_354_25_3
				end

				if slot_354_16_0 then
					slot_354_24_1[#slot_354_24_1 + 1] = slot_354_19_0:get_hitbox_position(5)
				end

				if slot_354_17_0 then
					slot_354_24_1[#slot_354_24_1 + 1] = slot_354_19_0:get_hitbox_position(2)
				end

				if #slot_354_24_1 == 0 then
					return
				end

				if slot_354_22_2 ~= 0 and slot_354_19_0.m_vecVelocity:length2d() < 300 then
					slot_354_25_2 = {}

					if slot_354_16_0 then
						slot_354_25_2[#slot_354_25_2 + 1] = slot_354_19_0:get_hitbox_position(5)
					end

					if slot_354_17_0 then
						slot_354_25_2[#slot_354_25_2 + 1] = slot_354_19_0:get_hitbox_position(2)
					end

					slot_0_4_0(slot_0_52_0.ai_cache[slot_354_20_0].backtrack, 1, {
						hitboxes = slot_354_25_2,
						tickcount = slot_354_11_0
					})
				end

				slot_354_25_1 = slot_0_52_0.ai_cache[slot_354_20_0].backtrack

				for iter_354_5 = 1, #slot_354_25_1 do
					if slot_0_11_0(slot_354_25_1[iter_354_5].tickcount) - slot_354_11_0 > 20 then
						slot_0_5_0(slot_0_52_0.ai_cache[slot_354_20_0].backtrack, iter_354_5)
					end
				end

				for iter_354_6 = 1, #slot_0_54_0 do
					for iter_354_7 = 1, #slot_354_24_1 do
						slot_354_34_0, slot_354_35_0 = utils.trace_bullet(slot_354_1_0, slot_0_54_0[iter_354_6].pos, slot_354_24_1[iter_354_7], slot_354_1_0)

						if slot_354_35_0.entity and slot_354_35_0.entity == slot_354_19_0 and slot_354_34_0 >= math.min(slot_354_12_0, slot_354_19_0.m_iHealth) then
							slot_354_10_0 = {
								pos = slot_0_54_0[iter_354_6].pos,
								hitbox_pos = slot_354_24_1[iter_354_7],
								side = slot_0_54_0[iter_354_6].side
							}

							break
						end
					end

					if slot_354_10_0 then
						break
					end
				end
			end
		end

		slot_354_21_0 = slot_354_19_0 and slot_354_19_0:is_alive()
		slot_354_22_1 = slot_354_19_0 and slot_354_19_0:is_dormant()

		if slot_354_10_0 and slot_354_21_0 and not slot_354_22_1 then
			slot_0_52_0.ai_peek_damage_tick_cache = slot_0_52_0.ai_peek_damage_tick_cache + 1

			if slot_354_18_0 <= slot_0_52_0.ai_peek_damage_tick_cache then
				slot_0_52_0.ai_peek_side = slot_354_10_0.side
				slot_0_52_0.ai_peek_ent_idx = slot_354_20_0
				slot_0_52_0.ai_peek_cache_tickcount = slot_354_11_0
			else
				slot_354_10_0 = nil
			end
		else
			if slot_0_11_0(slot_0_52_0.ai_peek_cache_tickcount - slot_354_11_0) > 25 or not slot_354_21_0 or slot_354_22_1 then
				slot_0_52_0.ai_peek_side = nil
				slot_0_52_0.ai_peek_ent_idx = nil
			end

			slot_0_52_0.ai_peek_damage_tick_cache = 0
		end
	else
		for iter_354_8 = 1, #slot_354_9_0 do
			slot_354_23_0 = slot_354_9_0[iter_354_8]

			if not slot_354_23_0 or not slot_354_23_0:is_alive() or slot_354_23_0:is_dormant() then
				-- block empty
			else
				slot_354_24_0 = slot_354_23_0:get_index()
				slot_354_25_0 = slot_354_23_0:get_simulation_time()
				slot_354_26_0 = slot_354_25_0.current - slot_354_25_0.old

				if not slot_0_52_0.ai_cache[slot_354_24_0] then
					slot_0_52_0.ai_cache[slot_354_24_0] = {
						trigger_tickcount = 0,
						tickcount = 0,
						backtrack = {}
					}
				end

				if slot_354_26_0 <= -0.01 then
					slot_0_52_0.ai_cache[slot_354_24_0].tickcount = slot_354_11_0 + 12
				end

				if slot_354_11_0 < slot_0_52_0.ai_cache[slot_354_24_0].tickcount and slot_354_23_0.m_hGroundEntity then
					slot_354_28_2 = {}

					if slot_354_16_0 then
						slot_354_28_2[#slot_354_28_2 + 1] = slot_354_23_0:get_hitbox_position(5)
					end

					if slot_354_17_0 then
						slot_354_28_2[#slot_354_28_2 + 1] = slot_354_23_0:get_hitbox_position(2)
					end

					if #slot_354_28_2 == 0 then
						return
					end

					for iter_354_9 = 1, #slot_0_54_0 do
						for iter_354_10 = 1, #slot_354_28_2 do
							slot_354_37_1, slot_354_38_1 = utils.trace_bullet(slot_354_1_0, slot_0_54_0[iter_354_9].pos, slot_354_28_2[iter_354_10], slot_354_1_0)

							if slot_354_38_1.entity and slot_354_38_1.entity == slot_354_23_0 and slot_354_37_1 >= math.min(slot_354_12_0, slot_354_23_0.m_iHealth) then
								slot_354_10_0 = {
									pos = slot_0_54_0[iter_354_9].pos,
									hitbox_pos = slot_354_28_2[iter_354_10],
									side = slot_0_54_0[iter_354_9].side
								}

								break
							end
						end

						if slot_354_10_0 then
							break
						end
					end
				else
					slot_0_52_0.ai_cache[slot_354_24_0].hitbox_def = nil
					slot_354_28_1 = {}

					if slot_354_15_0 then
						slot_354_29_3 = slot_354_23_0:get_hitbox_position(0)
						slot_354_29_3.z = slot_354_29_3.z + 2
						slot_354_28_1[#slot_354_28_1 + 1] = slot_354_29_3
					end

					if slot_354_16_0 then
						slot_354_28_1[#slot_354_28_1 + 1] = slot_354_23_0:get_hitbox_position(5)
					end

					if slot_354_17_0 then
						slot_354_28_1[#slot_354_28_1 + 1] = slot_354_23_0:get_hitbox_position(2)
					end

					if #slot_354_28_1 == 0 then
						return
					end

					if slot_354_26_0 ~= 0 and slot_354_23_0.m_vecVelocity:length2d() < 300 then
						slot_354_29_2 = {}

						if slot_354_16_0 then
							slot_354_29_2[#slot_354_29_2 + 1] = slot_354_23_0:get_hitbox_position(5)
						end

						if slot_354_17_0 then
							slot_354_29_2[#slot_354_29_2 + 1] = slot_354_23_0:get_hitbox_position(2)
						end

						slot_0_4_0(slot_0_52_0.ai_cache[slot_354_24_0].backtrack, 1, {
							hitboxes = slot_354_29_2,
							tickcount = slot_354_11_0
						})
					end

					slot_354_29_1 = slot_0_52_0.ai_cache[slot_354_24_0].backtrack

					for iter_354_11 = 1, #slot_354_29_1 do
						if slot_0_11_0(slot_354_29_1[iter_354_11].tickcount) - slot_354_11_0 > 20 then
							slot_0_5_0(slot_0_52_0.ai_cache[slot_354_24_0].backtrack, iter_354_11)
						end
					end

					for iter_354_12 = 1, #slot_0_54_0 do
						for iter_354_13 = 1, #slot_354_28_1 do
							slot_354_38_0, slot_354_39_0 = utils.trace_bullet(slot_354_1_0, slot_0_54_0[iter_354_12].pos, slot_354_28_1[iter_354_13], slot_354_1_0)

							if slot_354_39_0.entity and slot_354_39_0.entity == slot_354_23_0 and slot_354_38_0 >= math.min(slot_354_12_0, slot_354_23_0.m_iHealth) then
								slot_354_10_0 = {
									pos = slot_0_54_0[iter_354_12].pos,
									hitbox_pos = slot_354_28_1[iter_354_13],
									side = slot_0_54_0[iter_354_12].side
								}

								break
							end
						end

						if slot_354_10_0 then
							break
						end
					end
				end

				slot_354_28_0 = slot_354_23_0:is_alive()
				slot_354_29_0 = slot_354_23_0:is_dormant()

				if slot_354_10_0 and slot_354_28_0 and not slot_354_29_0 then
					slot_0_52_0.ai_peek_side = slot_354_10_0.side
					slot_0_52_0.ai_peek_ent_idx = slot_354_24_0
					slot_0_52_0.ai_peek_cache_tickcount = slot_354_11_0
					slot_354_10_0 = nil

					break
				elseif slot_0_11_0(slot_0_52_0.ai_peek_cache_tickcount - slot_354_11_0) > 25 or not slot_354_28_0 or slot_354_29_0 then
					slot_0_52_0.ai_peek_side = nil
					slot_0_52_0.ai_peek_ent_idx = nil
				end
			end
		end
	end

	if slot_354_10_0 then
		slot_0_52_0.go_to_pos(arg_354_0, slot_354_10_0.pos)
	elseif slot_0_52_0.ai_peek_start_pos:dist(slot_354_2_0) > 3 then
		slot_0_52_0.go_to_pos(arg_354_0, slot_0_52_0.ai_peek_start_pos)

		if slot_354_10_0 ~= slot_0_52_0.ai_peek_cache_dt and rage.exploit:get() == 1 then
			rage.exploit:force_teleport()
		end
	end

	slot_0_52_0.ai_peek_shoot_points = slot_354_10_0
	slot_0_52_0.ai_peek_cache_dt = slot_354_10_0
end

function slot_0_52_0.ai_peek_visualize(arg_355_0)
	if #slot_0_54_0 <= 1 then
		return
	end

	local var_355_0 = (slot_0_54_0[1].pos - slot_0_54_0[2].pos):normalized() + vector():angles(0, -90, 0)
	local var_355_1 = slot_0_52_0.ai_peek_ent_idx

	if slot_0_52_0.ai_peek_shoot_points and slot_0_52_0.ai_peek_shoot_points.hitbox_pos and slot_0_52_0.ai_peek_shoot_points.pos then
		local var_355_2 = slot_0_52_0.ai_peek_shoot_points.pos:to_screen()
		local var_355_3 = slot_0_52_0.ai_peek_shoot_points.hitbox_pos:to_screen()

		render.circle_3d(slot_0_52_0.ai_peek_shoot_points.hitbox_pos, color(255, 0, 0), 2, 0, 1)
		render.circle_3d(slot_0_52_0.ai_peek_shoot_points.pos, color(0, 255, 0), 2, 0, 1)

		if var_355_2 and var_355_3 then
			render.line(var_355_2, var_355_3, color(0, 255, 0))
		end
	end

	if slot_0_46_0.ui_tables.ragebot.aipeek_vis.value then
		for iter_355_0 = 1, #slot_0_54_0 do
			render.circle_3d(slot_0_54_0[iter_355_0].pos, color(255), 2, 0, 1)
		end
	end
end

function slot_0_52_0.ai_peek_on_death(arg_356_0)
	local var_356_0 = entity.get(arg_356_0.userid, true)
	local var_356_1 = var_356_0:get_index()
	local var_356_2 = slot_0_52_0.ai_cache[var_356_1]

	if var_356_0:is_enemy() then
		if not var_356_2 then
			slot_0_52_0.ai_cache[var_356_1] = {
				tickcount = 0,
				backtrack = {}
			}
		else
			slot_0_52_0.ai_cache[var_356_1].backtrack = {}
		end
	end
end

events.player_death:set(slot_0_52_0.save_pos_on_death)
slot_0_46_0.ui_tables.ragebot.aipeek_switch:set_callback(function()
	slot_0_52_0.ai_peek_start_pos = nil

	if slot_0_46_0.ui_tables.ragebot.aipeek_switch.value then
		events.createmove:set(slot_0_52_0.ai_peek_func)
		events.render:set(slot_0_52_0.ai_peek_visualize)
		slot_0_37_0.peek_assist:override(true)
		slot_0_37_0.peek_assist_return:override({
			"On Shot"
		})
	else
		slot_0_52_0.ai_peek_damage_tick_cache = 0

		events.createmove:unset(slot_0_52_0.ai_peek_func)
		events.render:unset(slot_0_52_0.ai_peek_visualize)

		slot_0_52_0.ai_cache = {}

		slot_0_37_0.retreat_mode:override()
		slot_0_37_0.peek_assist:override()

		slot_0_52_0.enemy_point = nil
		slot_0_52_0.ai_peek_side = nil
		slot_0_52_0.ai_peek_ent_idx = nil
		slot_0_52_0.ai_peek_cache_tickcount = 0

		slot_0_37_0.peek_assist_return:override()
	end
end, true)

slot_0_52_0.telep_array = slot_0_46_0.ui_tables.ragebot.discharge_combo.elements_array
slot_0_52_0.telep_func_array = {
	7,
	8,
	8,
	8,
	nil,
	nil,
	nil,
	nil,
	2,
	nil,
	3,
	nil,
	nil,
	nil,
	nil,
	nil,
	5,
	nil,
	nil,
	nil,
	nil,
	nil,
	5,
	5,
	4,
	5,
	4,
	nil,
	4,
	8,
	10,
	8,
	5,
	5,
	4,
	8,
	nil,
	3,
	nil,
	1,
	nil,
	nil,
	nil,
	nil,
	nil,
	nil,
	nil,
	nil,
	nil,
	nil,
	nil,
	nil,
	nil,
	nil,
	nil,
	nil,
	nil,
	nil,
	nil,
	nil,
	8,
	nil,
	8,
	6,
	knife = 9
}
slot_0_52_0.telep_delay_cache = 0
slot_0_52_0.lc_timer = 0
slot_0_52_0.lc_tickbase = 999999

function slot_0_52_0.discharge_func(arg_358_0)
	if not slot_0_35_0.double_tap:get() and slot_0_35_0.hide_shots:get() then
		return
	end

	local var_358_0 = slot_0_40_0.ref
	local var_358_1 = slot_0_40_0.on_ground

	if slot_0_46_0.ui_tables.ragebot.discharge_mode.value == 3 then
		local var_358_2 = var_358_0.m_nTickBase

		if var_358_2 - 3 > slot_0_52_0.lc_tickbase then
			slot_0_52_0.lc_timer = globals.tickcount + 11
		end

		slot_0_52_0.lc_tickbase = var_358_2
	end

	if var_358_1 then
		return
	end

	if slot_0_11_0(slot_0_52_0.telep_delay_cache - globals.curtime) < slot_0_46_0.ui_tables.ragebot.discharge_delay.value / 10 then
		return
	elseif rage.exploit:get() == 0 and slot_0_46_0.ui_tables.ragebot.discharge_delay.value ~= 11 and slot_0_11_0(slot_0_52_0.telep_delay_cache - globals.curtime) < 1.5 then
		rage.exploit:force_charge()
	end

	if rage.exploit:get() ~= 1 then
		return
	end

	if not entity.get_threat(true) then
		return
	end

	local var_358_3 = var_358_0:get_player_weapon()

	if not var_358_3 then
		return
	end

	local var_358_4 = var_358_3:get_weapon_index()

	var_358_4 = var_358_3:get_classname() == "CKnife" and "knife" or var_358_4

	local var_358_5 = slot_0_52_0.telep_func_array[var_358_4]

	if not var_358_5 or not slot_0_46_0.ui_tables.ragebot.discharge_combo.ref:get(var_358_5) then
		return
	end

	if slot_0_46_0.ui_tables.ragebot.discharge_mode.value == 2 then
		local var_358_6 = var_358_0:simulate_movement()

		var_358_6:think(13)

		if var_358_6.velocity.z ~= 0 then
			return
		end

		arg_358_0.in_jump = false
	end

	if slot_0_46_0.ui_tables.ragebot.discharge_mode.value == 3 then
		if slot_0_52_0.lc_timer - globals.tickcount > 0 then
			return
		elseif slot_0_52_0.lc_timer - globals.tickcount < -5 then
			return
		end
	end

	rage.exploit:force_teleport()

	slot_0_52_0.telep_delay_cache = globals.curtime - 0.02
end

slot_0_46_0.ui_tables.ragebot.discharge_switch:set_callback(function()
	if slot_0_46_0.ui_tables.ragebot.discharge_switch.value then
		events.createmove:set(slot_0_52_0.discharge_func)
	else
		events.createmove:unset(slot_0_52_0.discharge_func)
	end
end, true)

slot_0_52_0.anti_def_curtime = 1
slot_0_52_0.anti_def_cache_team = 0
slot_0_52_0.need_join_team = false

function slot_0_52_0.anti_def_func()
	local var_360_0 = slot_0_46_0.ui_tables.ragebot.antidef_switch.value
	local var_360_1 = cvar.cl_lagcompensation
	local var_360_2 = slot_0_38_0(globals.curtime % 0.4, 0.1)
	local var_360_3 = slot_0_23_0()
	local var_360_4 = var_360_3

	if not var_360_3 then
		return
	end

	if var_360_2 == 0 then
		if var_360_2 == slot_0_52_0.anti_def_curtime then
			return
		end

		local var_360_5

		if var_360_4 then
			var_360_5 = var_360_3.m_iTeamNum
		end

		slot_0_52_0.anti_def_curtime = var_360_2

		if var_360_0 and var_360_1:int() ~= 0 then
			if not var_360_4 then
				var_360_1:int(0)

				return
			end

			if var_360_5 ~= 1 then
				slot_0_52_0.anti_def_cache_team = var_360_3.m_iTeamNum

				utils.console_exec("jointeam 1")
			else
				var_360_1:int(0)

				slot_0_52_0.need_join_team = true
			end
		else
			if slot_0_52_0.need_join_team then
				utils.console_exec("jointeam " .. slot_0_52_0.anti_def_cache_team .. " 2")

				slot_0_52_0.need_join_team = false
			end

			if not var_360_0 and var_360_1:int() ~= 1 then
				if not var_360_4 then
					var_360_1:int(1)

					return
				end

				if var_360_5 ~= 1 then
					slot_0_52_0.anti_def_cache_team = var_360_5

					utils.console_exec("jointeam 1")
				else
					var_360_1:int(1)

					slot_0_52_0.need_join_team = true
				end
			end
		end
	else
		slot_0_52_0.anti_def_curtime = 1
	end
end

events.render:set(slot_0_52_0.anti_def_func)

slot_0_52_0.delay = 0

function slot_0_52_0.air_breaklc_func(arg_361_0)
	if not slot_0_35_0.double_tap:get() then
		return
	end

	if slot_0_40_0.on_ground then
		return
	end

	if math.abs(slot_0_52_0.delay - globals.tickcount) > 17 then
		rage.exploit:force_teleport()
	end

	if rage.exploit:get() == 0 then
		rage.exploit:force_charge()
	end

	if rage.exploit:get() < 0.08 then
		slot_0_52_0.delay = globals.tickcount
	end
end

slot_0_46_0.ui_tables.ragebot.air_exploit:set_callback(function()
	if slot_0_46_0.ui_tables.ragebot.air_exploit.value then
		events.createmove:set(slot_0_52_0.air_breaklc_func)
	else
		events.createmove:unset(slot_0_52_0.air_breaklc_func)
	end
end, true)

function slot_0_52_0.rollres_func()
	for iter_363_0 = 1, 64 do
		local var_363_0 = entity.get(iter_363_0)

		if not var_363_0 then
			-- block empty
		elseif not var_363_0:is_enemy() or not var_363_0:is_alive() or var_363_0:is_dormant() then
			-- block empty
		else
			local var_363_1 = slot_0_43_0.m_eye_angle(var_363_0[0])

			var_363_1.z = slot_0_46_0.ui_tables.ragebot.roll_deg.value
			var_363_1.x = slot_0_46_0.ui_tables.ragebot.roll_pitch_switch.value and slot_0_46_0.ui_tables.ragebot.roll_pitch_deg.value or var_363_1.x
		end
	end
end

slot_0_46_0.ui_tables.ragebot.roll_resolver:set_callback(function()
	if slot_0_46_0.ui_tables.ragebot.roll_resolver.value then
		events.net_update_end:set(slot_0_52_0.rollres_func)
	else
		events.net_update_end:unset(slot_0_52_0.rollres_func)
	end
end, true)

function slot_0_52_0.jumpscout_func(arg_365_0)
	local var_365_0 = slot_0_40_0.ref
	local var_365_1 = slot_0_40_0.velocity
	local var_365_2 = arg_365_0.forwardmove ~= 0 or arg_365_0.sidemove ~= 0 or var_365_1 > 100
	local var_365_3 = var_365_0:get_player_weapon()

	if not var_365_3 or var_365_3:get_weapon_index() ~= 40 then
		var_365_2 = true
	end

	if not var_365_2 then
		slot_0_37_0.autostop:override("In Air")
	else
		slot_0_37_0.autostop:override()
	end

	slot_0_37_0.airstrafe:override(var_365_2)
end

slot_0_46_0.ui_tables.ragebot.jumpscout:set_callback(function()
	if slot_0_46_0.ui_tables.ragebot.jumpscout.value then
		utils.execute_after(0.5, function()
			events.createmove:set(slot_0_52_0.jumpscout_func)
		end)
	else
		events.createmove:unset(slot_0_52_0.jumpscout_func)
		slot_0_37_0.airstrafe:override()
	end

	slot_0_37_0.airstrafe:override()
end, true)

slot_0_52_0.hc_func_array = {
	7,
	8,
	8,
	8,
	nil,
	nil,
	nil,
	nil,
	2,
	nil,
	3,
	nil,
	nil,
	nil,
	nil,
	nil,
	5,
	nil,
	nil,
	nil,
	nil,
	nil,
	5,
	5,
	4,
	5,
	4,
	nil,
	4,
	8,
	nil,
	8,
	5,
	5,
	4,
	8,
	nil,
	3,
	nil,
	1,
	nil,
	nil,
	nil,
	nil,
	nil,
	nil,
	nil,
	nil,
	nil,
	nil,
	nil,
	nil,
	nil,
	nil,
	nil,
	nil,
	nil,
	nil,
	nil,
	nil,
	8,
	nil,
	8,
	6
}
slot_0_52_0.hc_isoverriden = false

function slot_0_52_0.hitchance_func()
	local var_368_0 = slot_0_40_0.ref
	local var_368_1 = slot_0_40_0.on_ground

	if var_368_1 then
		if slot_0_52_0.hc_isoverriden then
			slot_0_37_0.hitchance:override()

			slot_0_52_0.hc_isoverriden = false
		end

		return
	end

	local var_368_2 = var_368_0:get_player_weapon()

	if not var_368_2 then
		return
	end

	local var_368_3 = var_368_2:get_weapon_index()
	local var_368_4 = slot_0_52_0.hc_func_array[var_368_3]

	if not var_368_4 then
		if slot_0_52_0.hc_isoverriden then
			slot_0_35_0.hitchance:override()

			slot_0_52_0.hc_isoverriden = false
		end

		return
	end

	local var_368_5 = slot_0_46_0.ui_tables.ragebot["air_" .. var_368_4]

	if not var_368_5 or var_368_5.value <= 0 or var_368_1 then
		if slot_0_52_0.hc_isoverriden then
			slot_0_35_0.hitchance:override()

			slot_0_52_0.hc_isoverriden = false
		end

		return
	end

	slot_0_37_0.hitchance:override(var_368_5.value)

	slot_0_52_0.hc_isoverriden = true
end

events.createmove:set(slot_0_52_0.hitchance_func)
events.shutdown:set(function()
	if slot_0_52_0.hc_isoverriden then
		for iter_369_0 = 1, #slot_0_52_0.refs_hc do
			slot_0_52_0.refs_hc[iter_369_0]:override()
		end

		slot_0_52_0.hc_isoverriden = false
	end
end)

slot_0_52_0.nshc_array = {
	"SSG-08",
	"AWP",
	"AutoSnipers"
}
slot_0_52_0.refs_nshc = {
	ui.find("Aimbot", "Ragebot", "Selection", "AutoSnipers", "Hit Chance"),
	ui.find("Aimbot", "Ragebot", "Selection", "AWP", "Hit Chance"),
	ui.find("Aimbot", "Ragebot", "Selection", "SSG-08", "Hit Chance")
}
slot_0_52_0.refs_s_nshc = {
	ui.find("Aimbot", "Ragebot", "Accuracy", "AutoSnipers", "Auto Scope"),
	ui.find("Aimbot", "Ragebot", "Accuracy", "AWP", "Auto Scope"),
	ui.find("Aimbot", "Ragebot", "Accuracy", "SSG-08", "Auto Scope")
}
slot_0_52_0.hc_func_array = {
	[38] = 3,
	[40] = 1,
	[9] = 2,
	[11] = 3
}
slot_0_52_0.nshc_isoverriden = false

function slot_0_52_0.no_scope_func()
	local var_370_0 = slot_0_40_0.ref
	local var_370_1 = slot_0_40_0.on_ground
	local var_370_2 = entity.get_threat()
	local var_370_3 = 0

	if var_370_2 and var_370_0 then
		var_370_3 = (var_370_0:get_origin() - var_370_2:get_origin()):length() / 100
	end

	local var_370_4 = var_370_0:get_player_weapon()

	if not var_370_4 then
		return
	end

	local var_370_5 = var_370_4:get_weapon_index()
	local var_370_6 = slot_0_52_0.hc_func_array[var_370_5]

	if not var_370_6 then
		if slot_0_52_0.nshc_isoverriden then
			slot_0_35_0.hitchance:override()
			slot_0_35_0.no_scope:override()

			slot_0_52_0.nshc_isoverriden = false
		end

		return
	end

	local var_370_7 = slot_0_46_0.ui_tables.ragebot["noscope_" .. var_370_6]

	if not var_370_2 or not var_370_7 or var_370_7.value <= -1 then
		if slot_0_52_0.nshc_isoverriden then
			slot_0_35_0.hitchance:override()
			slot_0_35_0.no_scope:override()

			slot_0_52_0.nshc_isoverriden = false
		end

		return
	end

	if var_370_0.m_bIsScoped or var_370_3 > slot_0_46_0.ui_tables.ragebot["noscope_dist" .. var_370_6].value / 10 and slot_0_46_0.ui_tables.ragebot["noscope_dist" .. var_370_6].value / 10 < 10.1 then
		if slot_0_52_0.nshc_isoverriden then
			slot_0_35_0.hitchance:override()
			slot_0_35_0.no_scope:override()

			slot_0_52_0.nshc_isoverriden = false
		end

		return
	end

	slot_0_35_0.hitchance:override(var_370_7.value)
	slot_0_35_0.no_scope:override(false)

	slot_0_52_0.nshc_isoverriden = true
end

events.createmove:set(slot_0_52_0.no_scope_func)

slot_0_52_0.airstop_cache = nil

function slot_0_52_0.airstop_func()
	local var_371_0 = slot_0_40_0.ref

	if slot_0_40_0.on_ground then
		if slot_0_52_0.airstop_cache then
			slot_0_35_0.autostop:override()

			slot_0_52_0.airstop_cache = nil
		end

		return
	end

	local var_371_1 = slot_0_46_0.ui_tables.ragebot.airstop_cond.value_by_name

	if var_371_1[1] and slot_0_36_0.slowwalk then
		local var_371_2 = slot_0_35_0.autostop:get()

		var_371_2[#var_371_2] = "In Air"

		slot_0_35_0.autostop:override(var_371_2)

		slot_0_52_0.airstop_cache = true

		return
	end

	if var_371_1[2] then
		local var_371_3 = entity.get_threat()

		if var_371_3 and not var_371_3:is_dormant() and var_371_3:get_origin():dist(var_371_0:get_origin()) < 300 then
			local var_371_4 = slot_0_35_0.autostop:get()

			var_371_4[#var_371_4] = "In Air"

			slot_0_35_0.autostop:override(var_371_4)

			slot_0_52_0.airstop_cache = true

			return
		end
	end

	if slot_0_52_0.airstop_cache then
		slot_0_35_0.autostop:override()

		slot_0_52_0.airstop_cache = nil
	end
end

slot_0_46_0.ui_tables.ragebot.airstop_switch:set_callback(function()
	if slot_0_46_0.ui_tables.ragebot.airstop_switch.value then
		events.createmove:set(slot_0_52_0.airstop_func)
	else
		events.createmove:unset(slot_0_52_0.airstop_func)
	end

	slot_0_35_0.autostop:override()

	slot_0_52_0.airstop_cache = nil
end, true)

slot_0_52_0.need_throw = false

function slot_0_52_0.grenade_release_func_nade(arg_373_0)
	slot_0_52_0.need_throw = false

	if arg_373_0.type == "Frag" and arg_373_0.target then
		local var_373_0 = arg_373_0.target.m_ArmorValue > 0 and 50 or 100

		if arg_373_0.damage / var_373_0 >= slot_0_46_0.ui_tables.ragebot.grenade_damage.value / 100 or arg_373_0.fatal then
			slot_0_52_0.need_throw = true
		end
	end
end

function slot_0_52_0.grenade_release_func_createmove(arg_374_0)
	if slot_0_52_0.need_throw then
		arg_374_0.in_attack = true
	end
end

slot_0_46_0.ui_tables.ragebot.grenade_switch:set_callback(function()
	if slot_0_46_0.ui_tables.ragebot.grenade_switch.value then
		events.grenade_prediction:set(slot_0_52_0.grenade_release_func_nade)
		events.createmove:set(slot_0_52_0.grenade_release_func_createmove)
	else
		events.grenade_prediction:unset(slot_0_52_0.grenade_release_func_nade)
		events.createmove:unset(slot_0_52_0.grenade_release_func_createmove)
	end

	slot_0_52_0.need_throw = false
end, true)

slot_0_31_0.screen_size = render.screen_size()
slot_0_31_0.animation_value = 6.666666666666667 * globals.frametime * 100 / 200
slot_0_31_0.global_alpha = 0

function slot_0_31_0.update_consts()
	slot_0_31_0.screen_size = render.screen_size()
	slot_0_31_0.animation_value = 6.666666666666667 * globals.frametime * 100 / 200

	local var_376_0 = slot_0_23_0()

	slot_0_31_0.global_alpha = slot_0_31_0.calculate_value("global_alpha", var_376_0 and var_376_0:is_alive(), 2)
end

events.render:set(slot_0_31_0.update_consts)

slot_0_31_0.easings = {
	out_quart = function(arg_377_0)
		return 1 - slot_0_17_0(1 - arg_377_0, 4)
	end,
	in_quart = function(arg_378_0)
		return arg_378_0 * arg_378_0 * arg_378_0 * arg_378_0
	end,
	in_out_quart = function(arg_379_0)
		return arg_379_0 < 0.5 and 8 * arg_379_0 * arg_379_0 * arg_379_0 * arg_379_0 or 1 - slot_0_17_0(-2 * arg_379_0 + 2, 4) / 2
	end
}
slot_0_31_0.anim_values = {}

function slot_0_31_0.calculate_color(arg_380_0, arg_380_1, arg_380_2)
	arg_380_2 = math.min(1, arg_380_2)
	s_r, s_g, s_b, s_a = arg_380_1:unpack()
	s2_r, s2_g, s2_b, s2_a = arg_380_0:unpack()

	local var_380_0 = 0
	local var_380_1 = 0
	local var_380_2 = 0
	local var_380_3 = 0

	if s_r > s2_r then
		local var_380_4 = s_r - s2_r

		var_380_0 = slot_0_19_0(s_r - var_380_4 * arg_380_2, s2_r, s_r)
	else
		local var_380_5 = s2_r - s_r

		var_380_0 = slot_0_19_0(s_r + var_380_5 * arg_380_2, s_r, s2_r)
	end

	if s_g > s2_g then
		local var_380_6 = s_g - s2_g

		var_380_1 = slot_0_19_0(s_g - var_380_6 * arg_380_2, s2_g, s_g)
	else
		local var_380_7 = s2_g - s_g

		var_380_1 = slot_0_19_0(s_g + var_380_7 * arg_380_2, s_g, s2_g)
	end

	if s_b > s2_b then
		local var_380_8 = s_b - s2_b

		var_380_2 = slot_0_19_0(s_b - var_380_8 * arg_380_2, s2_b, s_b)
	else
		local var_380_9 = s2_b - s_b

		var_380_2 = slot_0_19_0(s_b + var_380_9 * arg_380_2, s_b, s2_b)
	end

	if s_a > s2_a then
		local var_380_10 = s_a - s2_a

		var_380_3 = slot_0_19_0(s_a - var_380_10 * arg_380_2, s2_a, s_a)
	else
		local var_380_11 = s2_a - s_a

		var_380_3 = slot_0_19_0(s_a + var_380_11 * arg_380_2, s_a, s2_a)
	end

	return color(var_380_0, var_380_1, var_380_2, var_380_3)
end

function slot_0_31_0.print_color_text(arg_381_0, arg_381_1)
	local var_381_0 = {}

	for iter_381_0 = 1, #arg_381_0 do
		local var_381_1 = iter_381_0 % 2 == 1 and arg_381_1:to_hex() or "\aedededFF"

		slot_0_4_0(var_381_0, "\a" .. var_381_1)
		slot_0_4_0(var_381_0, arg_381_0[iter_381_0])
		slot_0_4_0(var_381_0, "\aedededFF")
	end

	slot_0_2_0(table.concat(var_381_0))
end

function slot_0_31_0.calculate_gradient(arg_382_0, arg_382_1, arg_382_2)
	local var_382_0 = #arg_382_0
	local var_382_1 = {}

	for iter_382_0 = 1, var_382_0 do
		local var_382_2 = (iter_382_0 + 1) / var_382_0
		local var_382_3 = slot_0_31_0.calculate_color(arg_382_1, arg_382_2, var_382_2)

		var_382_1[iter_382_0] = "\a" .. var_382_3:to_hex():sub(1, 6) .. arg_382_0:sub(iter_382_0, iter_382_0)
	end

	return table.concat(var_382_1)
end

function slot_0_31_0.calculate_value(arg_383_0, arg_383_1, arg_383_2, arg_383_3, arg_383_4)
	local var_383_0 = slot_0_31_0.anim_values[arg_383_0]

	if not var_383_0 then
		slot_0_31_0.anim_values[arg_383_0] = 0
		var_383_0 = slot_0_31_0.anim_values[arg_383_0]
	end

	arg_383_2 = arg_383_2 and arg_383_2 or 1
	arg_383_3 = arg_383_3 and arg_383_3 or 0
	arg_383_4 = arg_383_4 and arg_383_4 or 1

	if arg_383_1 then
		slot_0_31_0.anim_values[arg_383_0] = slot_0_19_0(var_383_0 + slot_0_31_0.animation_value * arg_383_2, arg_383_3, arg_383_4)
	else
		slot_0_31_0.anim_values[arg_383_0] = slot_0_19_0(var_383_0 - slot_0_31_0.animation_value * arg_383_2, arg_383_3, arg_383_4)
	end

	return slot_0_31_0.anim_values[arg_383_0]
end

drag_system = {}
drag_system.list_names = {}
drag_system.list = {}

function drag_system.in_bounds(arg_384_0, arg_384_1, arg_384_2)
	if arg_384_2.x > arg_384_0.x and arg_384_2.y > arg_384_0.y and arg_384_2.x < arg_384_1.x and arg_384_2.y < arg_384_1.y then
		return true
	end

	return false
end

function drag_system.add_drag(arg_385_0, arg_385_1, arg_385_2, arg_385_3, arg_385_4, arg_385_5)
	if drag_system.list[arg_385_0] then
		error("drag system " .. arg_385_0 .. " already exists")
	end

	slot_0_0_0.drag_memory[arg_385_0 .. "_x"] = slot_0_0_0.drag_memory[arg_385_0 .. "_x"] == nil and arg_385_3.x or slot_0_0_0.drag_memory[arg_385_0 .. "_x"]
	slot_0_0_0.drag_memory[arg_385_0 .. "_y"] = slot_0_0_0.drag_memory[arg_385_0 .. "_y"] == nil and arg_385_3.y or slot_0_0_0.drag_memory[arg_385_0 .. "_y"]

	if arg_385_5 == nil then
		function arg_385_5()
			return true
		end
	end

	drag_system.list[arg_385_0] = {
		drag = false,
		tab = tab,
		adjust_start_point = arg_385_1,
		adjust_finish_point = arg_385_2,
		name = arg_385_0,
		diff = vector(0, 0),
		lock_x = arg_385_4,
		state = arg_385_5
	}

	slot_0_4_0(drag_system.list_names, arg_385_0)
end

drag_system.last_element = nil
drag_system.active_element = nil

function drag_system.check_drags()
	if ui.get_alpha() == 0 then
		return
	end

	local var_387_0 = slot_0_31_0.screen_size
	local var_387_1 = common.is_button_down(1)

	if not var_387_1 then
		drag_system.last_element = nil
		drag_system.active_element = nil
	end

	local var_387_2 = ui.get_mouse_position()

	for iter_387_0 = 1, #drag_system.list_names do
		if drag_system.last_element and drag_system.last_element ~= iter_387_0 then
			-- block empty
		else
			local var_387_3 = drag_system.list[drag_system.list_names[iter_387_0]]

			if not var_387_3.state() then
				-- block empty
			elseif not var_387_1 then
				var_387_3.drag = false
				var_387_3.diff = vector(0, 0)
			else
				local var_387_4 = var_387_3.name
				local var_387_5 = var_387_3.tab
				local var_387_6 = vector(var_387_3.lock_x and var_387_0.x / 2 or slot_0_0_0.drag_memory[var_387_4 .. "_x"], slot_0_0_0.drag_memory[var_387_4 .. "_y"]) + var_387_3.adjust_start_point
				local var_387_7 = var_387_6 + var_387_3.adjust_finish_point

				if drag_system.in_bounds(var_387_6, var_387_7, var_387_2) or var_387_3.drag then
					if not var_387_3.drag then
						var_387_3.diff = var_387_2 - var_387_6
						var_387_3.drag = true
					end

					local var_387_8 = var_387_2 - var_387_3.diff
					local var_387_9 = vector(math.max(0, var_387_8.x), math.max(0, var_387_8.y)) - var_387_3.adjust_start_point

					if var_387_9.x + var_387_3.adjust_finish_point.x / 2 > var_387_0.x then
						var_387_9.x = var_387_0.x - var_387_3.adjust_finish_point.x / 2
					end

					if var_387_9.y + var_387_3.adjust_finish_point.y > var_387_0.y then
						var_387_9.y = var_387_0.y - var_387_3.adjust_finish_point.y
					end

					local var_387_10 = var_387_9

					slot_0_0_0.drag_memory[var_387_4 .. "_x"] = var_387_3.lock_x and slot_0_31_0.screen_size.x / 2 or var_387_10.x
					slot_0_0_0.drag_memory[var_387_4 .. "_y"] = var_387_10.y
					drag_system.active_element = var_387_4
					drag_system.last_element = iter_387_0
				end
			end
		end
	end
end

events.render:set(drag_system.check_drags)
events.createmove:set(function(arg_388_0)
	if drag_system.last_element then
		arg_388_0.in_attack = 0
	end
end)

slot_0_31_0.smoke_array = {}
slot_0_31_0.molotov_array = {}

function slot_0_31_0.grenade_smoke_func()
	local var_389_0 = slot_0_23_0()

	if not var_389_0 then
		return
	end

	local var_389_1 = var_389_0:get_origin()
	local var_389_2 = 600
	local var_389_3 = entity.get_entities("CSmokeGrenadeProjectile")
	local var_389_4 = slot_0_46_0.ui_tables.visuals.nade_smoke_c.value
	local var_389_5 = slot_0_46_0.ui_tables.visuals.nade_style.value

	for iter_389_0 = #var_389_3, 0, -1 do
		local var_389_6 = var_389_3[iter_389_0]

		if not var_389_6 or not var_389_6.m_bDidSmokeEffect then
			-- block empty
		else
			local var_389_7 = var_389_6:get_index()

			if not slot_0_31_0.smoke_array[var_389_7] then
				slot_0_31_0.smoke_array[var_389_7] = {
					alpha = 0,
					anim = 0
				}
			end

			local var_389_8 = slot_0_31_0.smoke_array[var_389_7]
			local var_389_9 = 1 - (globals.tickcount - var_389_6.m_nSmokeEffectTickBegin) / 1155
			local var_389_10 = var_389_6.m_vecOrigin

			var_389_8.anim = slot_0_19_0(var_389_8.anim + slot_0_31_0.animation_value, 0, 1)
			var_389_8.alpha = var_389_9 > 0.02 and slot_0_19_0(var_389_8.alpha + slot_0_31_0.animation_value, 0, 1) or slot_0_19_0(var_389_8.alpha - slot_0_31_0.animation_value, 0, 1)

			if var_389_9 == 0 then
				slot_0_31_0.smoke_array[var_389_7] = nil
			else
				local var_389_11 = var_389_1:dist2d(var_389_10) - var_389_2
				local var_389_12

				var_389_12 = var_389_11 > 0 and 1 - var_389_11 / 80 or 1

				local var_389_13 = slot_0_31_0.easings.out_quart(var_389_8.alpha) * var_389_12
				local var_389_14 = slot_0_31_0.easings.out_quart(var_389_8.anim)

				if var_389_13 == 0 then
					-- block empty
				else
					local var_389_15 = var_389_4:clone()

					var_389_15.a = var_389_15.a * var_389_13

					local var_389_16 = var_389_15:clone()

					var_389_16.a = 0

					render.circle_3d_outline(var_389_10, var_389_15, 125 * var_389_14, 90, var_389_5 == 2 and var_389_9 or 1, var_389_5 == 2 and 2 or 1)

					var_389_15.a = var_389_15.a - 20

					if var_389_5 == 2 then
						render.circle_3d_gradient(var_389_10, var_389_15, var_389_16, 125 * var_389_14, 0, 1, 1)
					end
				end
			end
		end
	end
end

function slot_0_31_0.grenade_molotov_func()
	local var_390_0 = slot_0_23_0()

	if not var_390_0 then
		return
	end

	local var_390_1 = var_390_0:get_origin()
	local var_390_2 = 525
	local var_390_3 = slot_0_46_0.ui_tables.visuals.nade_molotov_c.value
	local var_390_4 = slot_0_46_0.ui_tables.visuals.nade_molotov_cf.value
	local var_390_5 = entity.get_entities("CInferno")
	local var_390_6 = slot_0_46_0.ui_tables.visuals.nade_style.value

	for iter_390_0 = #var_390_5, 0, -1 do
		local var_390_7 = var_390_5[iter_390_0]

		if not var_390_7 then
			-- block empty
		else
			local var_390_8 = var_390_7:get_index()

			if not slot_0_31_0.molotov_array[var_390_8] then
				slot_0_31_0.molotov_array[var_390_8] = {
					alpha = 0,
					anim = 0
				}
			end

			local var_390_9 = slot_0_31_0.molotov_array[var_390_8]
			local var_390_10 = 1 - (globals.tickcount - var_390_7.m_nFireEffectTickBegin) / 449
			local var_390_11 = var_390_7.m_vecOrigin

			var_390_9.alpha = var_390_10 > 0.06 and slot_0_19_0(var_390_9.alpha + slot_0_31_0.animation_value / 2, 0, 1) or slot_0_19_0(var_390_9.alpha - slot_0_31_0.animation_value, 0, 1)

			local var_390_12 = var_390_1:dist2d(var_390_11) - var_390_2
			local var_390_13

			var_390_13 = var_390_12 > 0 and 1 - var_390_12 / 80 or 1

			local var_390_14 = slot_0_31_0.easings.out_quart(var_390_9.alpha) * var_390_13

			if var_390_14 == 0 then
				-- block empty
			else
				local var_390_15 = var_390_7.m_hOwnerEntity
				local var_390_16 = false

				if var_390_15 then
					var_390_16 = var_390_15.m_iTeamNum == var_390_0.m_iTeamNum and var_390_15 ~= var_390_0
				end

				local var_390_17 = var_390_16 and var_390_4:clone() or var_390_3:clone()

				var_390_17.a = var_390_17.a * var_390_14

				local var_390_18 = var_390_17:clone()

				var_390_18.a = 0

				local var_390_19 = {}

				for iter_390_1 = 1, 20 do
					var_390_19[iter_390_1] = var_390_11 + vector(var_390_7.m_fireXDelta[iter_390_1], var_390_7.m_fireYDelta[iter_390_1], var_390_7.m_fireZDelta[iter_390_1])
				end

				local var_390_20 = 0
				local var_390_21 = vector(0, 0, 0)
				local var_390_22 = vector(0, 0, 0)

				for iter_390_2 = 1, #var_390_19 do
					for iter_390_3 = 1, #var_390_19 do
						local var_390_23 = var_390_19[iter_390_2]:dist2d(var_390_19[iter_390_3])

						if var_390_20 < var_390_23 then
							var_390_21 = var_390_19[iter_390_2]
							var_390_22 = var_390_19[iter_390_3]
							var_390_20 = var_390_23
						end
					end
				end

				local var_390_24 = (var_390_21 + var_390_22) / 2

				var_390_24.z = var_390_11.z

				local var_390_25 = var_390_20 / 2

				var_390_9.anim = var_390_25 > 50 and slot_0_19_0(var_390_9.anim + slot_0_31_0.animation_value / 3, 0, 1) or var_390_9.anim

				local var_390_26 = slot_0_31_0.easings.out_quart(var_390_9.anim)

				if var_390_10 <= 0.018 then
					slot_0_31_0.molotov_array[var_390_8] = nil
				else
					render.circle_3d_outline(var_390_24, var_390_17, var_390_25 * var_390_26, 90, var_390_6 == 2 and var_390_10 or 1, var_390_6 == 2 and 2 or 1)

					var_390_17.a = var_390_17.a - 20

					if var_390_6 == 2 then
						render.circle_3d_gradient(var_390_24, var_390_17, var_390_18, var_390_25 * var_390_26, 0, 1, 1)
					end
				end
			end
		end
	end
end

slot_0_46_0.ui_tables.visuals.nade_switch:set_callback(function()
	if slot_0_46_0.ui_tables.visuals.nade_switch.value then
		events.round_start:unset(function()
			slot_0_31_0.smoke_array = {}
			slot_0_31_0.molotov_array = {}
		end)
	else
		events.round_start:unset(function()
			slot_0_31_0.smoke_array = {}
			slot_0_31_0.molotov_array = {}
		end)
	end

	if slot_0_46_0.ui_tables.visuals.nade_switch.value and slot_0_46_0.ui_tables.visuals.nade_smoke.value then
		events.render:set(slot_0_31_0.grenade_smoke_func)
	else
		events.render:unset(slot_0_31_0.grenade_smoke_func)
	end

	if slot_0_46_0.ui_tables.visuals.nade_switch.value and slot_0_46_0.ui_tables.visuals.nade_molotov.value then
		events.render:set(slot_0_31_0.grenade_molotov_func)
	else
		events.render:unset(slot_0_31_0.grenade_molotov_func)
	end
end, true)
slot_0_46_0.ui_tables.visuals.nade_molotov:set_callback(function()
	if slot_0_46_0.ui_tables.visuals.nade_switch.value and slot_0_46_0.ui_tables.visuals.nade_molotov.value then
		events.render:set(slot_0_31_0.grenade_molotov_func)
	else
		events.render:unset(slot_0_31_0.grenade_molotov_func)
	end
end, true)
slot_0_46_0.ui_tables.visuals.nade_smoke:set_callback(function()
	if slot_0_46_0.ui_tables.visuals.nade_switch.value and slot_0_46_0.ui_tables.visuals.nade_smoke.value then
		events.render:set(slot_0_31_0.grenade_smoke_func)
	else
		events.render:unset(slot_0_31_0.grenade_smoke_func)
	end
end)

slot_0_31_0.hitmarkers_list = {}
slot_0_31_0.png_hex = "\x89PNG\r\n\x1A\n\x00\x00\x00\rIHDR\x00\x00\x00\r\x00\x00\x00\r\b\x06\x00\x00\x00r\xEB\xE4|\x00\x00\x00\tpHYs\x00\x00\v\x13\x00\x00\v\x13\x01\x00\x9A\x9C\x18\x00\x00\x00\x8EIDAT(\x91\x9D\x92\xCD\x15\x020\b\x83\xD3\x15z`\x85\f\xC0:]YV\x8A\a\x8D\xAFV\xFCy\xE6\b|PB\x87$\x00\xC0\x18#q\xD3\xC51\xAB\xCBM\x00\x8B\xA4\"B\x00\x12\x00$\xE1^\x90\x11!\x92\x02\xB0\xDC(IJ\x92\xAAj\a\xA7\x81\xAA\x92$\x83\x893\xB1\x81\xEBM<\x1F\xD3\xCE\x02\x92\x1F\x81\x16\xB4\x9A'\xC3\xCBZ\xCB\xFBY\x9B\x01\xF3\t\xDA]\xFA6I\x12Z\xE0\x97\x9D\xFEr\xEFݝ^\x1A\xEEwj\x7F\xC4\xE9\xEA\xF9#\xA6\x93\xDD\x1D\xBA\xDC\x15!\xA5\xFD\xFA\xC3\xDAX:\x00\x00\x00\x00IEND\xAEB`\x82"
slot_0_31_0.loaded_image = render.load_image(slot_0_31_0.png_hex, vector(13, 13))

function slot_0_31_0.hitmarker_register(arg_396_0)
	local var_396_0 = arg_396_0.state

	var_396_0 = var_396_0 == "correction" and "resolver" or var_396_0
	var_396_0 = var_396_0 == "misprediction" and "jitter resolver" or var_396_0
	var_396_0 = var_396_0 or "hit" or var_396_0

	slot_0_4_0(slot_0_31_0.hitmarkers_list, #slot_0_31_0.hitmarkers_list, {
		alpha = 0.1,
		pos = arg_396_0.aim,
		reason = arg_396_0.state and string.upper(var_396_0) or arg_396_0.damage,
		curtime = globals.curtime,
		color = var_396_0
	})
end

function slot_0_31_0.hitmarker_func()
	slot_397_0_0 = slot_0_46_0.ui_tables.visuals.hitmarker_duration.value / 10
	slot_397_1_0 = slot_0_46_0.ui_tables.visuals.hitmarker_miss.value:clone()
	slot_397_2_0 = slot_0_46_0.ui_tables.visuals.hitmarker_theme_hit.value and (slot_0_46_0.ui_tables.visuals.color_use_theme.value and ui.get_style("Link Active") or slot_0_46_0.ui_tables.visuals.main_color.value) or slot_0_46_0.ui_tables.visuals.hitmarker_hit.value:clone()
	slot_397_3_0 = slot_0_46_0.ui_tables.visuals.hitmarker_lastshot.value
	slot_397_4_0 = slot_0_46_0.ui_tables.visuals.hitmarker_color_hitlog.value
	slot_397_5_0 = slot_0_46_0.ui_tables.visuals.hitmarker_glow.value
	slot_397_6_0 = 25
	slot_397_7_0 = 0.75

	if slot_397_4_0 then
		if slot_0_46_0.ui_tables.visuals.hitlog_color_mode.value == 1 then
			slot_0_52_0.log_colors = {
				hit = slot_0_46_0.ui_tables.visuals.hitlog_theme_hit.value and ui.get_style("Link Active") or slot_0_46_0.ui_tables.visuals.hitlog_hit.value,
				["lagcomp failure"] = slot_0_46_0.ui_tables.visuals.hitlog_miss.value,
				["prediction error"] = slot_0_46_0.ui_tables.visuals.hitlog_miss.value,
				["jitter resolver"] = slot_0_46_0.ui_tables.visuals.hitlog_miss.value,
				resolver = slot_0_46_0.ui_tables.visuals.hitlog_miss.value,
				spread = slot_0_46_0.ui_tables.visuals.hitlog_miss.value,
				["unregistered shot"] = slot_0_46_0.ui_tables.visuals.hitlog_miss.value,
				["player death"] = slot_0_46_0.ui_tables.visuals.hitlog_miss.value,
				death = slot_0_46_0.ui_tables.visuals.hitlog_miss.value,
				dormancy = slot_0_46_0.ui_tables.visuals.hitlog_miss.value,
				error = slot_0_46_0.ui_tables.visuals.hitlog_miss.value,
				["damage rejection"] = slot_0_46_0.ui_tables.visuals.hitlog_miss.value,
				["backtrack failure"] = slot_0_46_0.ui_tables.visuals.hitlog_miss.value
			}
		else
			slot_0_52_0.log_colors = {
				hit = slot_0_46_0.ui_tables.visuals.hitlog_theme_hit.value and ui.get_style("Link Active") or slot_0_46_0.ui_tables.visuals.hitlog_hit.value,
				["lagcomp failure"] = slot_0_46_0.ui_tables.visuals.hitlog_pred.value,
				["prediction error"] = slot_0_46_0.ui_tables.visuals.hitlog_pred.value,
				["jitter resolver"] = slot_0_46_0.ui_tables.visuals.hitlog_resolver.value,
				resolver = slot_0_46_0.ui_tables.visuals.hitlog_resolver.value,
				spread = slot_0_46_0.ui_tables.visuals.hitlog_spread.value,
				["unregistered shot"] = slot_0_46_0.ui_tables.visuals.hitlog_death.value,
				["player death"] = slot_0_46_0.ui_tables.visuals.hitlog_death.value,
				death = slot_0_46_0.ui_tables.visuals.hitlog_death.value,
				dormancy = slot_0_46_0.ui_tables.visuals.hitlog_resolver.value,
				error = slot_0_46_0.ui_tables.visuals.hitlog_resolver.value,
				["damage rejection"] = slot_0_46_0.ui_tables.visuals.hitlog_death.value,
				["backtrack failure"] = slot_0_46_0.ui_tables.visuals.hitlog_resolver.value
			}
		end
	else
		slot_0_52_0.log_colors = {
			hit = slot_0_46_0.ui_tables.visuals.hitmarker_theme_hit.value and ui.get_style("Link Active") or slot_0_46_0.ui_tables.visuals.hitmarker_hit.value,
			["lagcomp failure"] = slot_0_46_0.ui_tables.visuals.hitmarker_miss.value,
			["prediction error"] = slot_0_46_0.ui_tables.visuals.hitmarker_miss.value,
			["jitter resolver"] = slot_0_46_0.ui_tables.visuals.hitmarker_miss.value,
			resolver = slot_0_46_0.ui_tables.visuals.hitmarker_miss.value,
			spread = slot_0_46_0.ui_tables.visuals.hitmarker_miss.value,
			["unregistered shot"] = slot_0_46_0.ui_tables.visuals.hitmarker_miss.value,
			["player death"] = slot_0_46_0.ui_tables.visuals.hitmarker_miss.value,
			death = slot_0_46_0.ui_tables.visuals.hitmarker_miss.value,
			dormancy = slot_0_46_0.ui_tables.visuals.hitmarker_miss.value,
			error = slot_0_46_0.ui_tables.visuals.hitmarker_miss.value,
			["damage rejection"] = slot_0_46_0.ui_tables.visuals.hitmarker_miss.value,
			["backtrack failure"] = slot_0_46_0.ui_tables.visuals.hitmarker_miss.value
		}
	end

	for iter_397_0 = #slot_0_31_0.hitmarkers_list, 0, -1 do
		slot_397_12_0 = slot_0_31_0.hitmarkers_list[iter_397_0]

		if not slot_397_12_0 then
			-- block empty
		elseif slot_397_12_0.alpha == 0 then
			table.remove(slot_0_31_0.hitmarkers_list, iter_397_0)
		else
			if slot_397_0_0 < slot_0_11_0(slot_397_12_0.curtime - globals.curtime) or slot_397_3_0 and iter_397_0 > 0 then
				slot_397_12_0.alpha = slot_0_19_0(slot_397_12_0.alpha - slot_0_31_0.animation_value * 2, 0, 1)
			else
				slot_397_12_0.alpha = slot_0_19_0(slot_397_12_0.alpha + slot_0_31_0.animation_value * 2, 0, 1)
			end

			slot_397_13_0 = slot_397_12_0.alpha
			slot_397_14_1 = slot_397_12_0.pos:to_screen()

			if not slot_397_14_1 then
				-- block empty
			else
				slot_397_14_0 = slot_397_14_1 - vector(6.5, 6.5)
				slot_397_15_0 = slot_397_12_0.color == "hit" and slot_397_2_0 or slot_397_1_0
				slot_397_15_0 = slot_397_4_0 and slot_0_52_0.log_colors[slot_397_12_0.color] or slot_397_15_0
				slot_397_16_0 = color(slot_397_15_0.r, slot_397_15_0.g, slot_397_15_0.b, slot_397_15_0.a * slot_397_13_0)

				if slot_397_5_0 then
					slot_397_17_1 = slot_397_16_0:clone()
					slot_397_17_1.a = 255 * slot_397_7_0 * slot_397_13_0

					render.shadow(slot_397_14_0 + vector(4, 5), slot_397_14_0 + vector(5, 7), slot_397_17_1, slot_397_6_0 * 2)
				end

				render.texture(slot_0_31_0.loaded_image, slot_397_14_0, vector(13, 13), slot_397_16_0)

				slot_397_17_0 = slot_397_12_0.color ~= "hit" and slot_397_16_0 or color(255, 255 * slot_397_13_0)

				if slot_397_5_0 then
					slot_397_18_0 = render.measure_text(2, nil, slot_397_12_0.reason)
					slot_397_19_0 = slot_397_17_0:clone()
					slot_397_19_0.a = 255 * slot_397_7_0 * slot_397_13_0

					render.shadow(slot_397_14_0 + vector(18, 4), slot_397_14_0 + vector(16, 1) + slot_397_18_0 / 1.6, slot_397_19_0, slot_397_6_0)
				end

				slot_0_25_0(2, slot_397_14_0 + vector(15, 1), slot_397_17_0, nil, slot_397_12_0.reason)
			end
		end
	end
end

slot_0_46_0.ui_tables.visuals.hitmarker_switch:set_callback(function()
	if slot_0_46_0.ui_tables.visuals.hitmarker_switch.value then
		events.aim_ack:set(slot_0_31_0.hitmarker_register)
		events.render:set(slot_0_31_0.hitmarker_func)
		slot_0_35_0.world_hitmarker:override(false)
	else
		events.aim_ack:unset(slot_0_31_0.hitmarker_register)
		events.render:unset(slot_0_31_0.hitmarker_func)
		slot_0_35_0.world_hitmarker:override()
	end
end, true)
events.shutdown:set(function()
	slot_0_35_0.world_hitmarker:override()
end)

slot_0_31_0.logs_array = {}

function slot_0_31_0.register_hitlog(arg_400_0)
	slot_400_1_0 = slot_0_46_0.ui_tables.visuals.hitlog_vis_type.value_by_name
	slot_400_2_0 = slot_400_1_0[2]
	slot_400_3_0 = slot_400_1_0[3]
	slot_400_4_0 = slot_400_1_0[1]
	slot_400_5_0 = arg_400_0.id
	slot_400_6_0 = tostring(arg_400_0.target:get_name())
	slot_400_7_0 = tostring(arg_400_0.damage)
	slot_400_8_0 = tostring(arg_400_0.hitchance)
	slot_400_9_0 = tostring(slot_0_52_0.hitgroup_str[arg_400_0.hitgroup])
	slot_400_10_0 = tostring(arg_400_0.backtrack)
	slot_400_11_0 = tostring(arg_400_0.wanted_damage)
	slot_400_12_0 = tostring(slot_0_52_0.hitgroup_str[arg_400_0.wanted_hitgroup])
	slot_400_13_0 = arg_400_0.state
	slot_400_13_0 = slot_400_13_0 == "correction" and "resolver" or slot_400_13_0
	slot_400_13_0 = slot_400_13_0 == "misprediction" and "jitter resolver" or slot_400_13_0

	if not slot_400_7_0 then
		return
	end

	if slot_0_46_0.ui_tables.visuals.hitlog_color_mode.value == 1 then
		slot_0_52_0.log_colors = {
			hit = slot_0_46_0.ui_tables.visuals.hitlog_theme_hit.value and ui.get_style("Link Active") or slot_0_46_0.ui_tables.visuals.hitlog_hit.value,
			["lagcomp failure"] = slot_0_46_0.ui_tables.visuals.hitlog_miss.value,
			["prediction error"] = slot_0_46_0.ui_tables.visuals.hitlog_miss.value,
			["jitter resolver"] = slot_0_46_0.ui_tables.visuals.hitlog_miss.value,
			resolver = slot_0_46_0.ui_tables.visuals.hitlog_miss.value,
			spread = slot_0_46_0.ui_tables.visuals.hitlog_miss.value,
			["unregistered shot"] = slot_0_46_0.ui_tables.visuals.hitlog_miss.value,
			["player death"] = slot_0_46_0.ui_tables.visuals.hitlog_miss.value,
			death = slot_0_46_0.ui_tables.visuals.hitlog_miss.value,
			dormancy = slot_0_46_0.ui_tables.visuals.hitlog_miss.value,
			error = slot_0_46_0.ui_tables.visuals.hitlog_miss.value,
			["damage rejection"] = slot_0_46_0.ui_tables.visuals.hitlog_miss.value,
			["backtrack failure"] = slot_0_46_0.ui_tables.visuals.hitlog_miss.value
		}
	else
		slot_0_52_0.log_colors = {
			hit = slot_0_46_0.ui_tables.visuals.hitlog_theme_hit.value and ui.get_style("Link Active") or slot_0_46_0.ui_tables.visuals.hitlog_hit.value,
			["lagcomp failure"] = slot_0_46_0.ui_tables.visuals.hitlog_pred.value,
			["prediction error"] = slot_0_46_0.ui_tables.visuals.hitlog_pred.value,
			["jitter resolver"] = slot_0_46_0.ui_tables.visuals.hitlog_resolver.value,
			resolver = slot_0_46_0.ui_tables.visuals.hitlog_resolver.value,
			spread = slot_0_46_0.ui_tables.visuals.hitlog_spread.value,
			["unregistered shot"] = slot_0_46_0.ui_tables.visuals.hitlog_death.value,
			["player death"] = slot_0_46_0.ui_tables.visuals.hitlog_death.value,
			death = slot_0_46_0.ui_tables.visuals.hitlog_death.value,
			dormancy = slot_0_46_0.ui_tables.visuals.hitlog_resolver.value,
			error = slot_0_46_0.ui_tables.visuals.hitlog_resolver.value,
			["damage rejection"] = slot_0_46_0.ui_tables.visuals.hitlog_death.value,
			["backtrack failure"] = slot_0_46_0.ui_tables.visuals.hitlog_resolver.value
		}
	end

	if not slot_400_13_0 and slot_400_9_0 then
		if slot_400_2_0 then
			slot_400_14_3 = {
				anim_value = 0.01,
				color = slot_0_52_0.log_colors.hit,
				text_array = {
					"",
					slot_0_46_0.ui_tables.visuals.hitlog_extra.value_by_name.Icons and " " or "",
					arg_400_0.target.m_iHealth ~= 0 and "Hit " or "Killed ",
					arg_400_0.target.m_iHealth ~= 0 and slot_400_6_0 or slot_400_6_0 .. "`s",
					" in the ",
					slot_400_9_0 == slot_400_12_0 and slot_400_9_0 or slot_400_9_0 .. "(" .. slot_400_12_0 .. ")",
					arg_400_0.target.m_iHealth ~= 0 and " for " or "",
					arg_400_0.target.m_iHealth ~= 0 and (slot_400_7_0 == slot_400_11_0 and slot_400_7_0 or slot_400_7_0 .. "(" .. slot_400_11_0 .. ")") or "",
					arg_400_0.target.m_iHealth ~= 0 and " (" or "",
					arg_400_0.target.m_iHealth ~= 0 and arg_400_0.target.m_iHealth or "",
					arg_400_0.target.m_iHealth ~= 0 and " hp remaining)" or ""
				},
				curtime = globals.curtime
			}

			slot_0_4_0(slot_0_31_0.logs_array, slot_400_14_3)
		end

		slot_400_14_2 = ("Hit %s %s for %s (%s hp remaining) bt: %s hc: %s"):format(slot_400_6_0, slot_400_9_0 ~= slot_400_12_0 and slot_400_9_0 .. "(" .. slot_400_12_0 .. ")" or slot_400_9_0, slot_400_7_0, arg_400_0.target.m_iHealth, slot_400_10_0, slot_400_8_0)

		if slot_400_4_0 then
			slot_0_31_0.print_color_text({
				"",
				"\a" .. slot_0_52_0.log_colors.hit:to_hex() .. table.concat({
					"extension ",
					"»",
					" "
				}),
				"",
				arg_400_0.target.m_iHealth ~= 0 and "Hit    " or "Killed ",
				arg_400_0.target.m_iHealth ~= 0 and slot_400_6_0 .. "  " or slot_400_6_0 .. "`s",
				" in the ",
				slot_400_9_0,
				slot_400_9_0 ~= slot_400_12_0 and "(" .. slot_400_12_0 .. ")" or "",
				"",
				arg_400_0.target.m_iHealth ~= 0 and " for " or "",
				arg_400_0.target.m_iHealth ~= 0 and slot_400_7_0 or "",
				arg_400_0.target.m_iHealth ~= 0 and (slot_400_7_0 ~= slot_400_11_0 and "(" .. slot_400_11_0 .. ")" or "") or "",
				"",
				(arg_400_0.target.m_iHealth > 0 and " (" .. arg_400_0.target.m_iHealth .. " hp remaining)" or "") .. (slot_400_10_0 ~= "0" and " bt: " or ""),
				slot_400_10_0 ~= "0" and slot_400_10_0 or "",
				slot_400_8_0 ~= "100" and " hc: " or "",
				slot_400_8_0 ~= "100" and slot_400_8_0 or ""
			}, slot_0_52_0.log_colors.hit)
		end

		if slot_400_3_0 then
			print_dev(slot_400_14_2)
		end

		return
	end

	if slot_400_2_0 then
		slot_400_14_1 = {
			anim_value = 0.01,
			color = slot_0_52_0.log_colors[slot_400_13_0],
			text_array = {
				"",
				slot_0_46_0.ui_tables.visuals.hitlog_extra.value_by_name.Icons and " " or "",
				"Missed ",
				slot_400_6_0 .. "`s",
				" in the ",
				slot_400_12_0,
				" due to ",
				slot_400_13_0
			},
			curtime = globals.curtime
		}

		slot_0_4_0(slot_0_31_0.logs_array, slot_400_14_1)
	end

	if slot_400_4_0 then
		slot_0_31_0.print_color_text({
			"",
			"\a" .. slot_0_52_0.log_colors[slot_400_13_0]:to_hex() .. "extension " .. "»" .. " ",
			"",
			"Missed ",
			slot_400_6_0 .. "`s",
			" in the ",
			slot_400_12_0,
			" due to ",
			"\a" .. slot_0_52_0.log_colors[slot_400_13_0]:to_hex() .. slot_400_13_0,
			slot_400_10_0 ~= "0" and " bt: " or "",
			slot_400_10_0 ~= "0" and slot_400_10_0 or "",
			slot_400_8_0 ~= "100" and " hc: " or "",
			slot_400_8_0 ~= "100" and slot_400_8_0 or ""
		}, slot_0_52_0.log_colors[slot_400_13_0])
	end

	slot_400_14_0 = ("Miss %s %s due to %s bt: %s hc: %s"):format(slot_400_6_0, slot_400_12_0, slot_400_13_0, slot_400_10_0, slot_400_8_0)

	if slot_400_3_0 then
		print_dev(slot_400_14_0)
	end
end

function slot_0_31_0.player_hurt_hitlogs(arg_401_0)
	slot_401_1_0 = entity.get(arg_401_0.userid, true)

	if not slot_401_1_0 or slot_401_1_0 == slot_0_23_0() then
		return
	end

	if entity.get(arg_401_0.attacker, true) ~= slot_0_23_0() then
		return
	end

	if not arg_401_0.weapon:find("grenade") and arg_401_0.weapon ~= "inferno" and arg_401_0.weapon ~= "knife" then
		return
	end

	slot_0_52_0.log_colors = {
		hit = slot_0_46_0.ui_tables.visuals.hitlog_theme_hit.value and ui.get_style("Link Active") or slot_0_46_0.ui_tables.visuals.hitlog_hit.value
	}
	slot_401_3_0 = slot_401_1_0:get_name()
	slot_401_4_0 = arg_401_0.dmg_health
	slot_401_5_0 = arg_401_0.health
	slot_401_6_0 = slot_0_46_0.ui_tables.visuals.hitlog_vis_type.value_by_name[3]
	slot_401_7_0 = slot_0_46_0.ui_tables.visuals.hitlog_vis_type.value_by_name[2]

	if arg_401_0.weapon:find("grenade") or arg_401_0.weapon == "inferno" then
		slot_0_31_0.print_color_text({
			"",
			"\a" .. slot_0_52_0.log_colors.hit:to_hex() .. table.concat({
				"extension ",
				"»",
				" "
			}),
			"",
			arg_401_0.weapon:find("grenade") and "Naded  " or "Burned ",
			slot_401_3_0 .. "`s",
			slot_401_1_0.m_iHealth - slot_401_4_0 > 0 and " for " or " ",
			slot_401_1_0.m_iHealth - slot_401_4_0 > 0 and slot_401_4_0 or " ",
			slot_401_1_0.m_iHealth - slot_401_4_0 > 0 and " (" .. slot_401_5_0 .. " hp remaining)" or " "
		}, slot_0_52_0.log_colors.hit)

		if slot_401_6_0 then
			slot_401_8_3 = ("%s %s for %s (%s hp remaining) "):format(arg_401_0.weapon:find("grenade") and "Naded" or "Burned", slot_401_3_0, slot_401_4_0, slot_401_5_0)

			print_dev(slot_401_8_3)
		end

		if slot_401_7_0 then
			slot_401_8_2 = nil

			for iter_401_0 = 1, #slot_0_31_0.logs_array do
				slot_401_13_1 = slot_0_31_0.logs_array[iter_401_0]

				if slot_401_13_1 then
					slot_401_14_1 = slot_401_13_1.text_array

					if (slot_401_14_1[3] == "Burned " or slot_401_14_1[3] == "Naded ") and slot_401_14_1[4] == slot_401_3_0 .. "`s" then
						slot_401_8_2 = iter_401_0

						break
					end
				end
			end

			if not slot_401_8_2 then
				slot_401_9_3 = {
					anim_value = 0.01,
					color = slot_0_52_0.log_colors.hit,
					text_array = {
						"",
						slot_0_46_0.ui_tables.visuals.hitlog_extra.value_by_name.Icons and (arg_401_0.weapon:find("grenade") and " " or " ") or "",
						arg_401_0.weapon:find("grenade") and "Naded " or "Burned ",
						slot_401_3_0 .. "`s",
						" for ",
						slot_401_4_0,
						" (",
						slot_401_5_0,
						" hp remaining)"
					},
					curtime = globals.curtime
				}

				slot_0_4_0(slot_0_31_0.logs_array, slot_401_9_3)
			else
				slot_401_9_2 = slot_0_31_0.logs_array[slot_401_8_2].text_array[6]
				slot_0_31_0.logs_array[slot_401_8_2].text_array[3] = arg_401_0.weapon:find("grenade") and "Naded " or "Burned "
				slot_0_31_0.logs_array[slot_401_8_2].text_array[6] = slot_401_9_2 + slot_401_4_0
				slot_0_31_0.logs_array[slot_401_8_2].text_array[8] = slot_401_5_0
				slot_0_31_0.logs_array[slot_401_8_2].curtime = globals.curtime
			end
		end

		return
	end

	slot_0_31_0.print_color_text({
		"",
		"\a" .. slot_0_52_0.log_colors.hit:to_hex() .. table.concat({
			"extension ",
			"»",
			" "
		}),
		"",
		"Knifed ",
		slot_401_3_0 .. "`s",
		slot_401_1_0.m_iHealth - slot_401_4_0 > 0 and " for " or " ",
		slot_401_1_0.m_iHealth - slot_401_4_0 > 0 and slot_401_4_0 or " ",
		slot_401_1_0.m_iHealth - slot_401_4_0 > 0 and " (" .. slot_401_5_0 .. " hp remaining)" or " "
	}, slot_0_52_0.log_colors.hit)

	if slot_401_6_0 then
		slot_401_8_1 = ("Knifed %s for %s (%s hp remaining) "):format(slot_401_3_0, slot_401_4_0, slot_401_5_0)

		print_dev(slot_401_8_1)
	end

	if slot_401_7_0 then
		slot_401_8_0 = nil

		for iter_401_1 = 1, #slot_0_31_0.logs_array do
			slot_401_13_0 = slot_0_31_0.logs_array[iter_401_1]

			if slot_401_13_0 then
				slot_401_14_0 = slot_401_13_0.text_array

				if slot_401_14_0[1] == "Knifed " and slot_401_14_0[2] == slot_401_3_0 then
					slot_401_8_0 = iter_401_1

					break
				end
			end
		end

		if not slot_401_8_0 then
			slot_401_9_1 = {
				anim_value = 0.01,
				color = slot_0_52_0.log_colors.hit,
				text_array = {
					"Knifed ",
					slot_401_3_0,
					" for ",
					slot_401_4_0,
					" (",
					slot_401_5_0,
					" hp remaining)"
				},
				curtime = globals.curtime
			}

			slot_0_4_0(slot_0_31_0.logs_array, slot_401_9_1)
		else
			slot_401_9_0 = slot_0_31_0.logs_array[slot_401_8_0].text_array[4]
			slot_0_31_0.logs_array[slot_401_8_0].text_array[4] = slot_401_9_0 + slot_401_4_0
			slot_0_31_0.logs_array[slot_401_8_0].text_array[6] = slot_401_5_0
			slot_0_31_0.logs_array[slot_401_8_0].curtime = globals.curtime
		end
	end
end

function slot_0_31_0.render_gradient_log(arg_402_0, arg_402_1, arg_402_2, arg_402_3)
	local var_402_0 = slot_0_27_0(1, "", table.concat(arg_402_1))
	local var_402_1 = vector((var_402_0.x / 1.95 + 20) * arg_402_3, var_402_0.y + 2 + 20)

	render.push_clip_rect(arg_402_0 - var_402_1, arg_402_0 + var_402_1, false)

	var_402_0.y = 0
	arg_402_0 = arg_402_0 - var_402_0 / 2

	local var_402_2 = 0

	if slot_0_46_0.ui_tables.visuals.hitlog_extra.value_by_name.Glow then
		local var_402_3 = vector(0, 0)

		for iter_402_0 = 1, #arg_402_1 do
			local var_402_4 = slot_0_27_0(1, "", arg_402_1[iter_402_0])

			var_402_4.y = 0
			var_402_3 = var_402_3 + var_402_4
		end

		slot_0_28_0(arg_402_0 + vector(0, 7), arg_402_0 + var_402_3 + vector(-3, 7), arg_402_2, 30)
	end

	for iter_402_1 = 1, #arg_402_1 do
		local var_402_5 = iter_402_1 % 2 == 0 and arg_402_2 or color(255, arg_402_2.a)
		local var_402_6 = slot_0_27_0(1, "", arg_402_1[iter_402_1])

		var_402_6.y = 0

		slot_0_25_0(1, arg_402_0 + var_402_2, var_402_5, "", arg_402_1[iter_402_1])

		var_402_2 = var_402_2 + var_402_6
	end

	render.pop_clip_rect()
end

slot_0_31_0.logs_menu_cache = 0

drag_system.add_drag("logs", vector(-190, 0), vector(399, 90), vector(slot_0_31_0.screen_size.x / 2, slot_0_31_0.screen_size.y / 1.5), true, function()
	return slot_0_46_0.ui_tables.visuals.hitlog_switch.value and slot_0_46_0.ui_tables.visuals.hitlog_vis_type.value_by_name[2] and ui.get_alpha() > 0
end)

function slot_0_31_0.logs_render()
	if not slot_0_46_0.ui_tables.visuals.hitlog_vis_type.value_by_name[2] then
		return
	end

	if slot_0_46_0.ui_tables.visuals.hitlog_color_mode.value == 1 then
		slot_0_52_0.log_colors = {
			hit = slot_0_46_0.ui_tables.visuals.hitlog_theme_hit.value and (slot_0_46_0.ui_tables.visuals.color_use_theme.value and ui.get_style("Link Active") or slot_0_46_0.ui_tables.visuals.main_color.value) or slot_0_46_0.ui_tables.visuals.hitlog_hit.value,
			["lagcomp failure"] = slot_0_46_0.ui_tables.visuals.hitlog_miss.value,
			["prediction error"] = slot_0_46_0.ui_tables.visuals.hitlog_miss.value,
			["jitter resolver"] = slot_0_46_0.ui_tables.visuals.hitlog_miss.value,
			resolver = slot_0_46_0.ui_tables.visuals.hitlog_miss.value,
			spread = slot_0_46_0.ui_tables.visuals.hitlog_miss.value,
			["unregistered shot"] = slot_0_46_0.ui_tables.visuals.hitlog_miss.value,
			["player death"] = slot_0_46_0.ui_tables.visuals.hitlog_miss.value,
			death = slot_0_46_0.ui_tables.visuals.hitlog_miss.value,
			dormancy = slot_0_46_0.ui_tables.visuals.hitlog_miss.value,
			error = slot_0_46_0.ui_tables.visuals.hitlog_miss.value,
			["damage rejection"] = slot_0_46_0.ui_tables.visuals.hitlog_miss.value,
			["backtrack failure"] = slot_0_46_0.ui_tables.visuals.hitlog_miss.value
		}
	else
		slot_0_52_0.log_colors = {
			hit = slot_0_46_0.ui_tables.visuals.hitlog_theme_hit.value and (slot_0_46_0.ui_tables.visuals.color_use_theme.value and ui.get_style("Link Active") or slot_0_46_0.ui_tables.visuals.main_color.value) or slot_0_46_0.ui_tables.visuals.hitlog_hit.value,
			["lagcomp failure"] = slot_0_46_0.ui_tables.visuals.hitlog_pred.value,
			["prediction error"] = slot_0_46_0.ui_tables.visuals.hitlog_pred.value,
			["jitter resolver"] = slot_0_46_0.ui_tables.visuals.hitlog_resolver.value,
			resolver = slot_0_46_0.ui_tables.visuals.hitlog_resolver.value,
			spread = slot_0_46_0.ui_tables.visuals.hitlog_spread.value,
			["unregistered shot"] = slot_0_46_0.ui_tables.visuals.hitlog_death.value,
			["player death"] = slot_0_46_0.ui_tables.visuals.hitlog_death.value,
			death = slot_0_46_0.ui_tables.visuals.hitlog_death.value,
			dormancy = slot_0_46_0.ui_tables.visuals.hitlog_resolver.value,
			error = slot_0_46_0.ui_tables.visuals.hitlog_resolver.value,
			["damage rejection"] = slot_0_46_0.ui_tables.visuals.hitlog_death.value,
			["backtrack failure"] = slot_0_46_0.ui_tables.visuals.hitlog_resolver.value
		}
	end

	slot_404_0_0 = 0
	slot_404_1_0 = ui.get_alpha()
	slot_404_2_0 = vector(slot_0_31_0.screen_size.x / 2, slot_0_0_0.drag_memory.logs_y)

	if slot_404_1_0 > 0 then
		render.rect_outline(slot_404_2_0 + vector(-190, 0), slot_404_2_0 + vector(190, 90), color(200, 150 * slot_404_1_0), 1, 5)

		slot_404_3_2 = {
			"",
			slot_0_46_0.ui_tables.visuals.hitlog_extra.value_by_name.Icons and " " or "",
			"Hit ",
			"Misnik",
			" in the ",
			"head(chest)",
			" for ",
			"134(100)",
			" (",
			"0",
			" hp remaining)"
		}

		slot_0_31_0.render_gradient_log(slot_404_2_0 + vector(0, slot_404_0_0), slot_404_3_2, slot_0_52_0.log_colors.hit, slot_404_1_0)

		slot_404_0_0 = slot_404_0_0 + 12 * slot_404_1_0
		slot_404_3_1 = {
			"",
			slot_0_46_0.ui_tables.visuals.hitlog_extra.value_by_name.Icons and " " or "",
			"Missed ",
			"Misnik`s",
			" in the ",
			"stomach",
			" due to ",
			"resolver"
		}

		slot_0_31_0.render_gradient_log(slot_404_2_0 + vector(0, slot_404_0_0), slot_404_3_1, slot_0_52_0.log_colors.resolver, slot_404_1_0)

		slot_404_0_0 = slot_404_0_0 + 12 * slot_404_1_0
		slot_404_3_1[6] = "right leg"
		slot_404_3_1[8] = "spread"

		slot_0_31_0.render_gradient_log(slot_404_2_0 + vector(0, slot_404_0_0), slot_404_3_1, slot_0_52_0.log_colors.spread, slot_404_1_0)

		slot_404_0_0 = slot_404_0_0 + 12 * slot_404_1_0
		slot_404_3_1[8] = "death"
		slot_404_3_1[6] = "neck"

		slot_0_31_0.render_gradient_log(slot_404_2_0 + vector(0, slot_404_0_0), slot_404_3_1, slot_0_52_0.log_colors.death, slot_404_1_0)

		slot_404_0_0 = slot_404_0_0 + 12 * slot_404_1_0
	end

	slot_404_3_0 = slot_0_46_0.ui_tables.visuals.hitlog_duration.value / 10

	for iter_404_0 = #slot_0_31_0.logs_array, 0, -1 do
		slot_404_8_0 = slot_0_31_0.logs_array[iter_404_0]

		if not slot_404_8_0 then
			-- block empty
		elseif slot_404_8_0.anim_value == 0 then
			table.remove(slot_0_31_0.logs_array, iter_404_0)
		else
			if slot_404_3_0 < slot_0_11_0(slot_404_8_0.curtime - globals.curtime) then
				slot_404_8_0.anim_value = slot_0_19_0(slot_404_8_0.anim_value - slot_0_31_0.animation_value * 0.8, 0, 0.9)
			else
				slot_404_8_0.anim_value = slot_0_19_0(slot_404_8_0.anim_value + slot_0_31_0.animation_value * 0.8, 0, 0.9)
			end

			slot_404_9_0 = slot_0_31_0.easings.in_out_quart(slot_404_8_0.anim_value)
			slot_404_10_0 = color(slot_404_8_0.color.r, slot_404_8_0.color.g, slot_404_8_0.color.b, slot_404_8_0.color.a)

			slot_0_31_0.render_gradient_log(slot_404_2_0 + vector(0, slot_404_0_0), slot_404_8_0.text_array, slot_404_10_0, slot_404_9_0)

			slot_404_0_0 = slot_404_0_0 + 12 * slot_404_9_0
		end
	end
end

slot_0_46_0.ui_tables.visuals.hitlog_vis_type:set_callback(function()
	local var_405_0 = slot_0_46_0.ui_tables.visuals.hitlog_vis_type.value_by_name
	local var_405_1 = ui.find("Miscellaneous", "Main", "Other", "Log Events")

	if var_405_0[1] then
		if var_405_1:get(2) then
			ui.find("Miscellaneous", "Main", "Other", "Log Events"):override({
				"Purchases"
			})
		else
			ui.find("Miscellaneous", "Main", "Other", "Log Events"):override({})
		end
	else
		ui.find("Miscellaneous", "Main", "Other", "Log Events"):override()
	end
end, true)
slot_0_46_0.ui_tables.visuals.hitlog_switch:set_callback(function()
	local var_406_0 = slot_0_46_0.ui_tables.visuals.hitlog_vis_type.value_by_name
	local var_406_1 = ui.find("Miscellaneous", "Main", "Other", "Log Events")

	if slot_0_46_0.ui_tables.visuals.hitlog_switch.value then
		events.aim_ack:set(slot_0_31_0.register_hitlog)
		events.player_hurt:set(slot_0_31_0.player_hurt_hitlogs)
		events.render:set(slot_0_31_0.logs_render)
	else
		events.aim_ack:unset(slot_0_31_0.register_hitlog)
		events.player_hurt:unset(slot_0_31_0.player_hurt_hitlogs)
		events.render:unset(slot_0_31_0.logs_render)
	end

	if var_406_0[1] and slot_0_46_0.ui_tables.visuals.hitlog_switch.value then
		if var_406_1:get(2) then
			ui.find("Miscellaneous", "Main", "Other", "Log Events"):override({
				"Purchases"
			})
		else
			ui.find("Miscellaneous", "Main", "Other", "Log Events"):override({})
		end
	else
		ui.find("Miscellaneous", "Main", "Other", "Log Events"):override()
	end
end, true)
events.shutdown:set(function()
	ui.find("Miscellaneous", "Main", "Other", "Log Events"):override()
end)

slot_0_31_0.ind_names = {
	["Peek Assist"] = "PA",
	["Hide Shots"] = "HS",
	["Double Tap"] = "DT",
	["Fake Duck"] = "FD"
}
slot_0_31_0.auto_peek = true

function slot_0_31_0.render_ind(arg_408_0, arg_408_1, arg_408_2, arg_408_3)
	local var_408_0 = arg_408_0

	if type(arg_408_0) == "boolean" then
		var_408_0 = slot_0_31_0.ind_names[ref_name]
		arg_408_2 = arg_408_0
	end

	if type(arg_408_0) ~= "string" then
		ref_name = arg_408_0:name()
		var_408_0 = slot_0_31_0.ind_names[ref_name]
		arg_408_2 = arg_408_0:get()
	end

	local var_408_1 = slot_0_31_0.easings.out_quart(slot_0_31_0.calculate_value(var_408_0, arg_408_2, 1.5, 0, 0.9))

	arg_408_1 = arg_408_1 + vector(0, 8 * var_408_1)

	local var_408_2 = slot_0_31_0.anim_values.nade_alpha
	local var_408_3 = 1

	if var_408_0 == "DT" then
		local var_408_4 = rage.exploit:get()
		local var_408_5 = 255 * var_408_1 * arg_408_3 * (var_408_2 ~= 1 and var_408_4 == 1 and 0 or var_408_2 ~= 1 and var_408_4 == 0 and var_408_2 or 1)

		render.text(2, arg_408_1, color(255, 0, 0, var_408_5), "c", var_408_0)

		local var_408_6 = render.measure_text(2, nil, var_408_0)
		local var_408_7 = vector(arg_408_1.x - var_408_6.x / 2, arg_408_1.y - var_408_6.y / 2)

		render.push_clip_rect(var_408_7, var_408_7 + vector(var_408_6.x * var_408_4, var_408_6.y), true)
	end

	local var_408_8 = 255 * var_408_1 * arg_408_3 * var_408_2
	local var_408_9 = color(255, var_408_8)

	if var_408_0 == "PA" then
		local var_408_10 = slot_0_31_0.easings.out_quart(slot_0_31_0.calculate_value("autopeek", slot_0_31_0.auto_peek, 1, 0, 1))

		ref1, ref2 = ui.find("Aimbot", "Ragebot", "Main", "Peek Assist", "Style")
		ref_color = ref2:get()
		ref_color.a = var_408_8
		var_408_9 = slot_0_31_0.calculate_color(ref_color, color(255, 0, 0, var_408_8), var_408_10)
	end

	render.text(2, arg_408_1, var_408_9, "c", var_408_0)

	if var_408_0 == "DT" then
		render.pop_clip_rect()
	end

	return arg_408_1
end

function slot_0_31_0.render_keybinds_for_indicator(arg_409_0, arg_409_1)
	arg_409_0 = slot_0_31_0.render_ind(slot_0_35_0.double_tap, arg_409_0, nil, arg_409_1)
	arg_409_0 = slot_0_31_0.render_ind(slot_0_35_0.hide_shots, arg_409_0, nil, arg_409_1)
	arg_409_0 = slot_0_31_0.render_ind(slot_0_35_0.fakeduck, arg_409_0, nil, arg_409_1)

	local var_409_0 = ui.get_binds()
	local var_409_1 = false

	for iter_409_0 = 1, #var_409_0 do
		if var_409_0[iter_409_0].name == "Body Aim" then
			var_409_1 = var_409_0[iter_409_0].active and var_409_0[iter_409_0].value == "Force"

			break
		end
	end

	arg_409_0 = slot_0_31_0.render_ind("BODY", arg_409_0, var_409_1, arg_409_1)

	local var_409_2 = false

	for iter_409_1 = 1, #var_409_0 do
		if var_409_0[iter_409_1].name == "Safe Points" then
			local var_409_3

			var_409_3 = var_409_0[iter_409_1].active and var_409_0[iter_409_1].value == "Force"

			break
		end
	end

	arg_409_0 = slot_0_31_0.render_ind(slot_0_35_0.auto_peek, arg_409_0, nil, arg_409_1)

	local var_409_4 = false

	for iter_409_2 = 1, #var_409_0 do
		if var_409_0[iter_409_2].name == "Min. Damage" then
			var_409_4 = var_409_0[iter_409_2].active

			break
		end
	end

	arg_409_0 = slot_0_31_0.render_ind("DMG", arg_409_0, var_409_4, arg_409_1)

	local var_409_5 = false

	for iter_409_3 = 1, #var_409_0 do
		if var_409_0[iter_409_3].name == "Fake Latency" then
			var_409_5 = var_409_0[iter_409_3].active

			break
		end
	end

	arg_409_0 = slot_0_31_0.render_ind("PING", arg_409_0, var_409_5, arg_409_1)
end

function slot_0_31_0.render_gradient_indicator(arg_410_0, arg_410_1, arg_410_2, arg_410_3, arg_410_4, arg_410_5)
	local var_410_0 = slot_0_27_0(arg_410_0, nil, arg_410_1) / 2

	var_410_0.y = 0

	local var_410_1 = -var_410_0

	var_410_1.x = var_410_1.x - 1

	local var_410_2 = #arg_410_2
	local var_410_3 = slot_0_46_0.ui_tables.visuals.indicator_glow.value
	local var_410_4 = slot_0_46_0.ui_tables.visuals.glow_thick.value
	local var_410_5 = slot_0_46_0.ui_tables.visuals.glow_alpha.value
	local var_410_6 = slot_0_31_0.calculate_value("inddrag", drag_system.active_element == "inddrag", -1.3, 0.7, 1)

	for iter_410_0 = 1, #arg_410_1 do
		local var_410_7 = arg_410_2[iter_410_0]

		if not var_410_7 then
			var_410_2 = var_410_2 - 1

			if var_410_2 < 1 then
				var_410_2 = #arg_410_2
			end

			var_410_7 = arg_410_2[var_410_2]
		end

		local var_410_8 = string.sub(arg_410_1, iter_410_0, iter_410_0)
		local var_410_9 = slot_0_27_0(arg_410_0, nil, var_410_8)
		local var_410_10 = arg_410_5 and arg_410_4 * arg_410_5 or slot_0_31_0.global_alpha * arg_410_4
		local var_410_11 = slot_0_31_0.anim_values.nade_alpha and slot_0_31_0.anim_values.nade_alpha or 1
		local var_410_12 = var_410_10 * var_410_6 * var_410_11

		if var_410_3 then
			local var_410_13 = color(var_410_7.r, var_410_7.g, var_410_7.b, var_410_7.a * var_410_5 / 100 * var_410_12)

			slot_0_28_0(arg_410_3 + var_410_1 + vector(0, var_410_9.y / 2 + 1), arg_410_3 + var_410_1 + var_410_9 / 1.25, var_410_13, var_410_4)
		end

		local var_410_14 = color(var_410_7.r, var_410_7.g, var_410_7.b, var_410_7.a * var_410_12)

		slot_0_25_0(arg_410_0, arg_410_3 + var_410_1, var_410_14, nil, var_410_8)

		var_410_1 = var_410_1 + vector(var_410_9.x, 0)
	end
end

slot_0_31_0.logo_font = render.load_font("Verdana", vector(11, 11, 0.7), "abd")

drag_system.add_drag("inddrag", vector(-30, 20), vector(60, 15), slot_0_31_0.screen_size / 2, true, function()
	return slot_0_46_0.ui_tables.visuals.indicator_switch.value and ui.get_alpha() > 0
end)

slot_0_31_0.anim_values.nade_alpha = 1

function slot_0_31_0.indicators_func()
	if not slot_0_46_0.ui_tables.visuals.indicator_switch.value then
		return
	end

	slot_412_0_0 = {}
	slot_412_1_0 = vector(slot_0_31_0.screen_size.x / 2, slot_0_0_0.drag_memory.inddrag_y)
	slot_412_2_0 = nil
	slot_412_3_0 = nil
	slot_412_4_0 = nil

	if slot_0_46_0.ui_tables.visuals.color_use_theme.value then
		slot_412_5_1 = ui.get_style("Link Active")
		slot_412_6_2 = {
			slot_412_5_1:to_hsv()
		}
		slot_412_2_0 = color(255):as_hsv(slot_412_6_2[1], 0.51, 1)
		slot_412_3_0 = color(255):as_hsv(slot_412_6_2[1], 0.43, 1)
		slot_412_4_0 = slot_412_3_0
	else
		slot_412_2_0 = slot_0_46_0.ui_tables.visuals.main_color.value
		slot_412_3_0 = slot_0_46_0.ui_tables.visuals.second_color.value
		slot_412_4_0 = slot_412_3_0
	end

	slot_412_5_0 = globals.curtime * 6 % 23 - 2

	for iter_412_0 = 1, 9 do
		slot_412_10_3 = iter_412_0 < slot_412_5_0 and slot_412_5_0 - iter_412_0 or iter_412_0 - slot_412_5_0

		if iter_412_0 < slot_412_5_0 then
			if slot_412_10_3 <= 5 then
				slot_412_0_0[iter_412_0] = slot_412_3_0
			elseif slot_412_10_3 <= 8 then
				slot_412_10_3 = (slot_412_10_3 - 5) / 3
				slot_412_0_0[iter_412_0] = slot_0_31_0.calculate_color(slot_412_4_0, slot_412_3_0, slot_412_10_3)
			else
				slot_412_10_3 = (slot_412_10_3 - 8) / 4
				slot_412_0_0[iter_412_0] = slot_0_31_0.calculate_color(slot_412_2_0, slot_412_4_0, slot_412_10_3)
			end
		else
			slot_412_10_2 = slot_412_10_3 / 3
			slot_412_0_0[iter_412_0] = slot_0_31_0.calculate_color(slot_412_2_0, slot_412_3_0, slot_412_10_2)
		end
	end

	if ui.get_alpha() ~= 0 and slot_0_31_0.global_alpha == 0 then
		slot_0_31_0.render_gradient_indicator(slot_0_31_0.logo_font, "extension", slot_412_0_0, slot_412_1_0 + vector(0, 20), 1, ui.get_alpha())
	end

	if slot_0_31_0.global_alpha == 0 then
		return
	end

	slot_412_6_1 = 0
	slot_412_7_0 = 0
	slot_412_8_0 = slot_0_23_0()

	if slot_412_8_0 then
		slot_412_9_1 = slot_412_8_0.m_bIsScoped

		slot_0_31_0.calculate_value("scope_ind", slot_412_8_0 and slot_412_8_0:is_alive() and slot_412_9_1, 0.7)
	end

	slot_412_6_0 = slot_0_31_0.easings.in_out_quart(slot_0_31_0.anim_values.scope_ind, 1, 0, 0.99)
	slot_412_9_0 = nil

	if slot_412_8_0 then
		slot_412_9_0 = slot_412_8_0:get_player_weapon()
	end

	slot_0_31_0.calculate_value("nade_alpha", slot_412_9_0 and slot_412_9_0:get_weapon_info().weapon_type ~= 9, 0.5, 0.5, 1)

	if slot_412_6_0 < 0.99 then
		slot_412_10_1 = slot_412_1_0 + vector(-50, 0)
		slot_412_11_1 = slot_412_10_1 + vector(100 * (1 - slot_412_6_0), 80)

		render.push_clip_rect(slot_412_10_1, slot_412_11_1)
		slot_0_31_0.render_keybinds_for_indicator(slot_412_1_0 + vector(10 * slot_412_6_0, 29), 1 - slot_412_6_0)
		slot_0_31_0.render_gradient_indicator(slot_0_31_0.logo_font, "extension", slot_412_0_0, slot_412_1_0 + vector(10 * slot_412_6_0, 20), 1 - slot_412_6_0)
		render.pop_clip_rect()
	end

	if slot_412_6_0 ~= 0 then
		slot_412_10_0 = slot_412_1_0 + vector(100, 0) + vector(-100 * slot_412_6_0, 0)
		slot_412_11_0 = slot_412_1_0 + vector(100, 80)

		render.push_clip_rect(slot_412_10_0, slot_412_11_0)
		slot_0_31_0.render_keybinds_for_indicator(slot_412_1_0 + vector(40 * slot_412_6_0, 29), slot_412_6_0)
		slot_0_31_0.render_gradient_indicator(slot_0_31_0.logo_font, "extension", slot_412_0_0, slot_412_1_0 + vector(40 * slot_412_6_0, 20), slot_412_6_0)
		render.pop_clip_rect()
	end
end

events.render:set(slot_0_31_0.indicators_func)

slot_0_31_0.lc_tickbase = 999999
slot_0_31_0.lc_timer = 0

function slot_0_31_0.defensive_for_ind()
	if not slot_0_46_0.ui_tables.visuals.indicator_switch.value then
		return
	end

	local var_413_0 = slot_0_23_0()

	if not var_413_0 or rage.exploit:get() ~= 1 then
		return
	end

	local var_413_1 = var_413_0.m_nTickBase

	if var_413_1 - 3 > slot_0_31_0.lc_tickbase then
		slot_0_31_0.lc_timer = globals.tickcount + (cvar.sv_maxusrcmdprocessticks:int() - 1)
	end

	slot_0_31_0.lc_tickbase = var_413_1
	slot_0_31_0.lc_timer = slot_0_31_0.lc_timer - globals.tickcount > cvar.sv_maxusrcmdprocessticks:int() + 1 and 0 or slot_0_31_0.lc_timer
end

drag_system.add_drag("dmgdrag", vector(1, 3), vector(10, 10), vector(slot_0_31_0.screen_size.x / 1.98, slot_0_31_0.screen_size.y / 2.05), false, function()
	return slot_0_46_0.ui_tables.visuals.damage_switch.value and ui.get_alpha() > 0
end)

slot_0_31_0.dmg_font = render.load_font("Verdana", 10, "ad")

function slot_0_31_0.render_dmg_indicator()
	local var_415_0 = vector(slot_0_0_0.drag_memory.dmgdrag_x, slot_0_0_0.drag_memory.dmgdrag_y)
	local var_415_1 = slot_0_23_0()
	local var_415_2 = 101
	local var_415_3 = 1
	local var_415_4 = slot_0_31_0.calculate_value("dmg_drag", drag_system.active_element == "dmgdrag", -1.5, 0.7, 1)

	if var_415_1 then
		local var_415_5 = var_415_1:get_player_weapon()

		if var_415_5 then
			var_415_3 = var_415_5:get_weapon_info().weapon_type
			var_415_2 = slot_0_35_0.dmg:get()
		end
	end

	local var_415_6 = var_415_3 ~= 0 and var_415_3 ~= 9 and var_415_3 ~= 7 and var_415_3 ~= 11

	if not slot_0_31_0.anim_values.dmg_a then
		slot_0_31_0.anim_values.dmg_a = 0
		slot_0_31_0.anim_values.dmg = 0
	end

	local var_415_7 = slot_0_31_0.anim_values.dmg_a
	local var_415_8 = slot_0_31_0.animation_value * 2
	local var_415_9 = false
	local var_415_10 = ui.get_binds()

	for iter_415_0 = 1, #var_415_10 do
		if var_415_10[iter_415_0].name == "Min. Damage" then
			var_415_9 = var_415_10[iter_415_0].active

			break
		end
	end

	local var_415_11 = slot_0_46_0.ui_tables.visuals.damage_is_active.value

	slot_0_31_0.anim_values.dmg_a = var_415_6 and (var_415_9 or not var_415_11) and slot_0_19_0(var_415_7 + var_415_8, 0, 1) or slot_0_19_0(var_415_7 - var_415_8, 0, 1)

	local var_415_12 = slot_0_19_0(var_415_7 * slot_0_31_0.global_alpha + ui.get_alpha(), 0, 1) * var_415_4

	var_415_2 = var_415_2 == 0 and "auto" or var_415_2 > 100 and "hp+" .. var_415_2 - 100 or var_415_2

	if var_415_6 and (var_415_9 or not var_415_11) then
		slot_0_31_0.anim_values.dmg = var_415_2
	end

	local var_415_13 = slot_0_46_0.ui_tables.visuals.damage_font.value == 1 and 2 or slot_0_31_0.dmg_font

	slot_0_25_0(var_415_13, var_415_0, color(255, 255 * var_415_12), nil, string.upper(slot_0_31_0.anim_values.dmg))
end

slot_0_46_0.ui_tables.visuals.damage_switch:set_callback(function()
	if slot_0_46_0.ui_tables.visuals.damage_switch.value then
		events.render:set(slot_0_31_0.render_dmg_indicator)
	else
		events.render:unset(slot_0_31_0.render_dmg_indicator)
	end
end, true)

slot_0_31_0.is_scoped = false

function slot_0_31_0.render_manual_arrows()
	if slot_0_31_0.global_alpha == 0 then
		return
	end

	slot_417_0_0 = slot_0_31_0.screen_size
	slot_417_1_0 = slot_0_23_0()
	slot_417_2_0 = false

	if slot_417_1_0 then
		slot_417_2_0 = slot_417_1_0.m_bIsScoped
	end

	slot_417_3_0 = slot_0_31_0.calculate_value("manual_scope", not slot_417_2_0, 1, 0.6, 1) * slot_0_31_0.global_alpha
	slot_417_4_0 = nil
	slot_417_5_0 = nil

	if slot_0_46_0.ui_tables.visuals.color_use_theme.value then
		slot_417_6_1 = ui.get_style("Link Active")
		slot_417_4_0 = slot_417_6_1:clone()
		slot_417_4_0.a = slot_417_4_0.a * slot_417_3_0 * slot_0_31_0.anim_values.nade_alpha
		slot_417_5_0 = slot_417_6_1:clone()
		slot_417_5_0.a = slot_417_5_0.a * slot_417_3_0 * slot_0_31_0.anim_values.nade_alpha
	else
		slot_417_4_0 = slot_0_46_0.ui_tables.visuals.second_color.value:clone()
		slot_417_4_0.a = slot_417_4_0.a * slot_417_3_0 * slot_0_31_0.anim_values.nade_alpha
		slot_417_5_0 = slot_0_46_0.ui_tables.visuals.main_color.value:clone()
		slot_417_5_0.a = slot_417_5_0.a * slot_417_3_0 * slot_0_31_0.anim_values.nade_alpha
	end

	slot_417_6_0 = color(50, 130 * slot_417_3_0 * slot_0_31_0.anim_values.nade_alpha)
	slot_417_7_0 = slot_0_12_0(slot_417_0_0.x / 2)
	slot_417_8_0 = slot_0_12_0(slot_417_0_0.y / 2) + 1
	slot_417_9_0 = 40
	slot_417_10_1 = vector(slot_417_7_0 - slot_417_9_0 + 2, slot_417_8_0 - 9)
	slot_417_11_1 = vector(slot_417_7_0 - slot_417_9_0 + 4, slot_417_8_0 + 9)
	select_color = slot_0_31_0.calculate_color(slot_417_5_0, slot_417_6_0, slot_0_31_0.calculate_value("desync_left", slot_0_51_0.desync_side, 100))

	render.rect(slot_417_10_1, slot_417_11_1, select_color)

	slot_417_10_0 = vector(slot_417_7_0 - slot_417_9_0, slot_417_8_0 + 9)
	slot_417_11_0 = vector(slot_417_7_0 - slot_417_9_0, slot_417_8_0 - 9)
	slot_417_12_1 = vector(slot_417_7_0 - slot_417_9_0 - 15, slot_417_8_0)
	select_color = slot_0_31_0.calculate_color(slot_417_4_0, slot_417_6_0, slot_0_31_0.calculate_value("manual_left", slot_0_51_0.manual_state == 1, 1.7))

	slot_0_29_0(select_color, slot_417_10_0, slot_417_11_0, slot_417_12_1)

	slot_417_13_1 = vector(slot_417_7_0 + slot_417_9_0 - 4, slot_417_8_0 - 9)
	slot_417_14_1 = vector(slot_417_7_0 + slot_417_9_0 - 2, slot_417_8_0 + 9)
	select_color = slot_0_31_0.calculate_color(slot_417_5_0, slot_417_6_0, slot_0_31_0.calculate_value("desync_right", not slot_0_51_0.desync_side, 100))

	render.rect(slot_417_13_1, slot_417_14_1, select_color)

	slot_417_13_0 = vector(slot_417_7_0 + slot_417_9_0, slot_417_8_0 + 9)
	slot_417_14_0 = vector(slot_417_7_0 + slot_417_9_0, slot_417_8_0 - 9)
	slot_417_12_0 = vector(slot_417_7_0 + slot_417_9_0 + 15, slot_417_8_0)
	select_color = slot_0_31_0.calculate_color(slot_417_4_0, slot_417_6_0, slot_0_31_0.calculate_value("manual_right", slot_0_51_0.manual_state == 2, 1.7))

	slot_0_29_0(select_color, slot_417_13_0, slot_417_14_0, slot_417_12_0)
end

slot_0_46_0.ui_tables.visuals.manual_switch:set_callback(function()
	if slot_0_46_0.ui_tables.visuals.manual_switch.value then
		events.render:set(slot_0_31_0.render_manual_arrows)
	else
		events.render:unset(slot_0_31_0.render_manual_arrows)
	end
end, true)

slot_0_31_0.scope_value = 0

function slot_0_31_0.scope_lines()
	slot_419_0_0 = slot_0_23_0()
	slot_419_1_0 = slot_419_0_0 and slot_419_0_0.m_bIsScoped
	slot_0_31_0.is_scoped = slot_419_1_0
	slot_0_31_0.scope_value = slot_0_31_0.calculate_value("scope", slot_419_0_0 and slot_419_0_0:is_alive() and slot_419_1_0)
	slot_419_2_0 = slot_0_31_0.easings.in_out_quart(slot_0_31_0.scope_value)

	if slot_419_2_0 == 0 then
		return
	end

	slot_419_3_0 = slot_0_31_0.screen_size
	slot_419_4_0 = slot_0_46_0.ui_tables.visuals.scope_size.value
	slot_419_5_0 = slot_0_46_0.ui_tables.visuals.scope_gap.value - 1
	slot_419_6_0 = nil
	slot_419_7_0 = nil
	slot_419_8_0 = slot_0_46_0.ui_tables.visuals.scope_color.value

	if slot_419_8_0 == "Gradient" then
		slot_419_9_1 = slot_0_46_0.ui_tables.visuals.scope_color.ref:get(slot_419_8_0)
		slot_419_6_0 = slot_419_9_1[1]
		slot_419_7_0 = slot_419_9_1[2]
	else
		slot_419_6_0 = slot_0_46_0.ui_tables.visuals.scope_color.ref:get(slot_419_8_0)[1]
		slot_419_7_0 = slot_419_6_0:clone()
		slot_419_7_0.a = 0
	end

	slot_419_9_0 = color(slot_419_6_0.r, slot_419_6_0.g, slot_419_6_0.b, slot_419_6_0.a * slot_0_31_0.global_alpha * slot_419_2_0)
	slot_419_10_0 = color(slot_419_7_0.r, slot_419_7_0.g, slot_419_7_0.b, slot_419_7_0.a * slot_0_31_0.global_alpha * slot_419_2_0)
	slot_419_11_0 = slot_419_9_0
	slot_419_12_0 = slot_419_10_0
	slot_419_13_0 = slot_419_4_0 - slot_419_4_0 * slot_419_2_0
	slot_419_14_0 = slot_0_46_0.ui_tables.visuals.scope_type

	if slot_419_14_0.value_by_name.Reversed then
		slot_419_15_4 = slot_419_9_0
		slot_419_9_0 = slot_419_10_0
		slot_419_11_0 = slot_419_10_0
		slot_419_10_0 = slot_419_15_4
		slot_419_12_0 = slot_419_15_4
	end

	slot_419_15_3 = vector(slot_419_3_0.x / 2 + slot_419_5_0 + 1 + slot_419_13_0, slot_419_3_0.y / 2)
	slot_419_16_3 = vector(slot_419_3_0.x / 2 + slot_419_5_0 + slot_419_4_0, slot_419_3_0.y / 2 + 1)

	slot_0_26_0(slot_419_15_3, slot_419_16_3, slot_419_9_0, slot_419_10_0, slot_419_11_0, slot_419_12_0)

	slot_419_15_2 = vector(slot_419_3_0.x / 2 - slot_419_5_0 - slot_419_13_0, slot_419_3_0.y / 2)
	slot_419_16_2 = vector(slot_419_3_0.x / 2 - slot_419_5_0 - slot_419_4_0, slot_419_3_0.y / 2 + 1)

	slot_0_26_0(slot_419_15_2, slot_419_16_2, slot_419_9_0, slot_419_10_0, slot_419_11_0, slot_419_12_0)

	if not slot_419_14_0.value_by_name["T Style"] then
		slot_419_15_1 = vector(slot_419_3_0.x / 2, slot_419_3_0.y / 2 - slot_419_5_0 - slot_419_13_0)
		slot_419_16_1 = vector(slot_419_3_0.x / 2 + 1, slot_419_3_0.y / 2 - slot_419_5_0 - slot_419_4_0)

		slot_0_26_0(slot_419_15_1, slot_419_16_1, slot_419_9_0, slot_419_11_0, slot_419_10_0, slot_419_12_0)
	end

	slot_419_15_0 = vector(slot_419_3_0.x / 2, slot_419_3_0.y / 2 + slot_419_5_0 + 1 + slot_419_13_0)
	slot_419_16_0 = vector(slot_419_3_0.x / 2 + 1, slot_419_3_0.y / 2 + slot_419_5_0 + slot_419_4_0)

	slot_0_26_0(slot_419_15_0, slot_419_16_0, slot_419_9_0, slot_419_11_0, slot_419_10_0, slot_419_12_0)
end

slot_0_46_0.ui_tables.visuals.scope_switch:set_callback(function()
	ui.find("Visuals", "World", "Main", "Override Zoom", "Scope Overlay"):override(slot_0_46_0.ui_tables.visuals.scope_switch.value and "Remove All" or nil, true)

	if slot_0_46_0.ui_tables.visuals.scope_switch.value then
		events.render:set(slot_0_31_0.scope_lines)
	else
		events.render:unset(slot_0_31_0.scope_lines)
	end

	slot_0_31_0.anim_values.scope = 0
	slot_0_31_0.is_scoped = false
end, true)
events.shutdown:set(function()
	if slot_0_46_0.ui_tables.visuals.scope_switch.value then
		ui.find("Visuals", "World", "Main", "Override Zoom", "Scope Overlay"):override()
	end
end)

slot_0_31_0.orig_func = nil
slot_0_31_0.backward = false
slot_0_31_0.static = false
slot_0_31_0.lean = false
slot_0_31_0.last_update = 0
slot_0_31_0.gym_value = 0.65
slot_0_31_0.reverse = true
slot_0_31_0.height = 64
slot_0_31_0.height_animation = 0
slot_0_31_0.animation_value = 0

function slot_0_31_0.breaker_function(arg_422_0)
	local var_422_0 = slot_0_40_0.ref
	local var_422_1 = slot_0_40_0.velocity
	local var_422_2 = slot_0_40_0.on_ground

	if arg_422_0 ~= var_422_0 then
		return
	end

	local var_422_3 = slot_0_16_0("CAnimationLayer_t**", slot_0_16_0("uintptr_t", arg_422_0[0]) + 10640)[0]

	if slot_0_31_0.backward then
		var_422_0.m_flPoseParameter[0] = -180
	end

	if slot_0_31_0.moon then
		var_422_0.m_flPoseParameter[7] = 180
	end

	if slot_0_31_0.static then
		var_422_0.m_flPoseParameter[6] = 1
	end

	if slot_0_31_0.air_walk and not var_422_2 then
		var_422_3[6].m_flWeight = 1
	end

	if slot_0_31_0.lean and slot_0_46_0.ui_tables.visuals.breaker_lean_value.value ~= -1 then
		var_422_3[12].m_flWeight = var_422_1 > 20 and slot_0_46_0.ui_tables.visuals.breaker_lean_value.value / 10 or 0
	end

	if slot_0_46_0.ui_tables.visuals.anim_switch.value and slot_0_46_0.ui_tables.visuals.anim_gym.value then
		if not slot_0_31_0.lean then
			var_422_3[12].m_flWeight = 0
		end

		if entity.get_game_rules().m_fRoundStartTime - 0.7 > globals.curtime then
			var_422_3[11].m_flCycle = slot_0_31_0.gym_value
			var_422_3[11].m_nSequence = 232
			var_422_3[12].m_flWeight = 0
		end

		if slot_0_31_0.last_update ~= globals.tickcount then
			if slot_0_31_0.reverse then
				slot_0_31_0.gym_value = slot_0_19_0(slot_0_31_0.gym_value + 0.005, 0.648, 0.75)
			elseif slot_0_31_0.reverse ~= nil then
				slot_0_31_0.gym_value = slot_0_19_0(slot_0_31_0.gym_value - 0.005, 0.648, 0.75)
			else
				slot_0_31_0.gym_value = slot_0_19_0(slot_0_31_0.gym_value + 0.01, 0, 0.648)
			end

			if slot_0_31_0.gym_value >= 0.75 then
				slot_0_31_0.reverse = false
			end

			if slot_0_31_0.gym_value <= 0.649 and slot_0_31_0.gym_value > 0.64 then
				slot_0_31_0.reverse = true
			end

			if slot_0_31_0.gym_value < 0.64 then
				slot_0_31_0.reverse = nil
			end
		end

		slot_0_31_0.last_update = globals.tickcount
	end
end

events.round_start:set(function()
	slot_0_31_0.reverse = nil
	slot_0_31_0.gym_value = 0
end)
slot_0_46_0.ui_tables.visuals.breaker_switch:set_callback(function()
	if slot_0_46_0.ui_tables.visuals.breaker_switch.value then
		events.post_update_clientside_animation:set(slot_0_31_0.breaker_function)
	else
		events.post_update_clientside_animation:unset(slot_0_31_0.breaker_function)
	end
end, true)
slot_0_46_0.ui_tables.visuals.breaker_list:set_callback(function()
	local var_425_0 = slot_0_46_0.ui_tables.visuals.breaker_list.value_by_name
	local var_425_1

	if var_425_0[1] then
		slot_0_31_0.backward = true
		var_425_1 = "Sliding"
	else
		slot_0_31_0.backward = false
	end

	if var_425_0[2] then
		var_425_1 = "Walking"
	end

	slot_0_35_0.legs_movement:override(var_425_1, true)

	slot_0_31_0.moon = var_425_0[2]
	slot_0_31_0.air_walk = var_425_0[3]
	slot_0_31_0.static = var_425_0[4]
	slot_0_31_0.lean = var_425_0[5]
end, true)
events.createmove:set(function(arg_426_0)
	if slot_0_31_0.lean then
		arg_426_0.animate_move_lean = true
	end
end)
events.shutdown:set(function()
	slot_0_35_0.legs_movement:override()
end)

slot_0_31_0.transperancy_weapon = nil
slot_0_31_0.need_scope_transperancy = false

function slot_0_31_0.transperancy_func(arg_428_0)
	local var_428_0 = slot_0_37_0.chams_material.value == "Material"
	local var_428_1 = slot_0_40_0.ref

	if not var_428_1 then
		return
	end

	local var_428_2 = var_428_1:get_player_weapon()

	if not var_428_2 then
		return
	end

	local var_428_3 = var_428_2:get_index()
	local var_428_4 = var_428_2.m_flNextPrimaryAttack - globals.curtime

	if var_428_2 and var_428_4 <= -0.5 then
		slot_0_31_0.need_scope_transperancy = false
	end

	if var_428_1.m_bIsScoped or slot_0_31_0.need_scope_transperancy then
		if slot_0_46_0.ui_tables.visuals.transparency_keep.value and var_428_2 and slot_0_31_0.transperancy_weapon == var_428_3 then
			if var_428_1.m_bIsScoped then
				slot_0_31_0.need_scope_transperancy = true
			end
		else
			slot_0_31_0.need_scope_transperancy = false
		end

		slot_0_31_0.transperancy_weapon = var_428_3

		if var_428_0 then
			local var_428_5 = slot_0_37_0.chams_color.value

			slot_0_35_0.chams_color:override(color(var_428_5.r, var_428_5.g, var_428_5.b, math.floor(slot_0_46_0.ui_tables.visuals.transparency_scope.value * 2.55)))
		end

		return slot_0_12_0(255 * slot_0_46_0.ui_tables.visuals.transparency_scope.value / 100)
	elseif var_428_0 then
		slot_0_35_0.chams_color:override()
	end

	if not common.is_in_thirdperson() then
		return
	end

	if var_428_2 and var_428_2:get_weapon_info().weapon_type == 9 then
		if var_428_0 then
			local var_428_6 = slot_0_37_0.chams_color.value

			slot_0_35_0.chams_color:override(color(var_428_6.r, var_428_6.g, var_428_6.b, slot_0_12_0(slot_0_46_0.ui_tables.visuals.transparency_nade.value * 2.55)))
		end

		return slot_0_12_0(255 * slot_0_46_0.ui_tables.visuals.transparency_nade.value / 100)
	end

	if var_428_0 then
		local var_428_7 = slot_0_37_0.chams_color.value

		slot_0_35_0.chams_color:override(color(var_428_7.r, var_428_7.g, var_428_7.b, slot_0_12_0(slot_0_46_0.ui_tables.visuals.transparency_alpha.value * 2.55) + 1))
	end

	return slot_0_12_0(255 * slot_0_46_0.ui_tables.visuals.transparency_alpha.value / 100)
end

slot_0_46_0.ui_tables.visuals.transparency_switch:set_callback(function()
	if slot_0_46_0.ui_tables.visuals.transparency_switch.value then
		events.localplayer_transparency:set(slot_0_31_0.transperancy_func)
	else
		events.localplayer_transparency:unset(slot_0_31_0.transperancy_func)
	end

	slot_0_37_0.chams_color:override()
end, true)
events.shutdown:set(function()
	slot_0_37_0.chams_color:override()
end)
ffi.cdef("\n                typedef void VOID;\n                typedef int INT;\n                typedef long LONG;\n                typedef float FLOAT;\n                typedef char CHAR;\n                typedef bool BOOL;\n            \n                typedef VOID* PVOID;\n                typedef PVOID HANDLE;\n                typedef const PVOID* LPCVOID;\n                typedef unsigned int SIZE_T;\n                typedef INT* FARPROC;\n                typedef unsigned long DWORD;\n                typedef DWORD ULONG_PTR;\n                typedef const CHAR* LPCSTR;\n                typedef unsigned char BYTE;\n            \n                typedef BYTE uint8;\n                typedef uint16_t uint16;\n                typedef uint32_t uint32;\n                typedef uint64_t uint64;\n                typedef signed char int8;\n                typedef int16_t int16;\n                typedef int32_t int32;\n                typedef int64_t int64;\n\n                typedef struct\n                {\n                    uint32_t xuid_low;\n                    uint32_t xuid_high;\n                    int32_t sequence_bytes;\n                    uint32_t section_number;\n                    uint32_t uncompressed_sample_offset;\n                \n                } VoiceDataCustom_t;\n\n                typedef struct\n                {\n                    uint32_t xuid_low;\n                    uint32_t xuid_high;\n                \n                } VoiceDataCustomreal_t;\n            \n                typedef struct \n                {\n                  char pad_0000[8]; //0x0000\n                    int32_t client; //0x0008\n                    int32_t audible_mask; //0x000C\n                    uint32_t xuid_low;\n                    uint32_t xuid_high;\n                    void* voide_data_; //0x0018\n                    int32_t proximity; //0x001C\n                    //int32_t caster; //0x0020\n                    int32_t format; //0x0020\n                    int32_t sequence_bytes; //0x0024\n                    uint32_t section_number; //0x0028\n                    uint32_t uncompressed_sample_offset; //0x002C\n                \n                } CSVCMsg_VoiceData_Legacy_t;\n            \n                typedef struct \n                {\n                    uint32_t INetMessage_Vtable; //0x0000\n                    char pad_0004[4]; //0x0004\n                    uint32_t CCLCMsg_VoiceData_Vtable; //0x0008\n                    char pad_000C[8]; //0x000C\n                    void* data; //0x0014\n                    uint32_t xuid_low;\n                    uint32_t xuid_high;\n                    int32_t format; //0x0020\n                    int32_t sequence_bytes; //0x0024\n                    uint32_t section_number; //0x0028\n                    uint32_t uncompressed_sample_offset; //0x002C\n                    int32_t cached_size; //0x0030\n                    uint32_t flags; //0x0034\n                    uint8_t no_stack_overflow[0xFF];\n                \n                } CCLCMsg_VoiceData_Legacy_t;\n\n                typedef struct\n                {   \n                    int16_t tickcount;\n                    char name[3];\n                    int16_t tickcount1;\n                } ext_t;\n\n                typedef struct\n                {\n                    //char pad_0000[8];\n                    int32_t pandora_id;\n                    int entity_id;\n                    vector_t pos;\n\n                } pandora_data_t;\n\n                typedef struct\n                {\n                    int64_t value;\n                } convert_t;\n\n                typedef struct {\n      \n                    char pad_0000[156];\n                    uint32_t net_channel;\n                    uint32_t challenge_count;\n                    double reconnect_time;\n                    int32_t retry_count;\n                    char pad_00A8[88];\n                    int32_t signon_state_count;\n                    char pad_0104[8];\n                    float next_cmd_time;\n                    int32_t server_count;\n                    uint32_t current_sequence;\n                    char pad_0118[8];\n                    char pad_0120[0x4C];\n                    int32_t delta_tick;\n                    bool is_paused;\n                    char pad_0171[3];\n                    int32_t view_entity;\n                    int32_t player_slot;\n                    char pad_017C[4];\n                    char level_name[260];\n                    char level_name_short[40];\n                    char pad_02AC[92];\n                    int32_t max_clients;\n                    char pad_030C[4083];\n                    uint32_t string_table_container;\n                    char pad_1303[14737];\n                    float last_server_tick_time;\n                    bool is_in_simulation;\n                    char pad_4C99[3];\n                    uint32_t old_tick_count;\n                    float tick_remainder;\n                    float frame_time;\n                    int32_t last_outgoing_command;\n                    int32_t choked_commands;\n                    int32_t last_command_ack;\n                    int32_t command_ack;\n                    int32_t sound_sequence;\n                    char pad_4CBC[80];\n                    vector_t view_angles;\n                   \n                } ClientState_t;\n            ")

slot_0_31_0.engine = utils.create_interface("engine.dll", "VEngineClient014")
slot_0_31_0.cclientstate = ffi.cast("ClientState_t***", ffi.cast("uintptr_t**", slot_0_31_0.engine)[0][12] + 16)[0][0]
slot_0_31_0.hclientstate = ffi.cast("DWORD**", ffi.cast("DWORD", slot_0_31_0.cclientstate) + 8)
slot_0_31_0.send_net_msg = utils.get_vfunc(40, "bool(__thiscall*)(void*, void*, bool, bool)")
slot_0_31_0.construct_message = ffi.cast("uint32_t(__fastcall*)(void*, void*)", ffi.cast("DWORD", utils.opcode_scan("engine.dll", "56 57 8B F9 8D 4F 08 C7 07 ? ? ? ? E8 ? ? ? ? C7")))

function slot_0_31_0.voice_message(arg_431_0)
	if slot_0_31_0.cclientstate.net_channel == 0 then
		return
	end

	local var_431_0 = ffi.new("CCLCMsg_VoiceData_Legacy_t")

	ffi.fill(ffi.cast("void*", var_431_0), ffi.sizeof(var_431_0), 0)
	slot_0_31_0.construct_message(var_431_0, nil)

	var_431_0.xuid_low = arg_431_0.xuid_low
	var_431_0.xuid_high = arg_431_0.xuid_high
	var_431_0.sequence_bytes = arg_431_0.sequence_bytes
	var_431_0.section_number = arg_431_0.section_number
	var_431_0.uncompressed_sample_offset = arg_431_0.uncompressed_sample_offset
	var_431_0.format = 0
	var_431_0.flags = 63

	slot_0_31_0.send_net_msg(ffi.cast("DWORD**", slot_0_31_0.cclientstate.net_channel), ffi.cast("void*", var_431_0), false, true)
end

slot_0_31_0.counter = 0
slot_0_31_0.tick_delay = 0
slot_0_31_0.packet_counter = 1
slot_0_31_0.spoof_tickcount = 0

function slot_0_31_0.calculate_fatality_value(arg_432_0)
	local var_432_0 = 0
	local var_432_1 = 1
	local var_432_2 = 8388608
	local var_432_3 = 1065353216
	local var_432_4 = 0
	local var_432_5 = arg_432_0

	if arg_432_0 < 0 then
		var_432_3 = 1082130432
		arg_432_0 = -arg_432_0
	end

	if arg_432_0 >= 1 then
		local var_432_6 = -1

		while var_432_1 < arg_432_0 do
			var_432_1 = var_432_1 * 2
			var_432_6 = var_432_6 + 1
		end

		var_432_4 = var_432_3 + var_432_2 * var_432_6 + (arg_432_0 - 2^var_432_6) * var_432_2 / 2^var_432_6
	end

	if arg_432_0 < 1 and arg_432_0 > 0 then
		local var_432_7 = 1
		local var_432_8 = 0

		while arg_432_0 < var_432_7 do
			var_432_7 = var_432_7 / 2
			var_432_8 = var_432_8 + 1
		end

		var_432_4 = var_432_3 - var_432_2 * var_432_8 + (arg_432_0 - 0.5^var_432_8) * var_432_2 * 2^var_432_8
	end

	if var_432_4 - slot_0_12_0(var_432_4) > 0 and var_432_4 - slot_0_12_0(var_432_4) <= 0.5 then
		var_432_4 = slot_0_12_0(var_432_4)
	end

	if var_432_4 - slot_0_12_0(var_432_4) > 0.5 then
		var_432_4 = slot_0_12_0(var_432_4) + 1
	end

	if var_432_5 > 0 then
		-- block empty
	elseif var_432_5 < 0 then
		var_432_4 = var_432_4 - 2 * var_432_3
	else
		var_432_4 = 0
	end

	return var_432_4
end

slot_0_31_0.cheats_data = {
	Gamesense = {
		uncompressed_sample_offset = 2792467861,
		section_number = 3436095644,
		sequence_bytes = 100022743,
		xuid_high = 145270966,
		xuid_low = 145270966
	},
	Pandora = {
		uncompressed_sample_offset = 3279943680,
		section_number = 1150525622,
		sequence_bytes = 1149312298,
		xuid_high = 86401,
		xuid_low = 683442170,
		tickcount = 86404
	},
	Fatality = {
		uncompressed_sample_offset = 3279943680,
		section_number = 3292561686,
		sequence_bytes = -1003061738,
		xuid_high = 64165,
		xuid_low = 683835386,
		tickcount = 64168
	},
	Primordial = {
		uncompressed_sample_offset = 1992818854,
		section_number = 145227821,
		sequence_bytes = -1148877286,
		xuid_high = 17825793,
		xuid_low = 875522969
	},
	Disabled = {
		uncompressed_sample_offset = 1603282686,
		section_number = 1904262895,
		sequence_bytes = -2086932461,
		xuid_high = 0,
		xuid_low = 3355443602
	},
	Onetap = {
		uncompressed_sample_offset = 16843009,
		section_number = 16843009,
		sequence_bytes = -922432482,
		xuid_high = 348244372,
		xuid_low = 1384339450
	},
	Airflow = {
		uncompressed_sample_offset = 100,
		section_number = 100,
		sequence_bytes = 2818113,
		xuid_high = 4272171521,
		xuid_low = 3735943921
	},
	Nixware = {
		uncompressed_sample_offset = 65121,
		section_number = 228,
		sequence_bytes = 0,
		xuid_high = 7630437,
		xuid_low = 1819636069
	},
	Plaguecheat = {
		uncompressed_sample_offset = 204521781,
		section_number = 16,
		sequence_bytes = -16909332,
		xuid_high = 64250896,
		xuid_low = 907415600,
		tickcount = 3459028
	},
	Rifk7 = {
		uncompressed_sample_offset = 1189786112,
		section_number = 1124925440,
		sequence_bytes = -1000783872,
		xuid_high = 3290578944,
		xuid_low = 636,
		tickcount = 20532
	}
}
slot_0_31_0.packets = {
	Pandora = {
		{
			uncompressed_sample_offset = 4294967121,
			section_number = 4294965803,
			sequence_bytes = 88,
			xuid_high = 8,
			xuid_low = 420187,
			tickcount = 104940
		},
		{
			uncompressed_sample_offset = 4294967129,
			section_number = 4294965778,
			sequence_bytes = -62,
			xuid_high = 1,
			xuid_low = 420187,
			tickcount = 104944
		},
		{
			uncompressed_sample_offset = 4294967121,
			section_number = 4294965812,
			sequence_bytes = 81,
			xuid_high = 7,
			xuid_low = 420187,
			tickcount = 104944
		},
		{
			uncompressed_sample_offset = 4294967121,
			section_number = 4294965810,
			sequence_bytes = 83,
			xuid_high = 8,
			xuid_low = 420187,
			tickcount = 104944
		},
		{
			uncompressed_sample_offset = 4294967129,
			section_number = 4294965781,
			sequence_bytes = -63,
			xuid_high = 1,
			xuid_low = 420187,
			tickcount = 104948
		},
		{
			uncompressed_sample_offset = 4294967121,
			section_number = 4294965821,
			sequence_bytes = 74,
			xuid_high = 7,
			xuid_low = 420187,
			tickcount = 104948
		},
		{
			uncompressed_sample_offset = 4294967121,
			section_number = 4294965819,
			sequence_bytes = 76,
			xuid_high = 8,
			xuid_low = 420187,
			tickcount = 104948
		},
		{
			uncompressed_sample_offset = 4294967129,
			section_number = 4294965788,
			sequence_bytes = -66,
			xuid_high = 1,
			xuid_low = 420187,
			tickcount = 104952
		},
		{
			uncompressed_sample_offset = 4294967121,
			section_number = 4294965828,
			sequence_bytes = 68,
			xuid_high = 7,
			xuid_low = 420187,
			tickcount = 104952
		},
		{
			uncompressed_sample_offset = 4294967121,
			section_number = 4294965827,
			sequence_bytes = 69,
			xuid_high = 8,
			xuid_low = 420187,
			tickcount = 104952
		},
		{
			uncompressed_sample_offset = 4294967129,
			section_number = 4294965793,
			sequence_bytes = -68,
			xuid_high = 1,
			xuid_low = 420187,
			tickcount = 104956
		},
		{
			uncompressed_sample_offset = 4294967121,
			section_number = 4294965830,
			sequence_bytes = 67,
			xuid_high = 7,
			xuid_low = 420187,
			tickcount = 104956
		},
		{
			uncompressed_sample_offset = 4294967121,
			section_number = 4294965830,
			sequence_bytes = 67,
			xuid_high = 8,
			xuid_low = 420187,
			tickcount = 104956
		},
		{
			uncompressed_sample_offset = 4294967121,
			section_number = 4294965828,
			sequence_bytes = 69,
			xuid_high = 7,
			xuid_low = 420187,
			tickcount = 104960
		},
		{
			uncompressed_sample_offset = 4294967121,
			section_number = 4294965828,
			sequence_bytes = 69,
			xuid_high = 8,
			xuid_low = 420187,
			tickcount = 104960
		},
		{
			uncompressed_sample_offset = 4294967056,
			section_number = 4294965655,
			sequence_bytes = 477,
			xuid_high = 13,
			xuid_low = 420187,
			tickcount = 104960
		},
		{
			uncompressed_sample_offset = 4294967129,
			section_number = 4294965801,
			sequence_bytes = -71,
			xuid_high = 1,
			xuid_low = 420187,
			tickcount = 104964
		},
		{
			uncompressed_sample_offset = 4294967121,
			section_number = 4294965823,
			sequence_bytes = 73,
			xuid_high = 7,
			xuid_low = 420187,
			tickcount = 104964
		},
		{
			uncompressed_sample_offset = 4294967121,
			section_number = 4294965824,
			sequence_bytes = 72,
			xuid_high = 8,
			xuid_low = 420187,
			tickcount = 104964
		},
		{
			uncompressed_sample_offset = 4294967129,
			section_number = 4294965803,
			sequence_bytes = -72,
			xuid_high = 1,
			xuid_low = 420187,
			tickcount = 104968
		},
		{
			uncompressed_sample_offset = 4294967121,
			section_number = 4294965816,
			sequence_bytes = 78,
			xuid_high = 7,
			xuid_low = 420187,
			tickcount = 104968
		},
		{
			uncompressed_sample_offset = 4294967121,
			section_number = 4294965818,
			sequence_bytes = 77,
			xuid_high = 8,
			xuid_low = 420187,
			tickcount = 104968
		},
		{
			uncompressed_sample_offset = 4294967121,
			section_number = 4294965808,
			sequence_bytes = 85,
			xuid_high = 7,
			xuid_low = 420187,
			tickcount = 104972
		},
		{
			uncompressed_sample_offset = 4294967121,
			section_number = 4294965810,
			sequence_bytes = 83,
			xuid_high = 8,
			xuid_low = 420187,
			tickcount = 104972
		},
		{
			uncompressed_sample_offset = 4294967077,
			section_number = 4294965685,
			sequence_bytes = 429,
			xuid_high = 13,
			xuid_low = 420187,
			tickcount = 104972
		},
		{
			uncompressed_sample_offset = 4294967121,
			section_number = 4294965799,
			sequence_bytes = 92,
			xuid_high = 7,
			xuid_low = 420187,
			tickcount = 104976
		},
		{
			uncompressed_sample_offset = 4294967121,
			section_number = 4294965801,
			sequence_bytes = 90,
			xuid_high = 8,
			xuid_low = 420187,
			tickcount = 104976
		},
		{
			uncompressed_sample_offset = 4294967078,
			section_number = 4294965695,
			sequence_bytes = 413,
			xuid_high = 13,
			xuid_low = 420187,
			tickcount = 104976
		},
		{
			uncompressed_sample_offset = 4294967121,
			section_number = 4294965790,
			sequence_bytes = 99,
			xuid_high = 7,
			xuid_low = 420187,
			tickcount = 104980
		},
		{
			uncompressed_sample_offset = 4294967121,
			section_number = 4294965792,
			sequence_bytes = 98,
			xuid_high = 8,
			xuid_low = 420187,
			tickcount = 104980
		},
		{
			uncompressed_sample_offset = 4294967082,
			section_number = 4294965702,
			sequence_bytes = 404,
			xuid_high = 13,
			xuid_low = 420187,
			tickcount = 104980
		},
		{
			uncompressed_sample_offset = 4294967121,
			section_number = 4294965787,
			sequence_bytes = 101,
			xuid_high = 7,
			xuid_low = 420187,
			tickcount = 104985
		},
		{
			uncompressed_sample_offset = 4294967121,
			section_number = 4294965787,
			sequence_bytes = 101,
			xuid_high = 8,
			xuid_low = 420187,
			tickcount = 104985
		},
		{
			uncompressed_sample_offset = 4294967087,
			section_number = 4294965710,
			sequence_bytes = 394,
			xuid_high = 13,
			xuid_low = 420187,
			tickcount = 104985
		},
		{
			uncompressed_sample_offset = 4294967129,
			section_number = 4294965811,
			sequence_bytes = -75,
			xuid_high = 1,
			xuid_low = 420187,
			tickcount = 104988
		},
		{
			uncompressed_sample_offset = 4294967121,
			section_number = 4294965788,
			sequence_bytes = 100,
			xuid_high = 7,
			xuid_low = 420187,
			tickcount = 104988
		},
		{
			uncompressed_sample_offset = 4294967121,
			section_number = 4294965788,
			sequence_bytes = 101,
			xuid_high = 8,
			xuid_low = 420187,
			tickcount = 104988
		},
		{
			uncompressed_sample_offset = 4294967121,
			section_number = 4294965791,
			sequence_bytes = 98,
			xuid_high = 8,
			xuid_low = 420187,
			tickcount = 104994
		},
		{
			uncompressed_sample_offset = 4294967062,
			section_number = 4294966189,
			sequence_bytes = 1199,
			xuid_high = 18,
			xuid_low = 420187,
			tickcount = 104994
		},
		{
			uncompressed_sample_offset = 4294967121,
			section_number = 4294965792,
			sequence_bytes = 97,
			xuid_high = 8,
			xuid_low = 420187,
			tickcount = 104994
		},
		{
			uncompressed_sample_offset = 4294967121,
			section_number = 4294965798,
			sequence_bytes = 93,
			xuid_high = 8,
			xuid_low = 420187,
			tickcount = 104996
		},
		{
			uncompressed_sample_offset = 4294967129,
			section_number = 4294965809,
			sequence_bytes = -74,
			xuid_high = 1,
			xuid_low = 420187,
			tickcount = 104998
		},
		{
			uncompressed_sample_offset = 4294967121,
			section_number = 4294965800,
			sequence_bytes = 91,
			xuid_high = 7,
			xuid_low = 420187,
			tickcount = 104998
		},
		{
			uncompressed_sample_offset = 4294967121,
			section_number = 4294965801,
			sequence_bytes = 90,
			xuid_high = 8,
			xuid_low = 420187,
			tickcount = 104998
		},
		{
			uncompressed_sample_offset = 4294967129,
			section_number = 4294965802,
			sequence_bytes = -71,
			xuid_high = 1,
			xuid_low = 420187,
			tickcount = 105003
		},
		{
			uncompressed_sample_offset = 4294967121,
			section_number = 4294965818,
			sequence_bytes = 77,
			xuid_high = 7,
			xuid_low = 420187,
			tickcount = 105003
		},
		{
			uncompressed_sample_offset = 4294967121,
			section_number = 4294965815,
			sequence_bytes = 80,
			xuid_high = 8,
			xuid_low = 420187,
			tickcount = 105003
		},
		{
			uncompressed_sample_offset = 4294967121,
			section_number = 4294965823,
			sequence_bytes = 73,
			xuid_high = 8,
			xuid_low = 420187,
			tickcount = 105007
		},
		{
			uncompressed_sample_offset = 4294967119,
			section_number = 4294965748,
			sequence_bytes = 331,
			xuid_high = 13,
			xuid_low = 420187,
			tickcount = 105007
		},
		{
			uncompressed_sample_offset = 4294967107,
			section_number = 4294966138,
			sequence_bytes = 1192,
			xuid_high = 18,
			xuid_low = 420187,
			tickcount = 105007
		},
		{
			uncompressed_sample_offset = 4294967121,
			section_number = 4294965830,
			sequence_bytes = 67,
			xuid_high = 7,
			xuid_low = 420187,
			tickcount = 105008
		},
		{
			uncompressed_sample_offset = 4294967121,
			section_number = 4294965825,
			sequence_bytes = 71,
			xuid_high = 8,
			xuid_low = 420187,
			tickcount = 105008
		},
		{
			uncompressed_sample_offset = 4294967121,
			section_number = 4294965753,
			sequence_bytes = 323,
			xuid_high = 13,
			xuid_low = 420187,
			tickcount = 105008
		},
		{
			uncompressed_sample_offset = 4294967121,
			section_number = 4294965817,
			sequence_bytes = 78,
			xuid_high = 7,
			xuid_low = 420187,
			tickcount = 105012
		},
		{
			uncompressed_sample_offset = 4294967121,
			section_number = 4294965830,
			sequence_bytes = 67,
			xuid_high = 8,
			xuid_low = 420187,
			tickcount = 105012
		},
		{
			uncompressed_sample_offset = 4294967121,
			section_number = 4294965759,
			sequence_bytes = 311,
			xuid_high = 13,
			xuid_low = 420187,
			tickcount = 105012
		},
		{
			uncompressed_sample_offset = 112,
			section_number = 253,
			sequence_bytes = 157,
			xuid_high = 5,
			xuid_low = 420187,
			tickcount = 105016
		},
		{
			uncompressed_sample_offset = 4294967121,
			section_number = 4294965814,
			sequence_bytes = 80,
			xuid_high = 8,
			xuid_low = 420187,
			tickcount = 105016
		},
		{
			uncompressed_sample_offset = 4294967128,
			section_number = 4294966111,
			sequence_bytes = 1189,
			xuid_high = 18,
			xuid_low = 420187,
			tickcount = 105016
		},
		{
			uncompressed_sample_offset = 4294967121,
			section_number = 4294965804,
			sequence_bytes = 88,
			xuid_high = 7,
			xuid_low = 420187,
			tickcount = 105019
		},
		{
			uncompressed_sample_offset = 4294967121,
			section_number = 4294965806,
			sequence_bytes = 86,
			xuid_high = 8,
			xuid_low = 420187,
			tickcount = 105019
		},
		{
			uncompressed_sample_offset = 4294967121,
			section_number = 4294965772,
			sequence_bytes = 286,
			xuid_high = 13,
			xuid_low = 420187,
			tickcount = 105019
		},
		{
			uncompressed_sample_offset = 4294967129,
			section_number = 4294965800,
			sequence_bytes = -70,
			xuid_high = 1,
			xuid_low = 420187,
			tickcount = 105023
		},
		{
			uncompressed_sample_offset = 4294967121,
			section_number = 4294965795,
			sequence_bytes = 95,
			xuid_high = 7,
			xuid_low = 420187,
			tickcount = 105023
		},
		{
			uncompressed_sample_offset = 4294967121,
			section_number = 4294965798,
			sequence_bytes = 92,
			xuid_high = 8,
			xuid_low = 420187,
			tickcount = 105023
		},
		{
			uncompressed_sample_offset = 4294967121,
			section_number = 4294965796,
			sequence_bytes = 94,
			xuid_high = 8,
			xuid_low = 420187,
			tickcount = 105023
		},
		{
			uncompressed_sample_offset = 4294967070,
			section_number = 4294965780,
			sequence_bytes = 621,
			xuid_high = 20,
			xuid_low = 420187,
			tickcount = 105023
		},
		{
			uncompressed_sample_offset = 4294967121,
			section_number = 4294965795,
			sequence_bytes = 94,
			xuid_high = 8,
			xuid_low = 420187,
			tickcount = 105023
		},
		{
			uncompressed_sample_offset = 4294967129,
			section_number = 4294965791,
			sequence_bytes = -67,
			xuid_high = 1,
			xuid_low = 420187,
			tickcount = 105026
		},
		{
			uncompressed_sample_offset = 4294967121,
			section_number = 4294965789,
			sequence_bytes = 99,
			xuid_high = 7,
			xuid_low = 420187,
			tickcount = 105026
		},
		{
			uncompressed_sample_offset = 4294967121,
			section_number = 4294965791,
			sequence_bytes = 98,
			xuid_high = 8,
			xuid_low = 420187,
			tickcount = 105026
		},
		{
			uncompressed_sample_offset = 4294967121,
			section_number = 4294965790,
			sequence_bytes = 99,
			xuid_high = 8,
			xuid_low = 420187,
			tickcount = 105027
		},
		{
			uncompressed_sample_offset = 4294967121,
			section_number = 4294965790,
			sequence_bytes = 99,
			xuid_high = 8,
			xuid_low = 420187,
			tickcount = 105027
		},
		{
			uncompressed_sample_offset = 4294967121,
			section_number = 4294965789,
			sequence_bytes = 99,
			xuid_high = 8,
			xuid_low = 420187,
			tickcount = 105027
		},
		{
			uncompressed_sample_offset = 4294967129,
			section_number = 4294965785,
			sequence_bytes = -64,
			xuid_high = 1,
			xuid_low = 420187,
			tickcount = 105031
		},
		{
			uncompressed_sample_offset = 4294967121,
			section_number = 4294965789,
			sequence_bytes = 100,
			xuid_high = 8,
			xuid_low = 420187,
			tickcount = 105031
		},
		{
			uncompressed_sample_offset = 4294967121,
			section_number = 4294965781,
			sequence_bytes = 246,
			xuid_high = 13,
			xuid_low = 420187,
			tickcount = 105031
		},
		{
			uncompressed_sample_offset = 4294967054,
			section_number = 4294965747,
			sequence_bytes = 608,
			xuid_high = 20,
			xuid_low = 420187,
			tickcount = 105033
		},
		{
			uncompressed_sample_offset = 4294967104,
			section_number = 4294966756,
			sequence_bytes = 1170,
			xuid_high = 25,
			xuid_low = 420187,
			tickcount = 105033
		},
		{
			uncompressed_sample_offset = 4294967104,
			section_number = 4294966756,
			sequence_bytes = 1170,
			xuid_high = 25,
			xuid_low = 420187,
			tickcount = 105033
		},
		{
			uncompressed_sample_offset = 4294967104,
			section_number = 4294966756,
			sequence_bytes = 1170,
			xuid_high = 25,
			xuid_low = 420187,
			tickcount = 105035
		},
		{
			uncompressed_sample_offset = 4294967104,
			section_number = 4294966756,
			sequence_bytes = 1170,
			xuid_high = 25,
			xuid_low = 420187,
			tickcount = 105035
		},
		{
			uncompressed_sample_offset = 4294967040,
			section_number = 4294965718,
			sequence_bytes = 591,
			xuid_high = 20,
			xuid_low = 420187,
			tickcount = 105039
		},
		{
			uncompressed_sample_offset = 4294967104,
			section_number = 4294966756,
			sequence_bytes = 1170,
			xuid_high = 25,
			xuid_low = 420187,
			tickcount = 105039
		},
		{
			uncompressed_sample_offset = 4294967104,
			section_number = 4294966756,
			sequence_bytes = 1170,
			xuid_high = 25,
			xuid_low = 420187,
			tickcount = 105039
		},
		{
			uncompressed_sample_offset = 4294967121,
			section_number = 4294965775,
			sequence_bytes = 213,
			xuid_high = 13,
			xuid_low = 420187,
			tickcount = 105043
		},
		{
			uncompressed_sample_offset = 4294967121,
			section_number = 4294965775,
			sequence_bytes = 213,
			xuid_high = 13,
			xuid_low = 420187,
			tickcount = 105043
		},
		{
			uncompressed_sample_offset = 4294967121,
			section_number = 4294965789,
			sequence_bytes = 99,
			xuid_high = 8,
			xuid_low = 420187,
			tickcount = 105048
		},
		{
			uncompressed_sample_offset = 4294967064,
			section_number = 4294965690,
			sequence_bytes = 570,
			xuid_high = 20,
			xuid_low = 420187,
			tickcount = 105048
		},
		{
			uncompressed_sample_offset = 95,
			section_number = 4294966602,
			sequence_bytes = 301,
			xuid_high = 22,
			xuid_low = 420187,
			tickcount = 105048
		},
		{
			uncompressed_sample_offset = 4294967129,
			section_number = 4294965781,
			sequence_bytes = -63,
			xuid_high = 1,
			xuid_low = 420187,
			tickcount = 105052
		},
		{
			uncompressed_sample_offset = 4294967121,
			section_number = 4294965792,
			sequence_bytes = 94,
			xuid_high = 7,
			xuid_low = 420187,
			tickcount = 105052
		},
		{
			uncompressed_sample_offset = 4294967121,
			section_number = 4294965791,
			sequence_bytes = 97,
			xuid_high = 8,
			xuid_low = 420187,
			tickcount = 105052
		},
		{
			uncompressed_sample_offset = 4294967121,
			section_number = 4294965792,
			sequence_bytes = 91,
			xuid_high = 8,
			xuid_low = 420187,
			tickcount = 105056
		},
		{
			uncompressed_sample_offset = 4294967129,
			section_number = 4294965779,
			sequence_bytes = -62,
			xuid_high = 1,
			xuid_low = 420187,
			tickcount = 105057
		},
		{
			uncompressed_sample_offset = 4294967121,
			section_number = 4294965791,
			sequence_bytes = 87,
			xuid_high = 7,
			xuid_low = 420187,
			tickcount = 105057
		},
		{
			uncompressed_sample_offset = 4294967121,
			section_number = 4294965792,
			sequence_bytes = 90,
			xuid_high = 8,
			xuid_low = 420187,
			tickcount = 105057
		},
		{
			uncompressed_sample_offset = 4294967129,
			section_number = 4294965778,
			sequence_bytes = -62,
			xuid_high = 1,
			xuid_low = 420187,
			tickcount = 105060
		},
		{
			uncompressed_sample_offset = 4294967121,
			section_number = 4294965791,
			sequence_bytes = 78,
			xuid_high = 7,
			xuid_low = 420187,
			tickcount = 105060
		},
		{
			uncompressed_sample_offset = 4294967121,
			section_number = 4294965791,
			sequence_bytes = 83,
			xuid_high = 8,
			xuid_low = 420187,
			tickcount = 105060
		},
		{
			uncompressed_sample_offset = 4294967129,
			section_number = 4294965771,
			sequence_bytes = -59,
			xuid_high = 1,
			xuid_low = 420187,
			tickcount = 105064
		},
		{
			uncompressed_sample_offset = 4294967121,
			section_number = 4294965790,
			sequence_bytes = 67,
			xuid_high = 7,
			xuid_low = 420187,
			tickcount = 105064
		},
		{
			uncompressed_sample_offset = 4294967121,
			section_number = 4294965791,
			sequence_bytes = 74,
			xuid_high = 8,
			xuid_low = 420187,
			tickcount = 105064
		},
		{
			uncompressed_sample_offset = 4294967128,
			section_number = 4294965758,
			sequence_bytes = -55,
			xuid_high = 1,
			xuid_low = 420187,
			tickcount = 105068
		},
		{
			uncompressed_sample_offset = 4294967121,
			section_number = 4294965790,
			sequence_bytes = 60,
			xuid_high = 8,
			xuid_low = 420187,
			tickcount = 105068
		},
		{
			uncompressed_sample_offset = 4294967121,
			section_number = 4294965768,
			sequence_bytes = 122,
			xuid_high = 13,
			xuid_low = 420187,
			tickcount = 105068
		},
		{
			uncompressed_sample_offset = 4294967129,
			section_number = 4294965740,
			sequence_bytes = -57,
			xuid_high = 1,
			xuid_low = 420187,
			tickcount = 105075
		},
		{
			uncompressed_sample_offset = 4294967121,
			section_number = 4294965783,
			sequence_bytes = 29,
			xuid_high = 7,
			xuid_low = 420187,
			tickcount = 105075
		},
		{
			uncompressed_sample_offset = 4294967121,
			section_number = 4294965785,
			sequence_bytes = 34,
			xuid_high = 8,
			xuid_low = 420187,
			tickcount = 105075
		},
		{
			uncompressed_sample_offset = 4294967129,
			section_number = 4294965731,
			sequence_bytes = -60,
			xuid_high = 1,
			xuid_low = 420187,
			tickcount = 105080
		},
		{
			uncompressed_sample_offset = 4294967121,
			section_number = 4294965778,
			sequence_bytes = 16,
			xuid_high = 7,
			xuid_low = 420187,
			tickcount = 105080
		},
		{
			uncompressed_sample_offset = 4294967121,
			section_number = 4294965781,
			sequence_bytes = 22,
			xuid_high = 8,
			xuid_low = 420187,
			tickcount = 105080
		},
		{
			uncompressed_sample_offset = 4294967122,
			section_number = 4294965775,
			sequence_bytes = 9,
			xuid_high = 8,
			xuid_low = 420187,
			tickcount = 105085
		},
		{
			uncompressed_sample_offset = 4294967085,
			section_number = 4294965675,
			sequence_bytes = 433,
			xuid_high = 20,
			xuid_low = 420187,
			tickcount = 105085
		},
		{
			uncompressed_sample_offset = 4294967181,
			section_number = 4294967092,
			sequence_bytes = 1398,
			xuid_high = 22,
			xuid_low = 420187,
			tickcount = 105085
		},
		{
			uncompressed_sample_offset = 4294967129,
			section_number = 4294965709,
			sequence_bytes = -70,
			xuid_high = 1,
			xuid_low = 420187,
			tickcount = 105087
		},
		{
			uncompressed_sample_offset = 4294967139,
			section_number = 4294965764,
			sequence_bytes = -7,
			xuid_high = 7,
			xuid_low = 420187,
			tickcount = 105087
		},
		{
			uncompressed_sample_offset = 4294967128,
			section_number = 4294965770,
			sequence_bytes = 0,
			xuid_high = 8,
			xuid_low = 420187,
			tickcount = 105087
		},
		{
			uncompressed_sample_offset = 4294967148,
			section_number = 4294965758,
			sequence_bytes = -14,
			xuid_high = 8,
			xuid_low = 420187,
			tickcount = 105092
		},
		{
			uncompressed_sample_offset = 4294967121,
			section_number = 4294965779,
			sequence_bytes = 46,
			xuid_high = 13,
			xuid_low = 420187,
			tickcount = 105092
		},
		{
			uncompressed_sample_offset = 4294967167,
			section_number = 4294967093,
			sequence_bytes = 1419,
			xuid_high = 22,
			xuid_low = 420187,
			tickcount = 105092
		},
		{
			uncompressed_sample_offset = 4294967168,
			section_number = 4294965732,
			sequence_bytes = -24,
			xuid_high = 8,
			xuid_low = 420187,
			tickcount = 105100
		},
		{
			uncompressed_sample_offset = 4294967130,
			section_number = 4294965769,
			sequence_bytes = 13,
			xuid_high = 13,
			xuid_low = 420187,
			tickcount = 105100
		},
		{
			uncompressed_sample_offset = 69,
			section_number = 238,
			sequence_bytes = 482,
			xuid_high = 14,
			xuid_low = 420187,
			tickcount = 105100
		},
		{
			uncompressed_sample_offset = 4294967129,
			section_number = 4294965665,
			sequence_bytes = -98,
			xuid_high = 1,
			xuid_low = 420187,
			tickcount = 105104
		},
		{
			uncompressed_sample_offset = 4294967176,
			section_number = 4294965708,
			sequence_bytes = -24,
			xuid_high = 7,
			xuid_low = 420187,
			tickcount = 105104
		},
		{
			uncompressed_sample_offset = 4294967175,
			section_number = 4294965714,
			sequence_bytes = -25,
			xuid_high = 8,
			xuid_low = 420187,
			tickcount = 105104
		},
		{
			uncompressed_sample_offset = 4294967129,
			section_number = 4294965653,
			sequence_bytes = -109,
			xuid_high = 1,
			xuid_low = 420187,
			tickcount = 105108
		},
		{
			uncompressed_sample_offset = 4294967177,
			section_number = 4294965692,
			sequence_bytes = -29,
			xuid_high = 7,
			xuid_low = 420187,
			tickcount = 105108
		},
		{
			uncompressed_sample_offset = 4294967177,
			section_number = 4294965699,
			sequence_bytes = -26,
			xuid_high = 8,
			xuid_low = 420187,
			tickcount = 105108
		},
		{
			uncompressed_sample_offset = 4294967129,
			section_number = 4294965646,
			sequence_bytes = -116,
			xuid_high = 1,
			xuid_low = 420187,
			tickcount = 105112
		},
		{
			uncompressed_sample_offset = 4294967175,
			section_number = 4294965679,
			sequence_bytes = -39,
			xuid_high = 7,
			xuid_low = 420187,
			tickcount = 105112
		},
		{
			uncompressed_sample_offset = 4294967177,
			section_number = 4294965684,
			sequence_bytes = -34,
			xuid_high = 8,
			xuid_low = 420187,
			tickcount = 105112
		},
		{
			uncompressed_sample_offset = 4294967129,
			section_number = 4294965635,
			sequence_bytes = -128,
			xuid_high = 1,
			xuid_low = 420187,
			tickcount = 105116
		},
		{
			uncompressed_sample_offset = 4294967169,
			section_number = 4294965663,
			sequence_bytes = -54,
			xuid_high = 7,
			xuid_low = 420187,
			tickcount = 105116
		},
		{
			uncompressed_sample_offset = 4294967173,
			section_number = 4294965673,
			sequence_bytes = -44,
			xuid_high = 8,
			xuid_low = 420187,
			tickcount = 105116
		},
		{
			uncompressed_sample_offset = 4294967129,
			section_number = 4294965630,
			sequence_bytes = -136,
			xuid_high = 1,
			xuid_low = 420187,
			tickcount = 105119
		},
		{
			uncompressed_sample_offset = 4294967167,
			section_number = 4294965660,
			sequence_bytes = -57,
			xuid_high = 8,
			xuid_low = 420187,
			tickcount = 105119
		},
		{
			uncompressed_sample_offset = 4294967175,
			section_number = 4294965720,
			sequence_bytes = -44,
			xuid_high = 13,
			xuid_low = 420187,
			tickcount = 105119
		},
		{
			uncompressed_sample_offset = 4294967129,
			section_number = 4294965622,
			sequence_bytes = -147,
			xuid_high = 1,
			xuid_low = 420187,
			tickcount = 105123
		},
		{
			uncompressed_sample_offset = 4294967148,
			section_number = 4294965644,
			sequence_bytes = -84,
			xuid_high = 7,
			xuid_low = 420187,
			tickcount = 105123
		},
		{
			uncompressed_sample_offset = 4294967159,
			section_number = 4294965652,
			sequence_bytes = -70,
			xuid_high = 8,
			xuid_low = 420187,
			tickcount = 105123
		},
		{
			uncompressed_sample_offset = 4294967156,
			section_number = 4294965649,
			sequence_bytes = -74,
			xuid_high = 8,
			xuid_low = 420187,
			tickcount = 105124
		},
		{
			uncompressed_sample_offset = 4294967228,
			section_number = 4294966192,
			sequence_bytes = 990,
			xuid_high = 18,
			xuid_low = 420187,
			tickcount = 105124
		},
		{
			uncompressed_sample_offset = 4294967129,
			section_number = 4294965604,
			sequence_bytes = -169,
			xuid_high = 1,
			xuid_low = 420187,
			tickcount = 105131
		},
		{
			uncompressed_sample_offset = 4294967140,
			section_number = 4294965632,
			sequence_bytes = -119,
			xuid_high = 7,
			xuid_low = 420187,
			tickcount = 105131
		},
		{
			uncompressed_sample_offset = 4294967132,
			section_number = 4294965636,
			sequence_bytes = -107,
			xuid_high = 8,
			xuid_low = 420187,
			tickcount = 105131
		},
		{
			uncompressed_sample_offset = 4294967144,
			section_number = 4294965631,
			sequence_bytes = -125,
			xuid_high = 8,
			xuid_low = 420187,
			tickcount = 105136
		},
		{
			uncompressed_sample_offset = 4294967156,
			section_number = 4294965685,
			sequence_bytes = -100,
			xuid_high = 13,
			xuid_low = 420187,
			tickcount = 105136
		},
		{
			uncompressed_sample_offset = 96,
			section_number = 203,
			sequence_bytes = 399,
			xuid_high = 14,
			xuid_low = 420187,
			tickcount = 105136
		},
		{
			uncompressed_sample_offset = 4294967129,
			section_number = 4294965589,
			sequence_bytes = -204,
			xuid_high = 1,
			xuid_low = 420187,
			tickcount = 105144
		},
		{
			uncompressed_sample_offset = 4294967167,
			section_number = 4294965626,
			sequence_bytes = -175,
			xuid_high = 7,
			xuid_low = 420187,
			tickcount = 105144
		},
		{
			uncompressed_sample_offset = 4294967164,
			section_number = 4294965626,
			sequence_bytes = -163,
			xuid_high = 8,
			xuid_low = 420187,
			tickcount = 105144
		},
		{
			uncompressed_sample_offset = 4294967170,
			section_number = 4294965625,
			sequence_bytes = -194,
			xuid_high = 7,
			xuid_low = 420187,
			tickcount = 105148
		},
		{
			uncompressed_sample_offset = 4294967169,
			section_number = 4294965625,
			sequence_bytes = -181,
			xuid_high = 8,
			xuid_low = 420187,
			tickcount = 105148
		},
		{
			uncompressed_sample_offset = 4294967129,
			section_number = 4294965651,
			sequence_bytes = -128,
			xuid_high = 13,
			xuid_low = 420187,
			tickcount = 105148
		},
		{
			uncompressed_sample_offset = 4294967129,
			section_number = 4294965584,
			sequence_bytes = -230,
			xuid_high = 1,
			xuid_low = 420187,
			tickcount = 105152
		},
		{
			uncompressed_sample_offset = 4294967171,
			section_number = 4294965625,
			sequence_bytes = -201,
			xuid_high = 8,
			xuid_low = 420187,
			tickcount = 105152
		},
		{
			uncompressed_sample_offset = 4294967129,
			section_number = 4294965646,
			sequence_bytes = -132,
			xuid_high = 13,
			xuid_low = 420187,
			tickcount = 105152
		},
		{
			uncompressed_sample_offset = 4294967129,
			section_number = 4294965582,
			sequence_bytes = -240,
			xuid_high = 1,
			xuid_low = 420187,
			tickcount = 105156
		},
		{
			uncompressed_sample_offset = 4294967167,
			section_number = 4294965626,
			sequence_bytes = -234,
			xuid_high = 7,
			xuid_low = 420187,
			tickcount = 105156
		},
		{
			uncompressed_sample_offset = 4294967169,
			section_number = 4294965625,
			sequence_bytes = -219,
			xuid_high = 8,
			xuid_low = 420187,
			tickcount = 105156
		},
		{
			uncompressed_sample_offset = 4294967129,
			section_number = 4294965581,
			sequence_bytes = -250,
			xuid_high = 1,
			xuid_low = 420187,
			tickcount = 105160
		},
		{
			uncompressed_sample_offset = 4294967160,
			section_number = 4294965627,
			sequence_bytes = -254,
			xuid_high = 7,
			xuid_low = 420187,
			tickcount = 105160
		},
		{
			uncompressed_sample_offset = 4294967165,
			section_number = 4294965626,
			sequence_bytes = -241,
			xuid_high = 8,
			xuid_low = 420187,
			tickcount = 105160
		},
		{
			uncompressed_sample_offset = 4294967129,
			section_number = 4294965581,
			sequence_bytes = -253,
			xuid_high = 1,
			xuid_low = 420187,
			tickcount = 105164
		},
		{
			uncompressed_sample_offset = 4294967151,
			section_number = 4294965628,
			sequence_bytes = -275,
			xuid_high = 7,
			xuid_low = 420187,
			tickcount = 105164
		},
		{
			uncompressed_sample_offset = 4294967159,
			section_number = 4294965627,
			sequence_bytes = -257,
			xuid_high = 8,
			xuid_low = 420187,
			tickcount = 105164
		},
		{
			uncompressed_sample_offset = 4294967156,
			section_number = 4294965627,
			sequence_bytes = -264,
			xuid_high = 8,
			xuid_low = 420187,
			tickcount = 105164
		},
		{
			uncompressed_sample_offset = 4294967167,
			section_number = 4294965786,
			sequence_bytes = 114,
			xuid_high = 20,
			xuid_low = 420187,
			tickcount = 105164
		},
		{
			uncompressed_sample_offset = 4294967129,
			section_number = 4294967096,
			sequence_bytes = 1365,
			xuid_high = 22,
			xuid_low = 420187,
			tickcount = 105164
		},
		{
			uncompressed_sample_offset = 4294967129,
			section_number = 4294965591,
			sequence_bytes = -266,
			xuid_high = 1,
			xuid_low = 420187,
			tickcount = 105168
		},
		{
			uncompressed_sample_offset = 4294967147,
			section_number = 4294965629,
			sequence_bytes = -281,
			xuid_high = 8,
			xuid_low = 420187,
			tickcount = 105168
		},
		{
			uncompressed_sample_offset = 4294967137,
			section_number = 4294967096,
			sequence_bytes = 1359,
			xuid_high = 22,
			xuid_low = 420187,
			tickcount = 105168
		},
		{
			uncompressed_sample_offset = 4294967129,
			section_number = 4294965592,
			sequence_bytes = -267,
			xuid_high = 1,
			xuid_low = 420187,
			tickcount = 105170
		},
		{
			uncompressed_sample_offset = 4294967138,
			section_number = 4294965628,
			sequence_bytes = -296,
			xuid_high = 7,
			xuid_low = 420187,
			tickcount = 105170
		},
		{
			uncompressed_sample_offset = 4294967143,
			section_number = 4294965629,
			sequence_bytes = -288,
			xuid_high = 8,
			xuid_low = 420187,
			tickcount = 105170
		},
		{
			uncompressed_sample_offset = 4294967129,
			section_number = 4294965594,
			sequence_bytes = -270,
			xuid_high = 1,
			xuid_low = 420187,
			tickcount = 105172
		},
		{
			uncompressed_sample_offset = 4294967133,
			section_number = 4294965628,
			sequence_bytes = -303,
			xuid_high = 8,
			xuid_low = 420187,
			tickcount = 105172
		},
		{
			uncompressed_sample_offset = 4294967129,
			section_number = 4294965628,
			sequence_bytes = -147,
			xuid_high = 13,
			xuid_low = 420187,
			tickcount = 105172
		},
		{
			uncompressed_sample_offset = 4294967129,
			section_number = 4294965597,
			sequence_bytes = -273,
			xuid_high = 1,
			xuid_low = 420187,
			tickcount = 105176
		},
		{
			uncompressed_sample_offset = 4294967147,
			section_number = 4294965629,
			sequence_bytes = -335,
			xuid_high = 7,
			xuid_low = 420187,
			tickcount = 105176
		},
		{
			uncompressed_sample_offset = 4294967137,
			section_number = 4294965629,
			sequence_bytes = -320,
			xuid_high = 8,
			xuid_low = 420187,
			tickcount = 105176
		},
		{
			uncompressed_sample_offset = 4294967129,
			section_number = 4294965599,
			sequence_bytes = -278,
			xuid_high = 1,
			xuid_low = 420187,
			tickcount = 105180
		},
		{
			uncompressed_sample_offset = 4294967157,
			section_number = 4294965623,
			sequence_bytes = -352,
			xuid_high = 7,
			xuid_low = 420187,
			tickcount = 105180
		},
		{
			uncompressed_sample_offset = 4294967151,
			section_number = 4294965628,
			sequence_bytes = -341,
			xuid_high = 8,
			xuid_low = 420187,
			tickcount = 105180
		},
		{
			uncompressed_sample_offset = 4294967165,
			section_number = 4294965612,
			sequence_bytes = -367,
			xuid_high = 7,
			xuid_low = 420187,
			tickcount = 105184
		},
		{
			uncompressed_sample_offset = 4294967160,
			section_number = 4294965619,
			sequence_bytes = -357,
			xuid_high = 8,
			xuid_low = 420187,
			tickcount = 105184
		},
		{
			uncompressed_sample_offset = 4294967129,
			section_number = 4294965617,
			sequence_bytes = -156,
			xuid_high = 13,
			xuid_low = 420187,
			tickcount = 105184
		},
		{
			uncompressed_sample_offset = 4294967170,
			section_number = 4294965603,
			sequence_bytes = -384,
			xuid_high = 7,
			xuid_low = 420187,
			tickcount = 105188
		},
		{
			uncompressed_sample_offset = 4294967167,
			section_number = 4294965609,
			sequence_bytes = -372,
			xuid_high = 8,
			xuid_low = 420187,
			tickcount = 105188
		},
		{
			uncompressed_sample_offset = 4294967129,
			section_number = 4294965613,
			sequence_bytes = -158,
			xuid_high = 13,
			xuid_low = 420187,
			tickcount = 105188
		},
		{
			uncompressed_sample_offset = 4294967129,
			section_number = 4294965600,
			sequence_bytes = -282,
			xuid_high = 1,
			xuid_low = 420187,
			tickcount = 105192
		},
		{
			uncompressed_sample_offset = 4294967171,
			section_number = 4294965597,
			sequence_bytes = -403,
			xuid_high = 7,
			xuid_low = 420187,
			tickcount = 105192
		},
		{
			uncompressed_sample_offset = 4294967171,
			section_number = 4294965600,
			sequence_bytes = -391,
			xuid_high = 8,
			xuid_low = 420187,
			tickcount = 105192
		},
		{
			uncompressed_sample_offset = 4294967170,
			section_number = 4294965596,
			sequence_bytes = -423,
			xuid_high = 7,
			xuid_low = 420187,
			tickcount = 105198
		},
		{
			uncompressed_sample_offset = 4294967171,
			section_number = 4294965596,
			sequence_bytes = -409,
			xuid_high = 8,
			xuid_low = 420187,
			tickcount = 105198
		},
		{
			uncompressed_sample_offset = 4294967129,
			section_number = 4294965604,
			sequence_bytes = -162,
			xuid_high = 13,
			xuid_low = 420187,
			tickcount = 105198
		},
		{
			uncompressed_sample_offset = 4294967153,
			section_number = 4294965604,
			sequence_bytes = -472,
			xuid_high = 8,
			xuid_low = 420187,
			tickcount = 105209
		},
		{
			uncompressed_sample_offset = 4294967143,
			section_number = 4294965609,
			sequence_bytes = -488,
			xuid_high = 8,
			xuid_low = 420187,
			tickcount = 105213
		},
		{
			uncompressed_sample_offset = 4294967129,
			section_number = 4294965590,
			sequence_bytes = -167,
			xuid_high = 13,
			xuid_low = 420187,
			tickcount = 105213
		},
		{
			uncompressed_sample_offset = 4294967134,
			section_number = 4294967140,
			sequence_bytes = 1346,
			xuid_high = 22,
			xuid_low = 420187,
			tickcount = 105213
		},
		{
			uncompressed_sample_offset = 4294967126,
			section_number = 4294965616,
			sequence_bytes = -511,
			xuid_high = 8,
			xuid_low = 420187,
			tickcount = 105217
		},
		{
			uncompressed_sample_offset = 4294967149,
			section_number = 4294965681,
			sequence_bytes = -95,
			xuid_high = 20,
			xuid_low = 420187,
			tickcount = 105217
		},
		{
			uncompressed_sample_offset = 4294967128,
			section_number = 4294967150,
			sequence_bytes = 1347,
			xuid_high = 22,
			xuid_low = 420187,
			tickcount = 105217
		},
		{
			uncompressed_sample_offset = 4294967119,
			section_number = 4294965621,
			sequence_bytes = -525,
			xuid_high = 8,
			xuid_low = 420187,
			tickcount = 105219
		},
		{
			uncompressed_sample_offset = 4294967129,
			section_number = 4294967152,
			sequence_bytes = 1347,
			xuid_high = 22,
			xuid_low = 420187,
			tickcount = 105219
		},
		{
			uncompressed_sample_offset = 4294967120,
			section_number = 4294965623,
			sequence_bytes = -535,
			xuid_high = 8,
			xuid_low = 420187,
			tickcount = 105224
		},
		{
			uncompressed_sample_offset = 4294967129,
			section_number = 4294965577,
			sequence_bytes = -172,
			xuid_high = 13,
			xuid_low = 420187,
			tickcount = 105224
		},
		{
			uncompressed_sample_offset = 4294967133,
			section_number = 4294965647,
			sequence_bytes = -119,
			xuid_high = 20,
			xuid_low = 420187,
			tickcount = 105224
		},
		{
			uncompressed_sample_offset = 4294967120,
			section_number = 4294965626,
			sequence_bytes = -548,
			xuid_high = 8,
			xuid_low = 420187,
			tickcount = 105228
		},
		{
			uncompressed_sample_offset = 4294967120,
			section_number = 4294965626,
			sequence_bytes = -550,
			xuid_high = 8,
			xuid_low = 420187,
			tickcount = 105228
		},
		{
			uncompressed_sample_offset = 4294967129,
			section_number = 4294965579,
			sequence_bytes = -357,
			xuid_high = 1,
			xuid_low = 420187,
			tickcount = 105232
		},
		{
			uncompressed_sample_offset = 4294967120,
			section_number = 4294965630,
			sequence_bytes = -570,
			xuid_high = 7,
			xuid_low = 420187,
			tickcount = 105232
		},
		{
			uncompressed_sample_offset = 4294967120,
			section_number = 4294965628,
			sequence_bytes = -561,
			xuid_high = 8,
			xuid_low = 420187,
			tickcount = 105232
		},
		{
			uncompressed_sample_offset = 4294967120,
			section_number = 4294965631,
			sequence_bytes = -571,
			xuid_high = 8,
			xuid_low = 420187,
			tickcount = 105235
		},
		{
			uncompressed_sample_offset = 4294967129,
			section_number = 4294965552,
			sequence_bytes = -182,
			xuid_high = 13,
			xuid_low = 420187,
			tickcount = 105235
		},
		{
			uncompressed_sample_offset = 32,
			section_number = 4294966362,
			sequence_bytes = 781,
			xuid_high = 18,
			xuid_low = 420187,
			tickcount = 105235
		},
		{
			uncompressed_sample_offset = 4294967121,
			section_number = 4294965632,
			sequence_bytes = -574,
			xuid_high = 8,
			xuid_low = 420187,
			tickcount = 105236
		},
		{
			uncompressed_sample_offset = 4294967122,
			section_number = 4294965643,
			sequence_bytes = -594,
			xuid_high = 7,
			xuid_low = 420187,
			tickcount = 105239
		},
		{
			uncompressed_sample_offset = 4294967121,
			section_number = 4294965637,
			sequence_bytes = -584,
			xuid_high = 8,
			xuid_low = 420187,
			tickcount = 105239
		},
		{
			uncompressed_sample_offset = 4294967129,
			section_number = 4294965541,
			sequence_bytes = -186,
			xuid_high = 13,
			xuid_low = 420187,
			tickcount = 105239
		},
		{
			uncompressed_sample_offset = 4294967123,
			section_number = 4294965652,
			sequence_bytes = -609,
			xuid_high = 8,
			xuid_low = 420187,
			tickcount = 105248
		},
		{
			uncompressed_sample_offset = 4294967129,
			section_number = 4294965516,
			sequence_bytes = -196,
			xuid_high = 13,
			xuid_low = 420187,
			tickcount = 105248
		},
		{
			uncompressed_sample_offset = 47,
			section_number = 4294966347,
			sequence_bytes = 745,
			xuid_high = 18,
			xuid_low = 420187,
			tickcount = 105248
		},
		{
			uncompressed_sample_offset = 4294967124,
			section_number = 4294965544,
			sequence_bytes = -397,
			xuid_high = 1,
			xuid_low = 420187,
			tickcount = 105251
		},
		{
			uncompressed_sample_offset = 4294967136,
			section_number = 4294965662,
			sequence_bytes = -630,
			xuid_high = 7,
			xuid_low = 420187,
			tickcount = 105251
		},
		{
			uncompressed_sample_offset = 4294967123,
			section_number = 4294965657,
			sequence_bytes = -619,
			xuid_high = 8,
			xuid_low = 420187,
			tickcount = 105251
		},
		{
			uncompressed_sample_offset = 4294967123,
			section_number = 4294965529,
			sequence_bytes = -400,
			xuid_high = 1,
			xuid_low = 420187,
			tickcount = 105255
		},
		{
			uncompressed_sample_offset = 4294967151,
			section_number = 4294965669,
			sequence_bytes = -642,
			xuid_high = 7,
			xuid_low = 420187,
			tickcount = 105255
		},
		{
			uncompressed_sample_offset = 4294967138,
			section_number = 4294965662,
			sequence_bytes = -631,
			xuid_high = 8,
			xuid_low = 420187,
			tickcount = 105255
		},
		{
			uncompressed_sample_offset = 4294967122,
			section_number = 4294965517,
			sequence_bytes = -401,
			xuid_high = 1,
			xuid_low = 420187,
			tickcount = 105259
		},
		{
			uncompressed_sample_offset = 4294967162,
			section_number = 4294965676,
			sequence_bytes = -655,
			xuid_high = 7,
			xuid_low = 420187,
			tickcount = 105259
		},
		{
			uncompressed_sample_offset = 4294967152,
			section_number = 4294965670,
			sequence_bytes = -643,
			xuid_high = 8,
			xuid_low = 420187,
			tickcount = 105259
		},
		{
			uncompressed_sample_offset = 4294967171,
			section_number = 4294965684,
			sequence_bytes = -668,
			xuid_high = 8,
			xuid_low = 420187,
			tickcount = 105267
		},
		{
			uncompressed_sample_offset = 64,
			section_number = 4294966325,
			sequence_bytes = 682,
			xuid_high = 18,
			xuid_low = 420187,
			tickcount = 105267
		},
		{
			uncompressed_sample_offset = 4294967133,
			section_number = 4294965460,
			sequence_bytes = -188,
			xuid_high = 20,
			xuid_low = 420187,
			tickcount = 105267
		},
		{
			uncompressed_sample_offset = 4294967120,
			section_number = 4294965482,
			sequence_bytes = -409,
			xuid_high = 1,
			xuid_low = 420187,
			tickcount = 105271
		},
		{
			uncompressed_sample_offset = 4294967176,
			section_number = 4294965692,
			sequence_bytes = -683,
			xuid_high = 8,
			xuid_low = 420187,
			tickcount = 105271
		},
		{
			uncompressed_sample_offset = 4294967159,
			section_number = 4294965437,
			sequence_bytes = -199,
			xuid_high = 13,
			xuid_low = 420187,
			tickcount = 105271
		},
		{
			uncompressed_sample_offset = 4294967176,
			section_number = 4294965710,
			sequence_bytes = -714,
			xuid_high = 8,
			xuid_low = 420187,
			tickcount = 105281
		},
		{
			uncompressed_sample_offset = 4294967104,
			section_number = 4294966756,
			sequence_bytes = 1170,
			xuid_high = 25,
			xuid_low = 420187,
			tickcount = 105281
		},
		{
			uncompressed_sample_offset = 4294967175,
			section_number = 4294965711,
			sequence_bytes = -717,
			xuid_high = 8,
			xuid_low = 420187,
			tickcount = 105281
		},
		{
			uncompressed_sample_offset = 4294967117,
			section_number = 4294965461,
			sequence_bytes = -434,
			xuid_high = 1,
			xuid_low = 420187,
			tickcount = 105283
		},
		{
			uncompressed_sample_offset = 4294967172,
			section_number = 4294965717,
			sequence_bytes = -726,
			xuid_high = 8,
			xuid_low = 420187,
			tickcount = 105283
		},
		{
			uncompressed_sample_offset = 4294967182,
			section_number = 4294965394,
			sequence_bytes = -207,
			xuid_high = 13,
			xuid_low = 420187,
			tickcount = 105283
		},
		{
			uncompressed_sample_offset = 4294967170,
			section_number = 4294965718,
			sequence_bytes = -730,
			xuid_high = 8,
			xuid_low = 420187,
			tickcount = 105285
		},
		{
			uncompressed_sample_offset = 4294967170,
			section_number = 4294965388,
			sequence_bytes = -208,
			xuid_high = 20,
			xuid_low = 420187,
			tickcount = 105285
		},
		{
			uncompressed_sample_offset = 4294967162,
			section_number = 4294965725,
			sequence_bytes = -745,
			xuid_high = 8,
			xuid_low = 420187,
			tickcount = 105287
		},
		{
			uncompressed_sample_offset = 4294967151,
			section_number = 4294965732,
			sequence_bytes = -761,
			xuid_high = 8,
			xuid_low = 420187,
			tickcount = 105293
		},
		{
			uncompressed_sample_offset = 4294967169,
			section_number = 4294965355,
			sequence_bytes = -230,
			xuid_high = 20,
			xuid_low = 420187,
			tickcount = 105293
		},
		{
			uncompressed_sample_offset = 4294967149,
			section_number = 4294965733,
			sequence_bytes = -764,
			xuid_high = 8,
			xuid_low = 420187,
			tickcount = 105293
		},
		{
			uncompressed_sample_offset = 4294967135,
			section_number = 4294965740,
			sequence_bytes = -778,
			xuid_high = 8,
			xuid_low = 420187,
			tickcount = 105295
		},
		{
			uncompressed_sample_offset = 4294967180,
			section_number = 4294965372,
			sequence_bytes = -235,
			xuid_high = 13,
			xuid_low = 420187,
			tickcount = 105295
		},
		{
			uncompressed_sample_offset = 4294967136,
			section_number = 4294965747,
			sequence_bytes = -794,
			xuid_high = 8,
			xuid_low = 420187,
			tickcount = 105300
		},
		{
			uncompressed_sample_offset = 4294967153,
			section_number = 4294965321,
			sequence_bytes = -253,
			xuid_high = 20,
			xuid_low = 420187,
			tickcount = 105300
		},
		{
			uncompressed_sample_offset = 4294967140,
			section_number = 4294965748,
			sequence_bytes = -796,
			xuid_high = 8,
			xuid_low = 420187,
			tickcount = 105300
		},
		{
			uncompressed_sample_offset = 4294967117,
			section_number = 4294965470,
			sequence_bytes = -497,
			xuid_high = 1,
			xuid_low = 420187,
			tickcount = 105304
		},
		{
			uncompressed_sample_offset = 112,
			section_number = 253,
			sequence_bytes = 157,
			xuid_high = 5,
			xuid_low = 420187,
			tickcount = 105304
		},
		{
			uncompressed_sample_offset = 4294967151,
			section_number = 4294965754,
			sequence_bytes = -812,
			xuid_high = 8,
			xuid_low = 420187,
			tickcount = 105304
		},
		{
			uncompressed_sample_offset = 4294967117,
			section_number = 4294965473,
			sequence_bytes = -506,
			xuid_high = 1,
			xuid_low = 420187,
			tickcount = 105308
		},
		{
			uncompressed_sample_offset = 4294967165,
			section_number = 4294965766,
			sequence_bytes = -840,
			xuid_high = 7,
			xuid_low = 420187,
			tickcount = 105308
		},
		{
			uncompressed_sample_offset = 4294967160,
			section_number = 4294965761,
			sequence_bytes = -828,
			xuid_high = 8,
			xuid_low = 420187,
			tickcount = 105308
		},
		{
			uncompressed_sample_offset = 4294967117,
			section_number = 4294965478,
			sequence_bytes = -518,
			xuid_high = 1,
			xuid_low = 420187,
			tickcount = 105312
		},
		{
			uncompressed_sample_offset = 4294967170,
			section_number = 4294965774,
			sequence_bytes = -858,
			xuid_high = 7,
			xuid_low = 420187,
			tickcount = 105312
		},
		{
			uncompressed_sample_offset = 4294967167,
			section_number = 4294965768,
			sequence_bytes = -844,
			xuid_high = 8,
			xuid_low = 420187,
			tickcount = 105312
		},
		{
			uncompressed_sample_offset = 4294967117,
			section_number = 4294965481,
			sequence_bytes = -527,
			xuid_high = 1,
			xuid_low = 420187,
			tickcount = 105315
		},
		{
			uncompressed_sample_offset = 4294967171,
			section_number = 4294965783,
			sequence_bytes = -875,
			xuid_high = 7,
			xuid_low = 420187,
			tickcount = 105315
		},
		{
			uncompressed_sample_offset = 4294967170,
			section_number = 4294965777,
			sequence_bytes = -863,
			xuid_high = 8,
			xuid_low = 420187,
			tickcount = 105315
		},
		{
			uncompressed_sample_offset = 4294967171,
			section_number = 4294965785,
			sequence_bytes = -879,
			xuid_high = 8,
			xuid_low = 420187,
			tickcount = 105320
		},
		{
			uncompressed_sample_offset = 4294967139,
			section_number = 4294965333,
			sequence_bytes = -332,
			xuid_high = 13,
			xuid_low = 420187,
			tickcount = 105320
		},
		{
			uncompressed_sample_offset = 4294967171,
			section_number = 4294965787,
			sequence_bytes = -882,
			xuid_high = 8,
			xuid_low = 420187,
			tickcount = 105320
		},
		{
			uncompressed_sample_offset = 4294967117,
			section_number = 4294965487,
			sequence_bytes = -553,
			xuid_high = 1,
			xuid_low = 420187,
			tickcount = 105324
		},
		{
			uncompressed_sample_offset = 4294967164,
			section_number = 4294965802,
			sequence_bytes = -910,
			xuid_high = 7,
			xuid_low = 420187,
			tickcount = 105324
		},
		{
			uncompressed_sample_offset = 4294967168,
			section_number = 4294965796,
			sequence_bytes = -898,
			xuid_high = 8,
			xuid_low = 420187,
			tickcount = 105324
		},
		{
			uncompressed_sample_offset = 4294967162,
			section_number = 4294965805,
			sequence_bytes = -915,
			xuid_high = 8,
			xuid_low = 420187,
			tickcount = 105329
		},
		{
			uncompressed_sample_offset = 4294967161,
			section_number = 4294965807,
			sequence_bytes = -918,
			xuid_high = 8,
			xuid_low = 420187,
			tickcount = 105329
		},
		{
			uncompressed_sample_offset = 4294967117,
			section_number = 4294965486,
			sequence_bytes = -574,
			xuid_high = 1,
			xuid_low = 420187,
			tickcount = 105333
		},
		{
			uncompressed_sample_offset = 4294967154,
			section_number = 4294965815,
			sequence_bytes = -933,
			xuid_high = 8,
			xuid_low = 420187,
			tickcount = 105333
		},
		{
			uncompressed_sample_offset = 4294967162,
			section_number = 4294965296,
			sequence_bytes = -384,
			xuid_high = 13,
			xuid_low = 420187,
			tickcount = 105333
		},
		{
			uncompressed_sample_offset = 4294967142,
			section_number = 4294965825,
			sequence_bytes = -951,
			xuid_high = 8,
			xuid_low = 420187,
			tickcount = 105337
		},
		{
			uncompressed_sample_offset = 4294967139,
			section_number = 4294965826,
			sequence_bytes = -955,
			xuid_high = 8,
			xuid_low = 420187,
			tickcount = 105337
		},
		{
			uncompressed_sample_offset = 4294967132,
			section_number = 4294965836,
			sequence_bytes = -972,
			xuid_high = 8,
			xuid_low = 420187,
			tickcount = 105339
		},
		{
			uncompressed_sample_offset = 4294967156,
			section_number = 4294965215,
			sequence_bytes = -402,
			xuid_high = 20,
			xuid_low = 420187,
			tickcount = 105339
		},
		{
			uncompressed_sample_offset = 4294967144,
			section_number = 4294965844,
			sequence_bytes = -987,
			xuid_high = 8,
			xuid_low = 420187,
			tickcount = 105344
		},
		{
			uncompressed_sample_offset = 4294967156,
			section_number = 4294965253,
			sequence_bytes = -400,
			xuid_high = 13,
			xuid_low = 420187,
			tickcount = 105344
		},
		{
			uncompressed_sample_offset = 4294967146,
			section_number = 4294965846,
			sequence_bytes = -989,
			xuid_high = 8,
			xuid_low = 420187,
			tickcount = 105344
		},
		{
			uncompressed_sample_offset = 4294967155,
			section_number = 4294965853,
			sequence_bytes = -1002,
			xuid_high = 8,
			xuid_low = 420187,
			tickcount = 105349
		},
		{
			uncompressed_sample_offset = 4294967134,
			section_number = 4294965175,
			sequence_bytes = -396,
			xuid_high = 20,
			xuid_low = 420187,
			tickcount = 105349
		},
		{
			uncompressed_sample_offset = 4294967157,
			section_number = 4294965854,
			sequence_bytes = -1006,
			xuid_high = 8,
			xuid_low = 420187,
			tickcount = 105349
		},
		{
			uncompressed_sample_offset = 4294967164,
			section_number = 4294965861,
			sequence_bytes = -1019,
			xuid_high = 8,
			xuid_low = 420187,
			tickcount = 105353
		},
		{
			uncompressed_sample_offset = 4294967165,
			section_number = 4294965863,
			sequence_bytes = -1022,
			xuid_high = 8,
			xuid_low = 420187,
			tickcount = 105353
		},
		{
			uncompressed_sample_offset = 4294967169,
			section_number = 4294965870,
			sequence_bytes = -1036,
			xuid_high = 8,
			xuid_low = 420187,
			tickcount = 105356
		},
		{
			uncompressed_sample_offset = 4294967122,
			section_number = 4294965194,
			sequence_bytes = -403,
			xuid_high = 13,
			xuid_low = 420187,
			tickcount = 105356
		},
		{
			uncompressed_sample_offset = 4294967132,
			section_number = 4294965137,
			sequence_bytes = -401,
			xuid_high = 20,
			xuid_low = 420187,
			tickcount = 105356
		},
		{
			uncompressed_sample_offset = 4294967171,
			section_number = 4294965880,
			sequence_bytes = -1053,
			xuid_high = 8,
			xuid_low = 420187,
			tickcount = 105360
		},
		{
			uncompressed_sample_offset = 4294967141,
			section_number = 4294965120,
			sequence_bytes = -410,
			xuid_high = 20,
			xuid_low = 420187,
			tickcount = 105360
		},
		{
			uncompressed_sample_offset = 4294967171,
			section_number = 4294965881,
			sequence_bytes = -1056,
			xuid_high = 8,
			xuid_low = 420187,
			tickcount = 105360
		},
		{
			uncompressed_sample_offset = 4294967171,
			section_number = 4294965890,
			sequence_bytes = -1070,
			xuid_high = 8,
			xuid_low = 420187,
			tickcount = 105363
		},
		{
			uncompressed_sample_offset = 4294967170,
			section_number = 4294965892,
			sequence_bytes = -1073,
			xuid_high = 8,
			xuid_low = 420187,
			tickcount = 105363
		},
		{
			uncompressed_sample_offset = 4294967166,
			section_number = 4294965902,
			sequence_bytes = -1087,
			xuid_high = 8,
			xuid_low = 420187,
			tickcount = 105368
		},
		{
			uncompressed_sample_offset = 4294967149,
			section_number = 4294965138,
			sequence_bytes = -394,
			xuid_high = 13,
			xuid_low = 420187,
			tickcount = 105368
		},
		{
			uncompressed_sample_offset = 4294967158,
			section_number = 4294965090,
			sequence_bytes = -433,
			xuid_high = 20,
			xuid_low = 420187,
			tickcount = 105368
		},
		{
			uncompressed_sample_offset = 4294967117,
			section_number = 4294965400,
			sequence_bytes = -598,
			xuid_high = 1,
			xuid_low = 420187,
			tickcount = 105371
		},
		{
			uncompressed_sample_offset = 4294967152,
			section_number = 4294965922,
			sequence_bytes = -1116,
			xuid_high = 7,
			xuid_low = 420187,
			tickcount = 105371
		},
		{
			uncompressed_sample_offset = 4294967161,
			section_number = 4294965911,
			sequence_bytes = -1101,
			xuid_high = 8,
			xuid_low = 420187,
			tickcount = 105371
		},
		{
			uncompressed_sample_offset = 4294967117,
			section_number = 4294965398,
			sequence_bytes = -592,
			xuid_high = 1,
			xuid_low = 420187,
			tickcount = 105376
		},
		{
			uncompressed_sample_offset = 4294967140,
			section_number = 4294965935,
			sequence_bytes = -1132,
			xuid_high = 7,
			xuid_low = 420187,
			tickcount = 105376
		},
		{
			uncompressed_sample_offset = 4294967151,
			section_number = 4294965924,
			sequence_bytes = -1118,
			xuid_high = 8,
			xuid_low = 420187,
			tickcount = 105376
		},
		{
			uncompressed_sample_offset = 4294967117,
			section_number = 4294965397,
			sequence_bytes = -589,
			xuid_high = 1,
			xuid_low = 420187,
			tickcount = 105380
		},
		{
			uncompressed_sample_offset = 4294967133,
			section_number = 4294965949,
			sequence_bytes = -1147,
			xuid_high = 7,
			xuid_low = 420187,
			tickcount = 105380
		},
		{
			uncompressed_sample_offset = 4294967136,
			section_number = 4294965939,
			sequence_bytes = -1137,
			xuid_high = 8,
			xuid_low = 420187,
			tickcount = 105380
		},
		{
			uncompressed_sample_offset = 4294967117,
			section_number = 4294965394,
			sequence_bytes = -581,
			xuid_high = 1,
			xuid_low = 420187,
			tickcount = 105384
		},
		{
			uncompressed_sample_offset = 4294967147,
			section_number = 4294965964,
			sequence_bytes = -1158,
			xuid_high = 7,
			xuid_low = 420187,
			tickcount = 105384
		},
		{
			uncompressed_sample_offset = 4294967137,
			section_number = 4294965954,
			sequence_bytes = -1151,
			xuid_high = 8,
			xuid_low = 420187,
			tickcount = 105384
		},
		{
			uncompressed_sample_offset = 4294967117,
			section_number = 4294965390,
			sequence_bytes = -573,
			xuid_high = 1,
			xuid_low = 420187,
			tickcount = 105387
		},
		{
			uncompressed_sample_offset = 4294967158,
			section_number = 4294965979,
			sequence_bytes = -1168,
			xuid_high = 7,
			xuid_low = 420187,
			tickcount = 105387
		},
		{
			uncompressed_sample_offset = 4294967150,
			section_number = 4294965968,
			sequence_bytes = -1161,
			xuid_high = 8,
			xuid_low = 420187,
			tickcount = 105387
		},
		{
			uncompressed_sample_offset = 4294967165,
			section_number = 4294965996,
			sequence_bytes = -1177,
			xuid_high = 7,
			xuid_low = 420187,
			tickcount = 105393
		},
		{
			uncompressed_sample_offset = 4294967160,
			section_number = 4294965985,
			sequence_bytes = -1171,
			xuid_high = 8,
			xuid_low = 420187,
			tickcount = 105393
		},
		{
			uncompressed_sample_offset = 4294967134,
			section_number = 4294965062,
			sequence_bytes = -451,
			xuid_high = 13,
			xuid_low = 420187,
			tickcount = 105393
		}
	},
	Fatality = {
		{
			uncompressed_sample_offset = 1115688960,
			section_number = 3263291604,
			sequence_bytes = -1000118690,
			xuid_high = 95495,
			xuid_low = 682524666,
			tickcount = 95499
		},
		{
			uncompressed_sample_offset = 1120607216,
			section_number = 1116114317,
			sequence_bytes = -1000603354,
			xuid_high = 95495,
			xuid_low = 682000378,
			tickcount = 95499
		},
		{
			uncompressed_sample_offset = 3279943680,
			section_number = 3297470449,
			sequence_bytes = -998113024,
			xuid_high = 95496,
			xuid_low = 683442170,
			tickcount = 95500
		},
		{
			uncompressed_sample_offset = 1115688960,
			section_number = 3263291604,
			sequence_bytes = -1000118690,
			xuid_high = 95496,
			xuid_low = 682524666,
			tickcount = 95500
		},
		{
			uncompressed_sample_offset = 1120190520,
			section_number = 1116144958,
			sequence_bytes = -1000603354,
			xuid_high = 95496,
			xuid_low = 682000378,
			tickcount = 95500
		}
	},
	Nixware = {
		{
			uncompressed_sample_offset = 2974822910,
			section_number = 3650207471,
			sequence_bytes = 59832833,
			xuid_high = 0,
			xuid_low = 3355443654,
			tickcount = 58204
		},
		{
			uncompressed_sample_offset = 900759678,
			section_number = 814923503,
			sequence_bytes = -66743538,
			xuid_high = 0,
			xuid_low = 104857614,
			tickcount = 58208
		},
		{
			uncompressed_sample_offset = 2998929883,
			section_number = 2878652143,
			sequence_bytes = -2102494713,
			xuid_high = 0,
			xuid_low = 3355443656,
			tickcount = 58461
		},
		{
			uncompressed_sample_offset = 3227519130,
			section_number = 3449274095,
			sequence_bytes = 1091269901,
			xuid_high = 0,
			xuid_low = 3355443656,
			tickcount = 58467
		},
		{
			uncompressed_sample_offset = 3455074232,
			section_number = 3348676335,
			sequence_bytes = -1023970560,
			xuid_high = 0,
			xuid_low = 3355443656,
			tickcount = 58473
		},
		{
			uncompressed_sample_offset = 3656400824,
			section_number = 429506287,
			sequence_bytes = 1123614219,
			xuid_high = 0,
			xuid_low = 3355443656,
			tickcount = 58480
		},
		{
			uncompressed_sample_offset = 3816817503,
			section_number = 731561711,
			sequence_bytes = -1023380729,
			xuid_high = 0,
			xuid_low = 3355443656,
			tickcount = 58486
		},
		{
			uncompressed_sample_offset = 4126162877,
			section_number = 964738799,
			sequence_bytes = 1146156805,
			xuid_high = 0,
			xuid_low = 3355443656,
			tickcount = 58494
		},
		{
			uncompressed_sample_offset = 1528837560,
			section_number = 3078733551,
			sequence_bytes = -2116065527,
			xuid_high = 0,
			xuid_low = 3355443657,
			tickcount = 58547
		},
		{
			uncompressed_sample_offset = 1777352635,
			section_number = 2105851631,
			sequence_bytes = -1026986489,
			xuid_high = 0,
			xuid_low = 3355443657,
			tickcount = 58553
		},
		{
			uncompressed_sample_offset = 1923097788,
			section_number = 1837547247,
			sequence_bytes = -2091881964,
			xuid_high = 0,
			xuid_low = 3355443657,
			tickcount = 58557
		},
		{
			uncompressed_sample_offset = 1275068616,
			section_number = 1065860847,
			sequence_bytes = -1071914746,
			xuid_high = 0,
			xuid_low = 104857614,
			tickcount = 58563
		},
		{
			uncompressed_sample_offset = 119943255,
			section_number = 1166589679,
			sequence_bytes = -1016173303,
			xuid_high = 0,
			xuid_low = 204800,
			tickcount = 58569
		},
		{
			uncompressed_sample_offset = 119953495,
			section_number = 1233764079,
			sequence_bytes = 1080653569,
			xuid_high = 0,
			xuid_low = 204800,
			tickcount = 58576
		},
		{
			uncompressed_sample_offset = 119963733,
			section_number = 2106244847,
			sequence_bytes = -2100267264,
			xuid_high = 0,
			xuid_low = 204800,
			tickcount = 58582
		},
		{
			uncompressed_sample_offset = 2886733791,
			section_number = 3180117743,
			sequence_bytes = 1079764749,
			xuid_high = 0,
			xuid_low = 3355443657,
			tickcount = 58588
		},
		{
			uncompressed_sample_offset = 119988305,
			section_number = 2978922223,
			sequence_bytes = -1037010939,
			xuid_high = 0,
			xuid_low = 106496,
			tickcount = 58594
		},
		{
			uncompressed_sample_offset = 1311736317,
			section_number = 1217380079,
			sequence_bytes = -937972981,
			xuid_high = 0,
			xuid_low = 104857614,
			tickcount = 58600
		},
		{
			uncompressed_sample_offset = 3524267992,
			section_number = 764591855,
			sequence_bytes = -2135720178,
			xuid_high = 0,
			xuid_low = 3355443657,
			tickcount = 58607
		},
		{
			uncompressed_sample_offset = 3719300507,
			section_number = 3180642031,
			sequence_bytes = -1039900415,
			xuid_high = 0,
			xuid_low = 905970121,
			tickcount = 58611
		},
		{
			uncompressed_sample_offset = 1331693451,
			section_number = 1905770223,
			sequence_bytes = -2111146489,
			xuid_high = 0,
			xuid_low = 104857614,
			tickcount = 58618
		},
		{
			uncompressed_sample_offset = 1337164215,
			section_number = 1771618031,
			sequence_bytes = -1027000317,
			xuid_high = 0,
			xuid_low = 104857614,
			tickcount = 58623
		},
		{
			uncompressed_sample_offset = 99631032,
			section_number = 429506287,
			sequence_bytes = -2097611509,
			xuid_high = 0,
			xuid_low = 3355443658,
			tickcount = 58630
		},
		{
			uncompressed_sample_offset = 120078419,
			section_number = 1603976943,
			sequence_bytes = -2097191929,
			xuid_high = 0,
			xuid_low = 204800,
			tickcount = 58636
		},
		{
			uncompressed_sample_offset = 468729785,
			section_number = 1031847663,
			sequence_bytes = -2078744315,
			xuid_high = 0,
			xuid_low = 3355443658,
			tickcount = 58641
		},
		{
			uncompressed_sample_offset = 701512511,
			section_number = 931249903,
			sequence_bytes = -2105644285,
			xuid_high = 0,
			xuid_low = 3355443658,
			tickcount = 58648
		},
		{
			uncompressed_sample_offset = 837828542,
			section_number = 965000943,
			sequence_bytes = 34955783,
			xuid_high = 0,
			xuid_low = 3355443658,
			tickcount = 58653
		},
		{
			uncompressed_sample_offset = 1077938203,
			section_number = 3515268847,
			sequence_bytes = 33846803,
			xuid_high = 0,
			xuid_low = 3355443658,
			tickcount = 58660
		},
		{
			uncompressed_sample_offset = 120135762,
			section_number = 3750215407,
			sequence_bytes = -2145616892,
			xuid_high = 0,
			xuid_low = 204800,
			tickcount = 58666
		},
		{
			uncompressed_sample_offset = 120148054,
			section_number = 3179855599,
			sequence_bytes = 59076870,
			xuid_high = 0,
			xuid_low = 73728,
			tickcount = 58672
		},
		{
			uncompressed_sample_offset = 120160343,
			section_number = 462012143,
			sequence_bytes = -1053589759,
			xuid_high = 0,
			xuid_low = 204800,
			tickcount = 58678
		},
		{
			uncompressed_sample_offset = 120172631,
			section_number = 696958703,
			sequence_bytes = -2093449983,
			xuid_high = 0,
			xuid_low = 204800,
			tickcount = 58684
		},
		{
			uncompressed_sample_offset = 1405094671,
			section_number = 3582770927,
			sequence_bytes = -2131629555,
			xuid_high = 0,
			xuid_low = 104857614,
			tickcount = 58690
		},
		{
			uncompressed_sample_offset = 1412399613,
			section_number = 1217380079,
			sequence_bytes = -937972981,
			xuid_high = 0,
			xuid_low = 104857614,
			tickcount = 58696
		},
		{
			uncompressed_sample_offset = 2450526168,
			section_number = 764591855,
			sequence_bytes = -2135720178,
			xuid_high = 0,
			xuid_low = 3355443658,
			tickcount = 58701
		},
		{
			uncompressed_sample_offset = 120223826,
			section_number = 3616980719,
			sequence_bytes = 1099817216,
			xuid_high = 0,
			xuid_low = 204800,
			tickcount = 58707
		},
		{
			uncompressed_sample_offset = 120236115,
			section_number = 228048623,
			sequence_bytes = -2108723193,
			xuid_high = 0,
			xuid_low = 204800,
			tickcount = 58714
		},
		{
			uncompressed_sample_offset = 3085975487,
			section_number = 1100529391,
			sequence_bytes = -1028162298,
			xuid_high = 0,
			xuid_low = 3355443658,
			tickcount = 58719
		},
		{
			uncompressed_sample_offset = 3320856504,
			section_number = 429506287,
			sequence_bytes = -2097611253,
			xuid_high = 0,
			xuid_low = 3355443658,
			tickcount = 58726
		},
		{
			uncompressed_sample_offset = 120270930,
			section_number = 1603976943,
			sequence_bytes = -1023450105,
			xuid_high = 0,
			xuid_low = 204800,
			tickcount = 58731
		},
		{
			uncompressed_sample_offset = 3689955262,
			section_number = 3850419951,
			sequence_bytes = -1001132539,
			xuid_high = 0,
			xuid_low = 1711276490,
			tickcount = 58737
		},
		{
			uncompressed_sample_offset = 3924836287,
			section_number = 495042287,
			sequence_bytes = 1108566274,
			xuid_high = 0,
			xuid_low = 3355443658,
			tickcount = 58743
		},
		{
			uncompressed_sample_offset = 4092608442,
			section_number = 3582246639,
			sequence_bytes = 86303244,
			xuid_high = 0,
			xuid_low = 3355443658,
			tickcount = 58749
		},
		{
			uncompressed_sample_offset = 4289726878,
			section_number = 2709962479,
			sequence_bytes = 1108309006,
			xuid_high = 0,
			xuid_low = 3355443658,
			tickcount = 58755
		},
		{
			uncompressed_sample_offset = 120334417,
			section_number = 4018650863,
			sequence_bytes = -2146571519,
			xuid_high = 0,
			xuid_low = 204800,
			tickcount = 58761
		},
		{
			uncompressed_sample_offset = 376443482,
			section_number = 562609903,
			sequence_bytes = -1060372722,
			xuid_high = 0,
			xuid_low = 3355443659,
			tickcount = 58767
		},
		{
			uncompressed_sample_offset = 120361046,
			section_number = 2844442351,
			sequence_bytes = -1017678847,
			xuid_high = 0,
			xuid_low = 204800,
			tickcount = 58773
		},
		{
			uncompressed_sample_offset = 120373333,
			section_number = 160218863,
			sequence_bytes = 1096285196,
			xuid_high = 0,
			xuid_low = 204800,
			tickcount = 58780
		},
		{
			uncompressed_sample_offset = 1274036158,
			section_number = 4186947311,
			sequence_bytes = 49576714,
			xuid_high = 0,
			xuid_low = 3355443659,
			tickcount = 58794
		},
		{
			uncompressed_sample_offset = 1519419518,
			section_number = 814923503,
			sequence_bytes = -1039820018,
			xuid_high = 0,
			xuid_low = 104857614,
			tickcount = 58798
		},
		{
			uncompressed_sample_offset = 120416343,
			section_number = 93765359,
			sequence_bytes = -1066338560,
			xuid_high = 0,
			xuid_low = 204800,
			tickcount = 58800
		},
		{
			uncompressed_sample_offset = 1808794143,
			section_number = 3449274095,
			sequence_bytes = -2107807740,
			xuid_high = 0,
			xuid_low = 3355443659,
			tickcount = 58810
		},
		{
			uncompressed_sample_offset = 2146451391,
			section_number = 2509815535,
			sequence_bytes = -2100073211,
			xuid_high = 0,
			xuid_low = 3355443659,
			tickcount = 58818
		},
		{
			uncompressed_sample_offset = 2213560248,
			section_number = 429506287,
			sequence_bytes = 1123614219,
			xuid_high = 0,
			xuid_low = 3355443659,
			tickcount = 58822
		},
		{
			uncompressed_sample_offset = 3195013592,
			section_number = 3147480815,
			sequence_bytes = -2106758908,
			xuid_high = 0,
			xuid_low = 3355443660,
			tickcount = 58983
		},
		{
			uncompressed_sample_offset = 1719599605,
			section_number = 1937817327,
			sequence_bytes = -999441660,
			xuid_high = 0,
			xuid_low = 53477390,
			tickcount = 58989
		},
		{
			uncompressed_sample_offset = 3815782778,
			section_number = 2776743663,
			sequence_bytes = -1027966200,
			xuid_high = 0,
			xuid_low = 3355443660,
			tickcount = 58999
		},
		{
			uncompressed_sample_offset = 4154470969,
			section_number = 1770307311,
			sequence_bytes = -995295997,
			xuid_high = 0,
			xuid_low = 3355443660,
			tickcount = 59007
		},
		{
			uncompressed_sample_offset = 1888358,
			section_number = 2407907055,
			sequence_bytes = -2130122742,
			xuid_high = 0,
			xuid_low = 3200,
			tickcount = 59016
		},
		{
			uncompressed_sample_offset = 120875094,
			section_number = 1904656111,
			sequence_bytes = 1125147405,
			xuid_high = 0,
			xuid_low = 61440,
			tickcount = 59026
		},
		{
			uncompressed_sample_offset = 676333279,
			section_number = 2911354607,
			sequence_bytes = -2113701630,
			xuid_high = 0,
			xuid_low = 3355443661,
			tickcount = 59035
		},
		{
			uncompressed_sample_offset = 120914007,
			section_number = 965263087,
			sequence_bytes = 1109778697,
			xuid_high = 0,
			xuid_low = 204800,
			tickcount = 59043
		},
		{
			uncompressed_sample_offset = 1344286908,
			section_number = 294239983,
			sequence_bytes = 1102146572,
			xuid_high = 0,
			xuid_low = 3355443661,
			tickcount = 59052
		},
		{
			uncompressed_sample_offset = 1676689339,
			section_number = 1804254959,
			sequence_bytes = 78409743,
			xuid_high = 0,
			xuid_low = 3355443661,
			tickcount = 59061
		},
		{
			uncompressed_sample_offset = 1807712765,
			section_number = 1653325551,
			sequence_bytes = -434238702,
			xuid_high = 0,
			xuid_low = 104857614,
			tickcount = 59070
		},
		{
			uncompressed_sample_offset = 2280654781,
			section_number = 3649879791,
			sequence_bytes = -1050578662,
			xuid_high = 0,
			xuid_low = 3355443661,
			tickcount = 59079
		},
		{
			uncompressed_sample_offset = 2566915387,
			section_number = 193838831,
			sequence_bytes = -2122224359,
			xuid_high = 0,
			xuid_low = 3355443661,
			tickcount = 59088
		},
		{
			uncompressed_sample_offset = 2884648892,
			section_number = 3381640943,
			sequence_bytes = 1148610056,
			xuid_high = 0,
			xuid_low = 3355443661,
			tickcount = 59097
		},
		{
			uncompressed_sample_offset = 1843429502,
			section_number = 814923503,
			sequence_bytes = -1039820018,
			xuid_high = 0,
			xuid_low = 104857614,
			tickcount = 59107
		},
		{
			uncompressed_sample_offset = 121059413,
			section_number = 496418543,
			sequence_bytes = -2143722492,
			xuid_high = 0,
			xuid_low = 204800,
			tickcount = 59115
		},
		{
			uncompressed_sample_offset = 3788520060,
			section_number = 228048623,
			sequence_bytes = 1078686471,
			xuid_high = 0,
			xuid_low = 3355443661,
			tickcount = 59125
		},
		{
			uncompressed_sample_offset = 4025499576,
			section_number = 429506287,
			sequence_bytes = 1123614219,
			xuid_high = 0,
			xuid_low = 3355443661,
			tickcount = 59133
		},
		{
			uncompressed_sample_offset = 69208796,
			section_number = 161136367,
			sequence_bytes = 42105605,
			xuid_high = 0,
			xuid_low = 3355443662,
			tickcount = 59142
		},
		{
			uncompressed_sample_offset = 1891172839,
			section_number = 713080559,
			sequence_bytes = -400212209,
			xuid_high = 0,
			xuid_low = 53477390,
			tickcount = 59151
		},
		{
			uncompressed_sample_offset = 703610812,
			section_number = 2072297199,
			sequence_bytes = -2069758205,
			xuid_high = 0,
			xuid_low = 3355443662,
			tickcount = 59160
		},
		{
			uncompressed_sample_offset = 948963933,
			section_number = 3146104559,
			sequence_bytes = -1073579770,
			xuid_high = 0,
			xuid_low = 3355443662,
			tickcount = 59170
		},
		{
			uncompressed_sample_offset = 121190485,
			section_number = 2508701423,
			sequence_bytes = 1117616133,
			xuid_high = 0,
			xuid_low = 204800,
			tickcount = 59178
		},
		{
			uncompressed_sample_offset = 1609566136,
			section_number = 3448291055,
			sequence_bytes = -1047597028,
			xuid_high = 0,
			xuid_low = 3355443662,
			tickcount = 59187
		},
		{
			uncompressed_sample_offset = 1913666619,
			section_number = 629784303,
			sequence_bytes = 1121349639,
			xuid_high = 0,
			xuid_low = 3355443662,
			tickcount = 59196
		},
		{
			uncompressed_sample_offset = 2485135228,
			section_number = 4220174063,
			sequence_bytes = 55934224,
			xuid_high = 0,
			xuid_low = 3355443665,
			tickcount = 59598
		},
		{
			uncompressed_sample_offset = 2369749501,
			section_number = 1653325551,
			sequence_bytes = -434238702,
			xuid_high = 0,
			xuid_low = 104857614,
			tickcount = 59607
		},
		{
			uncompressed_sample_offset = 122177621,
			section_number = 864927471,
			sequence_bytes = 1103066382,
			xuid_high = 0,
			xuid_low = 204800,
			tickcount = 59661
		}
	},
	Airflow = {
		{
			uncompressed_sample_offset = 100,
			section_number = 100,
			sequence_bytes = -9897583,
			xuid_high = 4287703555,
			xuid_low = 3735943921,
			tickcount = 26015
		},
		{
			uncompressed_sample_offset = 511,
			section_number = 511,
			sequence_bytes = -1,
			xuid_high = 4294965507,
			xuid_low = 3735924721,
			tickcount = 26015
		},
		{
			uncompressed_sample_offset = 100,
			section_number = 100,
			sequence_bytes = -13632949,
			xuid_high = 4191516677,
			xuid_low = 3735943921,
			tickcount = 26015
		},
		{
			uncompressed_sample_offset = 100,
			section_number = 100,
			sequence_bytes = -10880636,
			xuid_high = 4286917123,
			xuid_low = 3735943921,
			tickcount = 26019
		},
		{
			uncompressed_sample_offset = 511,
			section_number = 511,
			sequence_bytes = -1,
			xuid_high = 4294965507,
			xuid_low = 3735924721,
			tickcount = 26019
		},
		{
			uncompressed_sample_offset = 100,
			section_number = 100,
			sequence_bytes = -7472743,
			xuid_high = 4289327620,
			xuid_low = 3735943921,
			tickcount = 26019
		},
		{
			uncompressed_sample_offset = 100,
			section_number = 100,
			sequence_bytes = -9963142,
			xuid_high = 4285934083,
			xuid_low = 3735943921,
			tickcount = 26023
		},
		{
			uncompressed_sample_offset = 511,
			section_number = 511,
			sequence_bytes = -1,
			xuid_high = 4294965507,
			xuid_low = 3735924721,
			tickcount = 26023
		},
		{
			uncompressed_sample_offset = 100,
			section_number = 100,
			sequence_bytes = -13895119,
			xuid_high = 4192596485,
			xuid_low = 3735943921,
			tickcount = 26023
		},
		{
			uncompressed_sample_offset = 100,
			section_number = 100,
			sequence_bytes = -9176717,
			xuid_high = 4284819971,
			xuid_low = 3735943921,
			tickcount = 26025
		},
		{
			uncompressed_sample_offset = 511,
			section_number = 511,
			sequence_bytes = -1,
			xuid_high = 4294965507,
			xuid_low = 3735924721,
			tickcount = 26025
		},
		{
			uncompressed_sample_offset = 100,
			section_number = 100,
			sequence_bytes = -14288348,
			xuid_high = 4193147141,
			xuid_low = 3735943921,
			tickcount = 26025
		},
		{
			uncompressed_sample_offset = 100,
			section_number = 100,
			sequence_bytes = -8914575,
			xuid_high = 4284295683,
			xuid_low = 3735943921,
			tickcount = 26030
		},
		{
			uncompressed_sample_offset = 511,
			section_number = 511,
			sequence_bytes = -1,
			xuid_high = 4294965507,
			xuid_low = 3735924721,
			tickcount = 26030
		},
		{
			uncompressed_sample_offset = 100,
			section_number = 100,
			sequence_bytes = -14616034,
			xuid_high = 4193528069,
			xuid_low = 3735943921,
			tickcount = 26030
		},
		{
			uncompressed_sample_offset = 100,
			section_number = 100,
			sequence_bytes = 9632980,
			xuid_high = 4187171330,
			xuid_low = 3735943921,
			tickcount = 26034
		},
		{
			uncompressed_sample_offset = 511,
			section_number = 511,
			sequence_bytes = -1,
			xuid_high = 4294966274,
			xuid_low = 3735924721,
			tickcount = 26034
		},
		{
			uncompressed_sample_offset = 100,
			section_number = 100,
			sequence_bytes = -8783521,
			xuid_high = 4287585284,
			xuid_low = 3735943921,
			tickcount = 26034
		},
		{
			uncompressed_sample_offset = 100,
			section_number = 100,
			sequence_bytes = 3800089,
			xuid_high = 47458817,
			xuid_low = 3735943921,
			tickcount = 26038
		},
		{
			uncompressed_sample_offset = 511,
			section_number = 511,
			sequence_bytes = -1,
			xuid_high = 4294966273,
			xuid_low = 3735924721,
			tickcount = 26038
		},
		{
			uncompressed_sample_offset = 100,
			section_number = 100,
			sequence_bytes = 10026196,
			xuid_high = 4188416514,
			xuid_low = 3735943921,
			tickcount = 26038
		},
		{
			uncompressed_sample_offset = 100,
			section_number = 100,
			sequence_bytes = 10222803,
			xuid_high = 4189596162,
			xuid_low = 3735943921,
			tickcount = 26040
		},
		{
			uncompressed_sample_offset = 511,
			section_number = 511,
			sequence_bytes = -1,
			xuid_high = 4294966274,
			xuid_low = 3735924721,
			tickcount = 26040
		},
		{
			uncompressed_sample_offset = 100,
			section_number = 100,
			sequence_bytes = -10879380,
			xuid_high = 84303368,
			xuid_low = 3735943921,
			tickcount = 26040
		},
		{
			uncompressed_sample_offset = 100,
			section_number = 100,
			sequence_bytes = 10288338,
			xuid_high = 4190185986,
			xuid_low = 3735943921,
			tickcount = 26045
		},
		{
			uncompressed_sample_offset = 511,
			section_number = 511,
			sequence_bytes = -1,
			xuid_high = 4294966274,
			xuid_low = 3735924721,
			tickcount = 26045
		},
		{
			uncompressed_sample_offset = 100,
			section_number = 100,
			sequence_bytes = -10879381,
			xuid_high = 84303368,
			xuid_low = 3735943921,
			tickcount = 26045
		},
		{
			uncompressed_sample_offset = 100,
			section_number = 100,
			sequence_bytes = -8717982,
			xuid_high = 4278135299,
			xuid_low = 3735943921,
			tickcount = 26049
		},
		{
			uncompressed_sample_offset = 511,
			section_number = 511,
			sequence_bytes = -1,
			xuid_high = 4294965507,
			xuid_low = 3735924721,
			tickcount = 26049
		},
		{
			uncompressed_sample_offset = 100,
			section_number = 100,
			sequence_bytes = -15271473,
			xuid_high = 4193221637,
			xuid_low = 3735943921,
			tickcount = 26049
		},
		{
			uncompressed_sample_offset = 100,
			section_number = 100,
			sequence_bytes = -9307809,
			xuid_high = 4276824579,
			xuid_low = 3735943921,
			tickcount = 26053
		},
		{
			uncompressed_sample_offset = 511,
			section_number = 511,
			sequence_bytes = -1,
			xuid_high = 4294965507,
			xuid_low = 3735924721,
			tickcount = 26053
		},
		{
			uncompressed_sample_offset = 100,
			section_number = 100,
			sequence_bytes = -14747201,
			xuid_high = 4192603909,
			xuid_low = 3735943921,
			tickcount = 26053
		},
		{
			uncompressed_sample_offset = 100,
			section_number = 100,
			sequence_bytes = -10094244,
			xuid_high = 4275579395,
			xuid_low = 3735943921,
			tickcount = 26055
		},
		{
			uncompressed_sample_offset = 511,
			section_number = 511,
			sequence_bytes = -1,
			xuid_high = 4294965507,
			xuid_low = 3735924721,
			tickcount = 26055
		},
		{
			uncompressed_sample_offset = 100,
			section_number = 100,
			sequence_bytes = -14485073,
			xuid_high = 4192073221,
			xuid_low = 3735943921,
			tickcount = 26055
		},
		{
			uncompressed_sample_offset = 100,
			section_number = 100,
			sequence_bytes = -10552997,
			xuid_high = 4274924035,
			xuid_low = 3735943921,
			tickcount = 26060
		},
		{
			uncompressed_sample_offset = 511,
			section_number = 511,
			sequence_bytes = -1,
			xuid_high = 4294965507,
			xuid_low = 3735924721,
			tickcount = 26060
		},
		{
			uncompressed_sample_offset = 100,
			section_number = 100,
			sequence_bytes = -14419545,
			xuid_high = 4191772677,
			xuid_low = 3735943921,
			tickcount = 26060
		}
	}
}
slot_0_31_0.delta_packet = 0

function slot_0_31_0.cheat_spoof()
	if slot_0_31_0.spoof_tickcount == globals.tickcount then
		return
	end

	slot_0_31_0.spoof_tickcount = globals.tickcount
	slot_433_0_0 = slot_0_46_0.ui_tables.visuals.spoofer_list.str_value

	if not slot_433_0_0 or slot_0_31_0.cclientstate.net_channel == 0 then
		return
	end

	if slot_0_11_0(slot_0_31_0.tick_delay - globals.tickcount) > slot_0_31_0.delta_packet then
		slot_433_1_0 = slot_433_0_0
		slot_433_2_0 = slot_0_31_0.cheats_data[slot_433_1_0]

		if not slot_433_2_0 then
			return
		end

		if slot_0_31_0.packets[slot_433_1_0] then
			if #slot_0_31_0.packets[slot_433_1_0] < slot_0_31_0.packet_counter then
				slot_0_31_0.packet_counter = 1
			end

			slot_433_2_0 = slot_0_31_0.packets[slot_433_1_0][slot_0_31_0.packet_counter]
		end

		if slot_433_1_0 ~= "Disabled" then
			slot_0_35_0.shared_esp:override(false)
		else
			slot_0_35_0.shared_esp:override()
		end

		slot_0_31_0.packet_counter = slot_0_31_0.packet_counter + 1

		if slot_0_31_0.packets[slot_433_1_0] and slot_0_31_0.packet_counter > #slot_0_31_0.packets[slot_433_1_0] then
			slot_0_31_0.packet_counter = 1
		end

		if slot_433_1_0 == "Pandora" then
			slot_433_3_1 = entity.get_players()
			slot_433_4_2 = {}

			for iter_433_0 = 1, #slot_433_3_1 do
				if slot_433_3_1[iter_433_0]:is_alive() then
					slot_0_4_0(slot_433_4_2, 1, slot_433_3_1[iter_433_0])
				end
			end

			slot_433_5_2 = entity.get(slot_433_4_2[math.random(1, #slot_433_4_2)])

			if not slot_433_5_2 or not slot_433_5_2:is_alive() then
				return
			end

			slot_433_6_0 = ffi.new("pandora_data_t")
			slot_433_6_0.pandora_id = 420187
			slot_433_6_0.entity_id = slot_433_5_2:get_index()
			slot_433_7_0 = ffi.new("vector_t")
			slot_433_7_0.x, slot_433_7_0.y, slot_433_7_0.z = slot_0_13_0(-2000, 2000), slot_0_13_0(-2000, 2000), slot_0_13_0(-2000, 2000)
			slot_433_6_0.pos = slot_433_7_0
			slot_433_8_0 = ffi.new("VoiceDataCustom_t")

			ffi.copy(slot_433_8_0, slot_433_6_0, ffi.sizeof(slot_433_6_0))

			slot_433_9_2 = slot_0_31_0.packets[slot_433_1_0][slot_0_31_0.packet_counter]
			slot_433_2_0.xuid_low = slot_433_9_2.xuid_low
			slot_433_2_0.xuid_high = slot_433_5_2:get_index()
			slot_433_2_0.sequence_bytes = slot_433_9_2.sequence_bytes
			slot_433_2_0.section_number = slot_433_9_2.section_number
			slot_433_2_0.uncompressed_sample_offset = slot_433_9_2.uncompressed_sample_offset

			if slot_0_31_0.packet_counter > 1 then
				slot_0_31_0.tick_delay = globals.tickcount
				slot_0_31_0.delta_packet = slot_0_31_0.packets[slot_433_1_0][slot_0_31_0.packet_counter].tickcount - slot_0_31_0.packets[slot_433_1_0][slot_0_31_0.packet_counter - 1].tickcount
			end

			slot_0_31_0.voice_message(slot_433_2_0)

			return
		end

		slot_433_3_0 = slot_0_31_0.packets[slot_433_1_0][slot_0_31_0.packet_counter]

		if slot_433_1_0 == "Nixware" then
			slot_433_3_0.xuid_low = 3355443200 + globals.curtime / 2

			slot_0_31_0.voice_message(slot_433_3_0)

			slot_0_31_0.tick_delay = globals.tickcount
			slot_0_31_0.delta_packet = 2

			return
		end

		if slot_433_1_0 == "Fatality" then
			slot_433_4_1 = entity.get_players()
			slot_433_5_1 = 0

			for iter_433_1 = 1, #slot_433_4_1 do
				slot_433_10_1 = slot_433_4_1[iter_433_1]

				if slot_433_10_1:is_alive() and not slot_433_10_1:is_dormant() then
					slot_433_11_1 = slot_433_10_1.m_vecOrigin
					slot_433_12_1 = slot_0_31_0.calculate_fatality_value(slot_433_11_1.x)
					slot_433_13_1 = slot_0_31_0.calculate_fatality_value(slot_433_11_1.y)
					slot_433_14_1 = slot_0_31_0.calculate_fatality_value(slot_433_11_1.z)
					slot_433_13_1 = slot_433_13_1 < 0 and 4294967296 + slot_433_13_1 or slot_433_13_1
					slot_433_14_1 = slot_433_14_1 < 0 and 4294967296 + slot_433_14_1 or slot_433_14_1
					slot_433_3_0.xuid_low = slot_433_10_1:get_player_info().userid * 65536 + 704675834
					slot_433_3_0.xuid_high = globals.tickcount
					slot_433_3_0.sequence_bytes = slot_433_12_1
					slot_433_3_0.section_number = slot_433_13_1
					slot_433_3_0.uncompressed_sample_offset = slot_433_14_1

					slot_0_31_0.voice_message(slot_433_3_0)

					slot_433_5_1 = slot_433_5_1 + 1

					if slot_433_5_1 >= 3 then
						break
					end
				end
			end

			if slot_0_31_0.packet_counter > 1 then
				slot_0_31_0.tick_delay = globals.tickcount
				slot_0_31_0.delta_packet = 3
			end

			return
		end

		if slot_433_1_0 == "Airflow" then
			slot_433_4_0 = entity.get_players()
			slot_433_5_0 = 0

			for iter_433_2 = 1, #slot_433_4_0 do
				slot_433_10_0 = slot_433_4_0[iter_433_2]

				if slot_433_10_0:is_alive() then
					slot_433_11_0 = slot_433_10_0.m_vecOrigin
					slot_433_12_0 = slot_0_39_0(slot_433_11_0.x)
					slot_433_13_0 = slot_0_39_0(slot_433_11_0.y)
					slot_433_14_0 = slot_0_39_0(slot_433_11_0.z)
					slot_433_3_0.xuid_low = 3735943921
					slot_433_3_0.xuid_high = (slot_433_12_0 % 65536 + slot_433_13_0 % 256 * 65536) * 256 + iter_433_2
					slot_433_3_0.sequence_bytes = slot_433_13_0 >= 0 and slot_433_14_0 % 65536 * 256 + 1677721600 + slot_0_12_0(slot_433_13_0 / 256) or slot_433_14_0 % 65536 * 256 + 1677721600 + 256 + slot_0_12_0(slot_433_13_0 / 256)
					slot_433_3_0.section_number = globals.tickcount % 65535
					slot_433_3_0.uncompressed_sample_offset = math.random(0, 1) == 1 and 16515072 or 0

					slot_0_31_0.voice_message(slot_433_3_0)

					slot_433_5_0 = slot_433_5_0 + 1

					if slot_433_5_0 >= 3 then
						break
					end
				end
			end

			if slot_0_31_0.packet_counter > 1 then
				slot_0_31_0.tick_delay = globals.tickcount
				slot_0_31_0.delta_packet = 2
			end

			return
		end

		slot_0_31_0.voice_message(slot_433_3_0)
	end
end

slot_0_46_0.ui_tables.visuals.spoofer_switch:set_callback(function()
	if slot_0_46_0.ui_tables.visuals.spoofer_switch.value then
		events.render:set(slot_0_31_0.cheat_spoof)
	else
		events.render:unset(slot_0_31_0.cheat_spoof)
	end
end, true)
events.shutdown:set(function()
	slot_0_35_0.shared_esp:override()
end)

slot_0_31_0.con_color = nil
slot_0_55_0 = materials.get_materials("")
slot_0_31_0.console_materials = {}

for iter_0_5 = 1, #slot_0_55_0 do
	slot_0_60_0 = {
		"vgui/hud/800corner1",
		"vgui/hud/800corner2",
		"vgui/hud/800corner3",
		"vgui/hud/800corner4",
		"vgui_white"
	}

	for iter_0_6 = 1, #slot_0_60_0 do
		if slot_0_55_0[iter_0_5]:get_name():find(slot_0_60_0[iter_0_6]) then
			table.insert(slot_0_31_0.console_materials, slot_0_55_0[iter_0_5])
		end
	end
end

function slot_0_31_0.modulate_console(arg_436_0)
	for iter_436_0 = 1, 5 do
		local var_436_0 = slot_0_31_0.console_materials[iter_436_0]

		var_436_0:color_modulate(arg_436_0)
		var_436_0:alpha_modulate(arg_436_0.a / 255)
	end

	slot_0_31_0.con_color = arg_436_0:to_hex()
end

function slot_0_31_0.console_modulation()
	local var_437_0 = slot_0_43_0.console_status(slot_0_43_0.EngineClient_class)
	local var_437_1 = color(255)

	if var_437_0 then
		var_437_1 = slot_0_46_0.ui_tables.visuals.console_color.value
	end

	if var_437_1:to_hex() ~= slot_0_31_0.con_color then
		slot_0_31_0.modulate_console(var_437_1)
	end
end

slot_0_46_0.ui_tables.visuals.console_switch:set_callback(function()
	if slot_0_46_0.ui_tables.visuals.console_switch.value then
		events.render:set(slot_0_31_0.console_modulation)
	else
		events.render:unset(slot_0_31_0.console_modulation)
		slot_0_31_0.modulate_console(color(255, 255, 255, 255))
	end
end, true)
events.shutdown:set(function()
	slot_0_31_0.modulate_console(color(255, 255, 255, 255))
end)

slot_0_31_0.cache_viewmodel = {
	fov = cvar.viewmodel_fov:int(),
	x = cvar.viewmodel_offset_x:float(),
	y = cvar.viewmodel_offset_y:float(),
	z = cvar.viewmodel_offset_z:float()
}

function slot_0_31_0.set_viewmodel()
	cvar.viewmodel_fov:int(slot_0_46_0.ui_tables.viewmodel.viewmodel_fov.value)
	cvar.viewmodel_offset_x:float(slot_0_46_0.ui_tables.viewmodel.viewmodel_x.value / 100)
	cvar.viewmodel_offset_y:float(slot_0_46_0.ui_tables.viewmodel.viewmodel_y.value / 100)
	cvar.viewmodel_offset_z:float(slot_0_46_0.ui_tables.viewmodel.viewmodel_z.value / 100)

	slot_0_0_0.viewmodel.fov = slot_0_46_0.ui_tables.viewmodel.viewmodel_fov.value
	slot_0_0_0.viewmodel.x = slot_0_46_0.ui_tables.viewmodel.viewmodel_x.value
	slot_0_0_0.viewmodel.y = slot_0_46_0.ui_tables.viewmodel.viewmodel_y.value
	slot_0_0_0.viewmodel.z = slot_0_46_0.ui_tables.viewmodel.viewmodel_z.value
end

slot_0_46_0.ui_tables.viewmodel.viewmodel_switch:set_callback(function()
	if slot_0_46_0.ui_tables.viewmodel.viewmodel_switch.value then
		slot_0_31_0.cache_viewmodel.fov = cvar.viewmodel_fov:int()
		slot_0_31_0.cache_viewmodel.x = cvar.viewmodel_offset_x:float()
		slot_0_31_0.cache_viewmodel.y = cvar.viewmodel_offset_y:float()
		slot_0_31_0.cache_viewmodel.z = cvar.viewmodel_offset_z:float()

		if slot_0_46_0.ui_tables.viewmodel.viewmodel_fov.value == 0 then
			slot_0_46_0.ui_tables.viewmodel.viewmodel_fov.ref:set(cvar.viewmodel_fov:int())
		end

		if slot_0_46_0.ui_tables.viewmodel.viewmodel_x == 0 then
			slot_0_46_0.ui_tables.viewmodel.viewmodel_x.ref:set(cvar.viewmodel_offset_x:float() * 100)
		end

		if slot_0_46_0.ui_tables.viewmodel.viewmodel_y == 0 then
			slot_0_46_0.ui_tables.viewmodel.viewmodel_y.ref:set(cvar.viewmodel_offset_y:float() * 100)
		end

		if slot_0_46_0.ui_tables.viewmodel.viewmodel_z == 0 then
			slot_0_46_0.ui_tables.viewmodel.viewmodel_z.ref:set(cvar.viewmodel_offset_z:float() * 100)
		end

		cvar.sv_competitive_minspec:int(0)
		slot_0_31_0.set_viewmodel()
	else
		cvar.viewmodel_fov:int(slot_0_31_0.cache_viewmodel.fov)
		cvar.viewmodel_offset_x:float(slot_0_31_0.cache_viewmodel.x)
		cvar.viewmodel_offset_y:float(slot_0_31_0.cache_viewmodel.y)
		cvar.viewmodel_offset_z:float(slot_0_31_0.cache_viewmodel.z)
		cvar.sv_competitive_minspec:int(1)
	end

	slot_0_0_0.viewmodel.switch = slot_0_46_0.ui_tables.viewmodel.viewmodel_switch.value
end, true)
slot_0_46_0.ui_tables.viewmodel.viewmodel_fov.ref:set_callback(function()
	slot_0_31_0.set_viewmodel()
end)
slot_0_46_0.ui_tables.viewmodel.viewmodel_x.ref:set_callback(function()
	slot_0_31_0.set_viewmodel()
end)
slot_0_46_0.ui_tables.viewmodel.viewmodel_y.ref:set_callback(function()
	slot_0_31_0.set_viewmodel()
end)
slot_0_46_0.ui_tables.viewmodel.viewmodel_z.ref:set_callback(function()
	slot_0_31_0.set_viewmodel()
end)
slot_0_46_0.ui_tables.viewmodel.viewmodel_undo.ref:set_callback(function()
	slot_0_46_0.ui_tables.viewmodel.viewmodel_fov.ref:set(slot_0_31_0.cache_viewmodel.fov)
	slot_0_46_0.ui_tables.viewmodel.viewmodel_x.ref:set(slot_0_31_0.cache_viewmodel.x * 100)
	slot_0_46_0.ui_tables.viewmodel.viewmodel_y.ref:set(slot_0_31_0.cache_viewmodel.y * 100)
	slot_0_46_0.ui_tables.viewmodel.viewmodel_z.ref:set(slot_0_31_0.cache_viewmodel.z * 100)
end)
events.player_connect_full:set(function()
	if slot_0_46_0.ui_tables.viewmodel.viewmodel_switch.value then
		cvar.sv_competitive_minspec:int(0)
		slot_0_31_0.set_viewmodel()
	end
end)
events.shutdown:set(function()
	cvar.viewmodel_fov:int(slot_0_31_0.cache_viewmodel.fov)
	cvar.viewmodel_offset_x:float(slot_0_31_0.cache_viewmodel.x)
	cvar.viewmodel_offset_y:float(slot_0_31_0.cache_viewmodel.y)
	cvar.viewmodel_offset_z:float(slot_0_31_0.cache_viewmodel.z)
	cvar.sv_competitive_minspec:int(1)
end)

function slot_0_31_0.set_aspect_ratio()
	cvar.r_aspectratio:float(slot_0_46_0.ui_tables.viewmodel.aspect_value.value / 10)

	slot_0_0_0.viewmodel.aspect_ratio = slot_0_46_0.ui_tables.viewmodel.aspect_value.value
end

slot_0_31_0.cache_aspect_ratio = cvar.r_aspectratio:float()

slot_0_46_0.ui_tables.viewmodel.aspect_switch:set_callback(function()
	if slot_0_46_0.ui_tables.viewmodel.aspect_switch.value then
		slot_0_31_0.cache_aspect_ratio = cvar.r_aspectratio:float()

		if slot_0_46_0.ui_tables.viewmodel.aspect_value.value == 0 then
			slot_0_46_0.ui_tables.viewmodel.aspect_value.ref:set(slot_0_38_0(slot_0_31_0.cache_aspect_ratio * 10, 0.01))
		end

		slot_0_31_0.set_aspect_ratio()
	else
		cvar.r_aspectratio:float(slot_0_31_0.cache_aspect_ratio)
	end

	slot_0_0_0.viewmodel.aspect_ratio_switch = slot_0_46_0.ui_tables.viewmodel.aspect_switch.value
end, true)
slot_0_46_0.ui_tables.viewmodel.aspect_value:set_callback(function()
	slot_0_31_0.set_aspect_ratio()
end)
events.shutdown:set(function()
	cvar.r_aspectratio:float(slot_0_31_0.cache_aspect_ratio)
end)

slot_0_56_0 = {}
slot_0_56_0.move_yaw = 0
slot_0_56_0.wall_yaw = 0
slot_0_56_0.final_yaw = 0

function slot_0_56_0.correct_move_yaw(arg_453_0)
	local var_453_0 = render.camera_angles()
	local var_453_1 = arg_453_0.move_yaw
	local var_453_2 = arg_453_0.forwardmove > 0
	local var_453_3 = arg_453_0.forwardmove < 0
	local var_453_4 = arg_453_0.forwardmove == 0
	local var_453_5 = arg_453_0.sidemove < 0
	local var_453_6 = arg_453_0.sidemove > 0

	if var_453_2 then
		local var_453_7 = slot_0_19_0(90 * slot_0_11_0(var_453_0.x / 89), 45, 90)

		if var_453_5 then
			return math.normalize_yaw(var_453_1 + var_453_7), var_453_7
		end

		if var_453_6 then
			return math.normalize_yaw(var_453_1 - var_453_7), -var_453_7
		end

		return var_453_1, 0
	end

	if var_453_3 then
		local var_453_8 = 180 - slot_0_19_0(90 * slot_0_11_0(var_453_0.x / 89), 45, 90)

		if var_453_5 then
			return math.normalize_yaw(var_453_1 + var_453_8), var_453_8
		end

		if var_453_6 then
			return math.normalize_yaw(var_453_1 - var_453_8), -var_453_8
		end

		return math.normalize_yaw(var_453_1 - 180), -180
	end

	if var_453_4 then
		if var_453_5 then
			return math.normalize_yaw(var_453_1 + 90), 90
		end

		if var_453_6 then
			return math.normalize_yaw(var_453_1 - 90), -90
		end
	end

	return var_453_1, 0
end

function slot_0_56_0.avoid_collision_detect(arg_454_0)
	slot_454_1_0 = slot_0_40_0.ref
	slot_454_2_0 = slot_0_40_0.ref:get_origin()

	if slot_0_40_0.on_ground or not slot_454_1_0 or slot_0_46_0.ui_tables.misc.avoid_disable.value_by_name[1] and slot_0_40_0.crouching then
		return
	end

	if slot_0_35_0.edge_jump:get() and slot_0_46_0.ui_tables.misc.avoid_disable.value_by_name[2] then
		return
	end

	if slot_454_1_0:get_anim_state().on_ladder then
		return
	end

	slot_454_5_0 = slot_454_1_0.m_vecMins
	slot_454_6_0 = slot_454_1_0.m_vecMaxs
	slot_454_5_0.z = 20
	slot_454_6_0.z = slot_454_6_0.z - 10
	slot_454_7_1 = slot_454_1_0.m_vecVelocity
	slot_454_7_1.z = 0
	slot_454_7_0 = slot_454_7_1:length()
	slot_454_8_0, slot_454_9_0 = slot_0_56_0.correct_move_yaw(arg_454_0)
	slot_454_1_0.m_vecVelocity:normalized():angles().z = 0
	slot_0_56_0.move_yaw = slot_454_8_0
	slot_0_56_0.wall_yaw = nil
	slot_454_11_0 = vector():angles(0, slot_454_8_0 - 25, 0) * 4 * slot_0_46_0.ui_tables.misc.avoid_dist.value
	slot_454_12_0 = vector():angles(0, slot_454_8_0 + 25, 0) * 4 * slot_0_46_0.ui_tables.misc.avoid_dist.value
	slot_454_13_0 = slot_454_1_0:simulate_movement()

	slot_454_13_0:think()

	slot_454_14_0 = slot_454_13_0.origin
	slot_454_15_0 = slot_0_22_0(slot_454_14_0, slot_454_14_0 + slot_454_11_0, slot_454_5_0, slot_454_6_0, entity.get_players(false, false), 33636363, 3)

	if slot_454_15_0.fraction ~= 1 then
		slot_454_16_1 = slot_0_22_0(slot_454_14_0, slot_454_14_0 + slot_454_11_0, slot_454_5_0, slot_454_6_0, entity.get_players(false, false), 536870912, 3)

		if slot_454_15_0.entity == entity.get(0) and slot_454_16_1.fraction == 1 then
			slot_454_17_1, slot_454_18_1 = slot_454_15_0.plane.normal:vectors()
			slot_454_19_1 = slot_454_15_0.end_pos
			slot_454_21_0 = (slot_454_19_1 + slot_454_17_1 * 8 - slot_454_19_1):normalized()

			if slot_0_11_0(math.normalize_yaw(slot_454_21_0:angles().y - slot_454_8_0)) > 110 then
				slot_454_21_0 = slot_454_21_0 * -1
			end

			arg_454_0.move_yaw = math.normalize_yaw(slot_454_21_0:angles().y - slot_454_9_0)
			slot_0_56_0.wall_yaw = slot_454_21_0:angles().y

			return
		end
	end

	slot_454_16_0 = slot_0_22_0(slot_454_14_0, slot_454_14_0 + slot_454_12_0, slot_454_5_0, slot_454_6_0, entity.get_players(false, false), 33636363, 3)

	if slot_454_16_0.fraction ~= 1 then
		slot_454_17_0 = slot_0_22_0(slot_454_14_0, slot_454_14_0 + slot_454_12_0, slot_454_5_0, slot_454_6_0, entity.get_players(false, false), 536870912, 3)

		if slot_454_16_0.entity == entity.get(0) and slot_454_17_0.fraction == 1 then
			slot_454_18_0, slot_454_19_0 = slot_454_16_0.plane.normal:vectors()
			slot_454_20_0 = slot_454_16_0.end_pos
			slot_454_22_0 = (slot_454_20_0 + slot_454_18_0 * 8 - slot_454_20_0):normalized()

			if slot_0_11_0(math.normalize_yaw(slot_454_22_0:angles().y - slot_454_8_0)) > 70 then
				slot_454_22_0 = slot_454_22_0 * -1
			end

			arg_454_0.move_yaw = math.normalize_yaw(slot_454_22_0:angles().y - slot_454_9_0)
			slot_0_56_0.wall_yaw = slot_454_22_0:angles().y
		end
	end
end

slot_0_46_0.ui_tables.misc.avoid_switch:set_callback(function()
	if slot_0_46_0.ui_tables.misc.avoid_switch.value then
		events.createmove:set(slot_0_56_0.avoid_collision_detect)
	else
		events.createmove:unset(slot_0_56_0.avoid_collision_detect)
	end
end, true)

function slot_0_56_0.fast_ladder_func(arg_456_0)
	local var_456_0 = slot_0_40_0.ref

	if not var_456_0 then
		return
	end

	if not var_456_0:get_anim_state().on_ladder then
		return
	end

	if arg_456_0.forwardmove == 0 then
		return
	end

	local var_456_1 = render.camera_angles()

	arg_456_0.view_angles.x = 89
	arg_456_0.view_angles.z = 0

	if var_456_1.x < 45 then
		arg_456_0.in_moveright = arg_456_0.forwardmove > 0
		arg_456_0.in_moveleft = arg_456_0.forwardmove < 0
		arg_456_0.in_forward = arg_456_0.forwardmove < 0
		arg_456_0.in_back = arg_456_0.forwardmove > 0

		if arg_456_0.sidemove == 0 then
			arg_456_0.view_angles.y = arg_456_0.view_angles.y + 90

			return
		end

		arg_456_0.view_angles.y = arg_456_0.sidemove < 0 and arg_456_0.view_angles.y + 150 or arg_456_0.view_angles.y + 30
	end
end

slot_0_46_0.ui_tables.misc.fastladder_switch:set_callback(function()
	if slot_0_46_0.ui_tables.misc.fastladder_switch.value then
		events.createmove:set(slot_0_56_0.fast_ladder_func)
	else
		events.createmove:unset(slot_0_56_0.fast_ladder_func)
	end
end, true)

function slot_0_56_0.no_fall_func(arg_458_0)
	local var_458_0 = slot_0_40_0.ref

	if var_458_0:get_anim_state().on_ladder then
		return
	end

	local var_458_1 = var_458_0.m_fFlags
	local var_458_2 = bit.band(var_458_1, slot_0_32_0.flags.FL_ONGROUND) ~= 0
	local var_458_3 = slot_0_42_0(var_458_0, 1, false, nil, nil, nil, false)
	local var_458_4 = slot_0_42_0(var_458_0, 7, false, nil, nil, nil, false)
	local var_458_5 = var_458_0:get_origin()
	local var_458_6 = utils.trace_hull(var_458_5, vector(var_458_5.x, var_458_5.y, var_458_3.z - 4), var_458_0.m_vecMins, var_458_0.m_vecMaxs, var_458_0, 33636363, 3)

	if not var_458_2 and var_458_6.fraction ~= 1 then
		arg_458_0.in_duck = false
		arg_458_0.in_jump = true
	elseif var_458_0.m_vecVelocity.z < -550 and utils.trace_hull(var_458_5, vector(var_458_5.x, var_458_5.y, var_458_4.z - 4), var_458_0.m_vecMins, var_458_0.m_vecMaxs, var_458_0, 33636363, 3).fraction ~= 1 then
		arg_458_0.in_duck = true
	end
end

slot_0_46_0.ui_tables.misc.fall_switch:set_callback(function()
	if slot_0_46_0.ui_tables.misc.fall_switch.value then
		events.createmove:set(slot_0_56_0.no_fall_func)
	else
		events.createmove:unset(slot_0_56_0.no_fall_func)
	end
end, true)

slot_0_56_0.cache_clantag = ""
slot_0_56_0.side_switch = true
slot_0_56_0.sync_array = {
	"             ex",
	"            ext",
	"           exte",
	"          exten",
	"         extens",
	"        extensi",
	"       extensio",
	"      extension",
	"     extension ",
	"   extension  ",
	"   extension   ",
	"  extension    ",
	" extension     ",
	"extension      ",
	"extension      ",
	"extension      ",
	"extension      ",
	"extension      ",
	"extension      ",
	"extension      ",
	"extension      ",
	"xtension       ",
	"tension        ",
	"ension         ",
	"nsion          ",
	"sion           ",
	"ion            ",
	"on             ",
	"n              ",
	"               "
}
slot_0_56_0.syncg_array = {
	"             ga",
	"            gam",
	"           game",
	"          games",
	"         gamese",
	"        gamesen",
	"       gamesens",
	"      gamesense",
	"     gamesense ",
	"    gamesense  ",
	"   gamesense   ",
	"  gamesense    ",
	" gamesense     ",
	"gamesense      ",
	"gamesense      ",
	"gamesense      ",
	"gamesense      ",
	"gamesense      ",
	"gamesense      ",
	"gamesense      ",
	"gamesense      ",
	"anesense       ",
	"nesense        ",
	"esense         ",
	"sense          ",
	"ense           ",
	"nse            ",
	"se             ",
	"e              ",
	"               "
}

function slot_0_56_0.clantag_func()
	if not utils.net_channel() then
		return
	end

	local var_460_0 = (globals.client_tick + globals.clock_offset) / slot_0_38_0(0.6 / globals.tickinterval / 2, 1)
	local var_460_1 = slot_0_12_0(var_460_0 % 30 + 1)

	if not slot_0_56_0.side_switch then
		var_460_1 = 14
	end

	local var_460_2 = slot_0_56_0.sync_array[var_460_1]

	if slot_0_56_0.cache_clantag ~= var_460_2 then
		common.set_clan_tag(var_460_2)

		slot_0_56_0.cache_clantag = var_460_2
	end
end

events.cs_win_panel_match:set(function()
	if not slot_0_46_0.ui_tables.misc.clantag_switch.value then
		return
	end

	slot_0_56_0.side_switch = false
end)
events.round_start:set(function()
	slot_0_56_0.side_switch = true
end)
events.announce_phase_end:set(function()
	slot_0_56_0.side_switch = false
end)
events.cs_game_disconnected:set(function()
	slot_0_56_0.side_switch = true
end)
slot_0_46_0.ui_tables.misc.clantag_switch:set_callback(function()
	if not slot_0_46_0.ui_tables.misc.clantag_switch.value then
		events.render:unset(slot_0_56_0.clantag_func)
		slot_0_35_0.clantag:override()
		common.set_clan_tag("")
	else
		events.render:set(slot_0_56_0.clantag_func)
		slot_0_35_0.clantag:override(false)
	end
end, true)
events.shutdown:set(function()
	common.set_clan_tag("")
	slot_0_35_0.clantag:override()
end)

slot_0_56_0.shared_player_data = {}

ffi.cdef("\n                typedef struct\n                {\n                    int64_t value;\n                } convert_t;\n            ")

function slot_0_56_0.shared_recieve_data(arg_467_0)
	local var_467_0 = ffi.new("VoiceDataCustom_t")
	local var_467_1 = ffi.new("convert_t")

	var_467_1.value = arg_467_0.xuid

	ffi.copy(var_467_0, var_467_1, ffi.sizeof(var_467_1))

	var_467_0.sequence_bytes = arg_467_0.sequence_bytes
	var_467_0.section_number = arg_467_0.section_number
	var_467_0.uncompressed_sample_offset = arg_467_0.uncompressed_sample_offset

	local var_467_2 = arg_467_0.entity

	id1 = var_467_2:get_index()
	id2 = var_467_2:get_player_info().userid
	id2_string = tostring(id2)
	id3 = var_467_2:get_xuid()
	id3_string = tostring(id3)
	shifr1 = var_467_0.section_number - 1
	shifr2 = var_467_0.xuid_high - 3
	shifr3 = var_467_0.sequence_bytes - id1 - 2 + 2147483648
	p1 = 0
	p2 = 1
	p3 = id2_string:sub(1, 1) + id3_string:sub(#id3_string - 2, #id3_string - 2)

	for iter_467_0 = 1, #id3_string do
		p1 = slot_0_39_0(id3_string:sub(iter_467_0, iter_467_0)) + p1

		if slot_0_39_0(id3_string:sub(iter_467_0, iter_467_0)) > 0 then
			p2 = slot_0_39_0(id3_string:sub(iter_467_0, iter_467_0)) * p2
		end
	end

	sh1 = (p1 + id2 % p1) % 256
	sh2 = (slot_0_39_0(p3) + slot_0_39_0(id3_string:sub(3, 3))) % 256
	sh3 = (p2 + 17) % 4096

	if var_467_2 == slot_0_23_0() and shifr2 % sh2 == 0 or shifr1 % sh1 == 0 and shifr2 % sh2 == 0 and shifr3 % sh3 == 0 then
		slot_0_56_0.shared_player_data[var_467_2:get_index()] = true
	end
end

slot_0_56_0.share_cooldown = 0

function slot_0_56_0.start_share()
	events.render:set(slot_0_56_0.shared_send_data)
	utils.execute_after(1.5, function()
		events.render:unset(slot_0_56_0.shared_send_data)
	end)
end

function slot_0_56_0.shared_send_data()
	if slot_0_31_0.cclientstate.net_channel == 0 then
		return
	end

	if slot_0_11_0(slot_0_56_0.share_cooldown - globals.tickcount) > 15 then
		local var_470_0 = slot_0_23_0()
		local var_470_1 = var_470_0:get_index()
		local var_470_2 = var_470_0:get_player_info().userid
		local var_470_3 = tostring(var_470_2)
		local var_470_4 = var_470_0:get_xuid()
		local var_470_5 = tostring(var_470_4)
		local var_470_6 = math.random(1, 16777216)
		local var_470_7 = math.random(1, 16777216)
		local var_470_8 = var_470_3:sub(1, 1) + var_470_5:sub(#var_470_5 - 2, #var_470_5 - 2)
		local var_470_9 = 1
		local var_470_10 = 0
		local var_470_11 = math.random(1, 1048576)

		for iter_470_0 = 1, #var_470_5 do
			var_470_10 = slot_0_39_0(var_470_5:sub(iter_470_0, iter_470_0)) + var_470_10

			if slot_0_39_0(var_470_5:sub(iter_470_0, iter_470_0)) > 0 then
				var_470_9 = slot_0_39_0(var_470_5:sub(iter_470_0, iter_470_0)) * var_470_9
			end
		end

		local var_470_12 = (var_470_9 + 17) % 4096
		local var_470_13 = ffi.new("VoiceDataCustom_t")

		var_470_13.xuid_low = math.random(1, 4294967296)
		var_470_13.xuid_high = (slot_0_39_0(var_470_8) + slot_0_39_0(var_470_5:sub(3, 3))) % 256 * var_470_7 + 3
		var_470_13.sequence_bytes = var_470_12 * var_470_11 + var_470_1 + 2 - 2147483648
		var_470_13.section_number = (var_470_10 + var_470_2 % var_470_10) % 256 * var_470_6 + 1
		var_470_13.uncompressed_sample_offset = math.random(1, 4294967296)

		slot_0_31_0.voice_message(var_470_13)

		slot_0_56_0.share_cooldown = globals.tickcount
	end
end

function slot_0_56_0.shared_controller()
	slot_0_56_0.shared_player_data = {}

	events.voice_message:set(slot_0_56_0.shared_recieve_data)
	utils.execute_after(1, function()
		events.voice_message:unset(slot_0_56_0.shared_recieve_data)
		slot_0_56_0.render_shared_icon()
	end)
end

function slot_0_56_0.render_shared_icon()
	local var_473_0 = entity.get_players(nil, true)

	for iter_473_0 = 1, #var_473_0 do
		local var_473_1 = var_473_0[iter_473_0]

		if not var_473_1 then
			-- block empty
		else
			local var_473_2 = var_473_1:get_index()

			if slot_0_56_0.shared_player_data[var_473_2] then
				var_473_1:set_icon("file://{images}/icons/extension/shared_icon.png")
			else
				var_473_1:set_icon()
			end
		end
	end
end

events.player_connect_full:set(function()
	slot_0_56_0.start_share()
end, true)
events.round_start:set(function()
	slot_0_56_0.start_share()
end, true)
slot_0_46_0.ui_tables.misc.shared_switch:set_callback(function()
	if slot_0_46_0.ui_tables.misc.shared_switch.value then
		events.player_connect_full:set(slot_0_56_0.shared_controller)
		events.round_start:set(slot_0_56_0.shared_controller)
		slot_0_56_0.shared_controller()
		slot_0_56_0.start_share()
	else
		events.player_connect_full:unset(slot_0_56_0.shared_controller)
		events.round_start:unset(slot_0_56_0.shared_controller)

		local var_476_0 = entity.get_players(nil, true)

		for iter_476_0 = 1, #var_476_0 do
			local var_476_1 = var_476_0[iter_476_0]

			if not var_476_1 then
				-- block empty
			else
				var_476_1:set_icon()
			end
		end
	end
end, true)
events.shutdown:set(function()
	local var_477_0 = entity.get_players(nil, true)

	for iter_477_0 = 1, #var_477_0 do
		local var_477_1 = var_477_0[iter_477_0]

		if not var_477_1 then
			-- block empty
		else
			var_477_1:set_icon()
		end
	end
end)
slot_0_46_0.ui_tables.misc.ping_switch:set_callback(function()
	if slot_0_46_0.ui_tables.misc.ping_switch.value then
		cvar.sv_maxunlag:float(0.4)
		slot_0_35_0.ping:override(slot_0_46_0.ui_tables.misc.ping_slider.value)
		slot_0_35_0.ping:disabled(true)
	else
		cvar.sv_maxunlag:float(0.2)
		slot_0_35_0.ping:override()
		slot_0_35_0.ping:disabled(false)
	end
end, true)
slot_0_46_0.ui_tables.misc.ping_slider:set_callback(function()
	if slot_0_46_0.ui_tables.misc.ping_switch.value then
		slot_0_35_0.ping:override(slot_0_46_0.ui_tables.misc.ping_slider.value)
	end
end)

slot_0_56_0.trash_enemy_head = {
	counter = 1,
	phrase = {
		"хули ты вылупился бежать надо было",
		"Хуй те в рот",
		"меняй луаху в тебя попали",
		"ебать ты носом пропахал",
		"Ебать Сам@рский продукт перезагрузил реcольвер",
		"этот КАНГАЛ пресет твое хрючево километр на километр растянуло",
		{
			"log",
			"ебать в тебя выбивает"
		},
		"Фристэнд паходу не спас",
		"ебать купи САМОВАР лучше отыгрывать будешь слабый",
		"Лови в дыню",
		{
			"У тебя колени подкосились",
			"Че ноги не держут?"
		},
		"ух ты растение епт",
		{
			"флипу задонил и шары вылупил на рулетку",
			"ты жалок"
		},
		"ща ебу тя",
		"очки купи чмырь тупоголовый",
		"1 сын дворняги",
		"уши назад прикрутить не забудь",
		"запомни Extension это верх совершенства",
		{
			"ебанутая луа",
			"не думал что она так бустит"
		},
		"Молча играй долбаеб",
		"По еблу тебе шалашовка ебаная",
		"ебать ты как такой хуевый ник выдумал",
		"тебя переиграть даже с выключеным моником можно",
		"мда такой слабости я еще не видел",
		{
			"death",
			"Из деда повыписывай мне еще",
			"фрибет ходячий"
		},
		{
			"Время видел?",
			"Отбой пидорас"
		},
		{
			"тупой уволень",
			"1.         "
		},
		"ало барабан играть будем?",
		"изи кд норм ебу бота на медию",
		{
			"давай скажи какой чит хуевый",
			"мб поверю"
		},
		"нихуя я тебе глаза вдавил в череп",
		"ты походу кондицию перегрел",
		{
			"CHERNOBYL.LUA | New Defensive Exploit",
			"ты с этой хуйней мне отсасываешь ?"
		},
		"страшно подумать с каким говном ты там играешь",
		{
			"че это было",
			"опять хуевая попытка убить меня"
		},
		"хэй гайс у бича все найс",
		"???",
		{
			"ты афк или че?",
			"а то хуй поймешь то мувается то чет сидит дрочит.",
			"короче поспортивней по паблосу передвигайся"
		},
		{
			"я хуй пойму ты че с джостика что ли плеишь ?",
			"че то там наискосок туда сюда прыгает"
		},
		{
			"neverlose.cc\\market\\item?id=bkRCJa",
			"прикупи мб полегче станет"
		},
		"Ну ниче в некст раунде попытаешься",
		{
			"ты типо на авп копишь или в чем прек ?",
			"финансист хренов"
		},
		"ты просто тратишь время",
		"зачем ты вообще существуешь?",
		"Ты вообще понимаешь что такое игра или просто кнопки жмешь?",
		"Следующий аа пресет в студию !"
	}
}
slot_0_56_0.trash_enemy_head.counter = utils.random_int(1, #slot_0_56_0.trash_enemy_head.phrase)
slot_0_56_0.trash_enemy_body = {
	counter = 1,
	phrase = {
		"хояф хуйпачелияЭлит мойкрай какие еще луа тебе надо купить чтоб в тебя не попадали",
		{
			"ебать я даблтап на педали забиндил",
			"имба нахуй"
		},
		"Ебать ты рассыпался",
		"1.",
		"проскули в чат как же тебе плохо играть с этим читом",
		"-_HS_-",
		{
			"death",
			"Из деда повыписывай мне еще",
			"фрибет ходячий"
		},
		"на нахуй пидор дырявый",
		"В следущий раз используй wasd",
		{
			"че",
			"ебать ты тюбик"
		},
		{
			"CHERNOBYL.LUA | New Defensive Exploit",
			"ты с этой хуйней мне отсасываешь ?"
		},
		"На нахуй",
		{
			"я хуй пойму ты че с джостика что ли плеишь ?",
			"че то там наискосок туда сюда прыгает"
		},
		"Нахуй ты вообще сюда зашел",
		{
			"Для тебя маршрут построен",
			"съебал с глаз моих"
		},
		"Че спину прихватило?",
		{
			"neverlose.cc\\market\\item?id=bkRCJa",
			"пока в деде вот почекай"
		},
		{
			"ебанутая луа",
			"не думал что она так бустит"
		},
		{
			"Сбит нахуй",
			"Ты прям как беспилотник"
		},
		"изи свин фаршированный",
		{
			"Мокрый кросовок?",
			"Или просто еблан с нортон"
		},
		"На по почкам",
		{
			"ты афк или че?",
			"а то хуй поймешь то мувается то чет сидит дрочит.",
			"короче поспортивней по паблосу передвигайся."
		},
		"ебать ты из трусов выпрыгнул",
		"ты просто тратишь время",
		{
			"Лбу включи ушастый",
			" а то не ощущаю"
		},
		"я хз чо в боди пальнуло",
		{
			"ищи себя в ",
			"хотя кому ты нужен"
		},
		"зачем ты вообще существуешь?",
		"ты че стоп кран нажал?",
		{
			"ливай сын шлюхи я на пабе",
			"хана всем нахуй"
		},
		"изрешитил хуесоса",
		"наблюдай за моей игрой хуесос немощный",
		"это типо ванвей или че",
		"???",
		{
			"neverlose.cc\\market\\item?id=bkRCJa",
			"прикупи мб полегче станет"
		},
		"Ну ниче в некст раунде попытаешься",
		{
			"ты типо на авп копишь или в чем прек ?",
			"финансист хренов"
		},
		"Ты вообще понимаешь что такое игра или просто кнопки жмешь?"
	}
}
slot_0_56_0.trash_enemy_body.counter = utils.random_int(1, #slot_0_56_0.trash_enemy_body.phrase)
slot_0_56_0.trash_local_head = {
	counter = 1,
	phrase = {
		"я в ахуе вылупился уебан уже по клавиатуре тыркает",
		{
			"Чтоб твоя мать тебе так половником уебала",
			"сын твари одноногой                  "
		},
		"Везучий хуеглот",
		{
			"похуй",
			"ебаный щегол вылупился из пизды своей матери швабры и она ему на трассе насосала у отца дальнобойщика на подписку    "
		},
		"где такие ники штампуют от тебя реально смешно умирать",
		{
			"ye fkj [etcjc",
			"блять пошел нахуй",
			"высер в попытках меня убить там клаву чуть не перевернул     "
		},
		"что ты делаешь",
		"бурмалда ебаная",
		{
			"деревянная ты хуйня",
			"куда ты сука попадаешь в меня            "
		},
		"ну я мать твою резал",
		{
			"бля",
			"ты вообще еблан нахуй      ",
			"тупорылая хуета     ",
			"оно же игроком себя считает       "
		},
		{
			"ну я ебал что ты творишь",
			"самородок 2024"
		},
		{
			"блять сука анрег     ",
			"как же ему повезло        ",
			"смотрите на эту недоношенную хуету            "
		},
		{
			"бля ну оно же хуеглотов по типу трюкача насмотрелось",
			"теперь по паблу пытается тут мозг высрать через глаз"
		},
		"))",
		"наконец то у него получилось",
		{
			"нихуя",
			"я думал у тебя рейджбот выключен"
		}
	}
}
slot_0_56_0.trash_local_head.counter = utils.random_int(1, #slot_0_56_0.trash_local_head.phrase)
slot_0_56_0.trash_local_body = {
	counter = 1,
	phrase = {
		{
			"А в голову слабо чихпых ебаный",
			"немощь"
		},
		{
			"В некст раунде выебу тя",
			"туткачонок"
		},
		"Найс подкрутка админская",
		"че это",
		{
			"че за хуесос на месте стоит",
			"шлюха нахуй дорожная"
		},
		{
			"и оно называет себя Игроком",
			"максимум ты хуеглот из трущоб"
		},
		"не расслабляйся в некст раунде я тебе настучу по еблу",
		"бля пойду калик раздую нахуй эту игру",
		{
			"я без оружия был сука      ",
			"падла невыносимая"
		},
		"да я ебал меня тепнуло нахуй",
		"))",
		"наконец то у него получилось",
		{
			"нихуя",
			"я думал у тебя рейджбот выключен"
		},
		{
			"это же как должно было повести чтобы ты смог меня убить",
			"что то на уровне фантастики"
		}
	}
}
slot_0_56_0.trash_local_body.counter = utils.random_int(1, #slot_0_56_0.trash_local_body.phrase)
slot_0_56_0.trash_enemy_molotov = {
	counter = 1,
	phrase = {
		{
			"А нахуй ты сгорел?",
			"Умылся в соплях"
		},
		"Ты вообще в курсах что смок у тебя был",
		"Нассал бы уже под себя чем так умирать",
		{
			"Подкур пошел",
			"Винстак или мальборо"
		}
	}
}
slot_0_56_0.trash_enemy_molotov.counter = utils.random_int(1, #slot_0_56_0.trash_enemy_molotov.phrase)
slot_0_56_0.trash_enemy_hegrenade = {
	counter = 1,
	phrase = {
		"Бабах уебище",
		"Ты че вообще нихуя не видишь",
		"хэй гайс у бича все найс",
		"TNTшнут"
	}
}
slot_0_56_0.trash_enemy_hegrenade.counter = utils.random_int(1, #slot_0_56_0.trash_enemy_hegrenade.phrase)
slot_0_56_0.trash_revenge = {
	counter = 1,
	phrase = {
		"1.",
		"Че думал тебе еще раз повезет?",
		"свалился уебан слабейший",
		{
			"ты лоу",
			"дядя                     "
		},
		"туши свет выблядок слабый",
		"1 сын шахетра ебливый",
		"Переигран кобыла ебаная",
		{
			"Изи хуесос",
			"Думалку включай хоть иногда"
		}
	}
}
slot_0_56_0.trash_revenge.counter = utils.random_int(1, #slot_0_56_0.trash_revenge.phrase)
slot_0_56_0.trash_enemy_zeus = {
	counter = 1,
	phrase = {
		"Наэлектризован пидорас",
		{
			"Ну а хули ты думал 220 вольт тут",
			"Включай антизевсилку"
		},
		"на зевсе ботяра ебаная",
		"Уварот нажимай хоть иногда"
	}
}
slot_0_56_0.trash_enemy_zeus.counter = utils.random_int(1, #slot_0_56_0.trash_enemy_zeus.phrase)
slot_0_56_0.trash_enemy_knife = {
	counter = 1,
	phrase = {
		{
			"На мясе",
			"Колбаса ебаная"
		},
		"На ноже терпила",
		"Уши тебе отрезал",
		"Спокойной ночи долбаеб"
	}
}
slot_0_56_0.trash_enemy_knife.counter = utils.random_int(1, #slot_0_56_0.trash_enemy_knife.phrase)
slot_0_56_0.trash_revenge_id = nil
slot_0_56_0.last_kill = nil
slot_0_56_0.trashtalk_list = {}

events.player_death:set(function(arg_480_0)
	if not slot_0_46_0.ui_tables.misc.trashtalk_switch.value then
		return
	end

	local var_480_0 = entity.get(arg_480_0.userid, true)

	if not var_480_0 then
		return
	end

	local var_480_1 = entity.get(arg_480_0.attacker, true)

	if var_480_1 == entity.get(0) then
		return
	end

	local var_480_2 = arg_480_0.headshot
	local var_480_3 = arg_480_0.weapon == "taser"
	local var_480_4 = arg_480_0.weapon == "hegrenade"
	local var_480_5 = arg_480_0.weapon == "inferno"
	local var_480_6 = arg_480_0.weapon:find("knife")
	local var_480_7
	local var_480_8 = false
	local var_480_9 = slot_0_23_0()

	if var_480_0 == var_480_9 and var_480_1 ~= var_480_9 and var_480_1:is_enemy() then
		var_480_7 = false
		slot_0_56_0.last_kill = var_480_1
	end

	if var_480_0 ~= var_480_9 and var_480_1 == var_480_9 and var_480_0:is_enemy() then
		var_480_7 = true
	end

	if slot_0_56_0.last_kill == var_480_0 then
		var_480_8 = true
	end

	if var_480_7 == nil and not var_480_8 then
		return
	end

	local var_480_10
	local var_480_11 = 0
	local var_480_12 = slot_0_46_0.ui_tables.misc.trash_type.ref

	if var_480_7 then
		if not var_480_12:get(1) then
			return
		end

		if var_480_2 then
			local var_480_13 = "enemy_head"

			var_480_10 = slot_0_56_0.trash_enemy_head
		else
			local var_480_14 = true

			if var_480_4 then
				var_480_10 = slot_0_56_0.trash_enemy_hegrenade

				local var_480_15 = "he"

				var_480_14 = false
			end

			if var_480_5 then
				var_480_10 = slot_0_56_0.trash_enemy_molotov

				local var_480_16 = "molotov"

				var_480_14 = false
			end

			if var_480_3 then
				var_480_10 = slot_0_56_0.trash_enemy_zeus

				local var_480_17 = "zeus"

				var_480_14 = false
			end

			if var_480_6 then
				var_480_10 = slot_0_56_0.trash_enemy_knife

				local var_480_18 = "knife"

				var_480_14 = false
			end

			if var_480_14 then
				local var_480_19 = "enemy_body"

				var_480_10 = slot_0_56_0.trash_enemy_body
			end
		end
	elseif var_480_8 then
		if not var_480_12:get(3) then
			return
		end

		local var_480_20 = "revenge"

		var_480_10 = slot_0_56_0.trash_revenge
		slot_0_56_0.last_kill = nil
	else
		if not var_480_12:get(2) then
			return
		end

		if var_480_2 then
			local var_480_21 = "local_head"

			var_480_10 = slot_0_56_0.trash_local_head
		else
			local var_480_22 = "local_body"

			var_480_10 = slot_0_56_0.trash_local_body
		end
	end

	local var_480_23 = var_480_10.counter
	local var_480_24 = var_480_0:get_name()

	if not slot_0_46_0.ui_tables.misc.trashtalk_switch.value then
		return
	end

	local var_480_25 = var_480_10.phrase[var_480_23]

	var_480_10.counter = var_480_10.counter + 1

	if #var_480_10.phrase < var_480_10.counter then
		var_480_10.counter = 1
	end

	if type(var_480_25) == "table" then
		if var_480_25[1] == "log" then
			var_480_25[1] = string.format("extension Hit %s head for %s(%s) (0 hp remaining) backtrack: %s hitchance: %s", var_480_24, 100 + utils.random_int(0, 100), utils.random_int(1, 10), utils.random_int(30, 40), utils.random_int(1, 30))
		end

		if var_480_25[1] == "death" then
			var_480_25[1] = string.format("*МЕРТВ* %s", var_480_24)
		end

		for iter_480_0 = 1, #var_480_25 do
			table.insert(slot_0_56_0.trashtalk_list, {
				time = #var_480_25[iter_480_0] * 0.034,
				text = var_480_25[iter_480_0]
			})
		end

		return
	end

	table.insert(slot_0_56_0.trashtalk_list, {
		time = #var_480_25 * 0.032,
		text = var_480_25
	})
end)

slot_0_56_0.trashtalk_curtime = 0

events.render:set(function()
	if not slot_0_46_0.ui_tables.misc.trashtalk_switch.value then
		slot_0_56_0.trashtalk_list = {}

		return
	end

	if slot_0_11_0(slot_0_56_0.trashtalk_curtime - globals.curtime) > 10 then
		slot_0_56_0.trashtalk_curtime = globals.curtime
		slot_0_56_0.trashtalk_list = {}
	end

	if slot_0_56_0.trashtalk_curtime - globals.curtime > 0 then
		return
	end

	for iter_481_0 = 1, #slot_0_56_0.trashtalk_list do
		local var_481_0 = slot_0_56_0.trashtalk_list[iter_481_0]

		if var_481_0.time < 0.8 then
			var_481_0.time = 0.8
		end

		utils.execute_after(var_481_0.time, function()
			utils.console_exec("say \"" .. var_481_0.text .. "\"")
		end)

		slot_0_56_0.trashtalk_curtime = globals.curtime + var_481_0.time

		table.remove(slot_0_56_0.trashtalk_list, iter_481_0)

		break
	end
end)
events.round_start:set(function()
	slot_0_56_0.last_kill = nil
end)
events.render:set(function()
	local var_484_0 = ui.get_style("Link Active")
	local var_484_1 = {
		var_484_0:to_hsv()
	}
	local var_484_2 = ui.get_style("Link Active")
	local var_484_3 = color(255):as_hsv(var_484_1[1], math.max(var_484_1[2] - 0.2, 0), math.max(var_484_1[3] - 0.5, 0))
	local var_484_4 = ui.get_style("Link Active")
	local var_484_5 = globals.curtime * 6 % 23 - 2
	local var_484_6 = {}

	for iter_484_0 = 1, 9 do
		local var_484_7 = iter_484_0 < var_484_5 and var_484_5 - iter_484_0 or iter_484_0 - var_484_5

		if iter_484_0 < var_484_5 then
			if var_484_7 <= 5 then
				var_484_6[iter_484_0] = var_484_3
			elseif var_484_7 <= 8 then
				var_484_7 = (var_484_7 - 5) / 3
				var_484_6[iter_484_0] = slot_0_31_0.calculate_color(var_484_4, var_484_3, var_484_7)
			else
				var_484_7 = (var_484_7 - 8) / 4
				var_484_6[iter_484_0] = slot_0_31_0.calculate_color(var_484_2, var_484_4, var_484_7)
			end
		else
			local var_484_8 = var_484_7 / 3

			var_484_6[iter_484_0] = slot_0_31_0.calculate_color(var_484_2, var_484_3, var_484_8)
		end
	end

	local var_484_9 = "Extension"
	local var_484_10 = ""

	for iter_484_1 = 1, #var_484_9 do
		var_484_10 = var_484_10 .. "\a" .. var_484_6[iter_484_1]:to_hex() .. var_484_9:sub(iter_484_1, iter_484_1)
	end

	ui.sidebar(var_484_10 .. " ", "\a" .. var_484_6[1]:to_hex() .. "")
end)
utils.execute_after(0.5, function()
	slot_0_2_0("\aFFFFFFFFext - " .. "\a{Link Active}" .. common.get_username() .. "\n")
end)
