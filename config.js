//UBAH UBAH DISINI BRO JANGAN LUPA SUBREK YT AKMAL MODS/
require("./all/module")
global.owner = "6285174197856" 
global.namabot = "DEATH-ARMY" 
global.namaCreator = "kill from hell" 
global.autoJoin = false 
global.antilink = false 
global.versisc = '1.0' 
global.codeInvite = ""
global.imageurl = 'https://telegra.ph/file/0d557c48dfa376732ac43.jpg' 
global.isLink = ' ' 
global.thumb = fs.readFileSync("./thumb.png") 
global.audionya = fs.readFileSync("./all/sound.mp3") 
global.packname = "BOT" 
global.author = "kill from hell" 
global.jumlah = "5" 
let file = require.resolve(__filename)
fs.watchFile(file, () => {
	fs.unwatchFile(file)
	console.log(chalk.redBright(`Update ${__filename}`))
	delete require.cache[file]
	require(file)
})