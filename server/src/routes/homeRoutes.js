const { Router } = require('express')
const { searchRuasJalan, Telanaipura, Palmerah, JambiSelatan, JambiTimur, PasarJambi, Pelayangan, DanauTeluk, KotaBaru, Jelutung, AlamBarajo, DanauSipin } = require('../controllers/homeController')

const router = Router()

router.get('/home/jalan', searchRuasJalan)
router.get('/home/kec-telanaipura', Telanaipura)
router.get('/home/kec-palmerah', Palmerah)
router.get('/home/kec-jambiselatan', JambiSelatan)
router.get('/home/kec-jambitimur', JambiTimur)
router.get('/home/kec-pelayangan', Pelayangan)
router.get('/home/kec-pasarjambi', PasarJambi)
router.get('/home/kec-danauteluk', DanauTeluk)
router.get('/home/kec-kotabaru', KotaBaru)
router.get('/home/kec-jelutung', Jelutung)
router.get('/home/kec-alambarajo', AlamBarajo)
router.get('/home/kec-danausipin', DanauSipin)

module.exports = router