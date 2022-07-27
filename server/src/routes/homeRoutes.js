const { Router } = require('express')
const { searchRuasJalan, doubleSearch, Telanaipura, Palmerah, JambiSelatan, JambiTimur, PasarJambi, Pelayangan, DanauTeluk, KotaBaru, Jelutung, AlamBarajo, DanauSipin, getAll, postImage, upload, getImage, deleteImage} = require('../controllers/homeController')

const router = Router()

router.get('/home', getAll)

router.post('/home/post', upload.single('gambar'), postImage)
router.get('/home/img', getImage)
router.delete('/home/img/:no_dd1', deleteImage)

router.get('/home/search/:searchkecamatan/:searchjalan', doubleSearch)
router.get('/home/search/:searchjalan', searchRuasJalan)
router.get('/home/kec-telanaipura', Telanaipura)
router.get('/home/kec-palmerah', Palmerah)
router.get('/home/kec-jambi%20selatan', JambiSelatan)
router.get('/home/kec-jambi%20timur', JambiTimur)
router.get('/home/kec-pelayangan', Pelayangan)
router.get('/home/kec-pasar%20jambi', PasarJambi)
router.get('/home/kec-danau%20teluk', DanauTeluk)
router.get('/home/kec-kota%20baru', KotaBaru)
router.get('/home/kec-jelutung', Jelutung)
router.get('/home/kec-alam%20barajo', AlamBarajo)
router.get('/home/kec-danau%20sipin', DanauSipin)

module.exports = router