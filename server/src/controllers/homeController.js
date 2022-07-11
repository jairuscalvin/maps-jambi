const pool = require('../db')

const searchRuasJalan = async (req, res) => {
    try {
        const search = req.query
        const { rows : get } = await pool.query(`SELECT * FROM dd1 WHERE nama_ruas LIKE '%${search}%'`)
        res.json(get)
        console.log(search)

    } catch (error) {
        console.log(error.message)
        return res.status(500).json({
            error: error.message
        })
    }
    
}

const Telanaipura = async (req, res) => {
    try {
        const { rows : get } = await pool.query(`SELECT * FROM dd1 
        WHERE kecamatan_yang_dilalui='Telanaipura'`)
        res.json(get)
             
    } catch (error) {
        console.log(error.message)
        return res.status(500).json({
            error: error.message
        })
    }
}

const Palmerah = async (req, res) => {
    try {
        const { rows : get } = await pool.query(`SELECT * FROM dd1 
        WHERE kecamatan_yang_dilalui='Palmerah'`)
        res.json(get)
        
    } catch (error) {
        console.log(error.message)
        return res.status(500).json({
            error: error.message
        })
    }
}

const JambiSelatan = async (req, res) => {
    try {
        const { rows : get } = await pool.query(`SELECT * FROM dd1 
        WHERE kecamatan_yang_dilalui='Jambi Selatan'`)
        res.json(get)
        
    } catch (error) {
        console.log(error.message)
        return res.status(500).json({
            error: error.message
        })
    }
}

const JambiTimur = async (req, res) => {
    try {
        const { rows : get } = await pool.query(`SELECT * FROM dd1 
        WHERE kecamatan_yang_dilalui='Jambi Timur'`)
        res.json(get)
        
    } catch (error) {
        console.log(error.message)
        return res.status(500).json({
            error: error.message
        })
    }
}

const PasarJambi = async (req, res) => {
    try {
        const { rows : get } = await pool.query(`SELECT * FROM dd1 
        WHERE kecamatan_yang_dilalui='Pasar Jambi'`)
        res.json(get)
        
    } catch (error) {
        console.log(error.message)
        return res.status(500).json({
            error: error.message
        })
    }
}

const Pelayangan = async (req, res) => {
    try {
        const { rows : get } = await pool.query(`SELECT * FROM dd1 
        WHERE kecamatan_yang_dilalui='Pelayangan'`)
        res.json(get)

    } catch (error) {
        console.log(error.message)
        return res.status(500).json({
            error: error.message
        })
    }
}

const DanauTeluk = async (req, res) => {
    try {
        const { rows : get } = await pool.query(`SELECT * FROM dd1 
        WHERE kecamatan_yang_dilalui='Danau Teluk'`)
        res.json(get)
        
    } catch (error) {
        console.log(error.message)
        return res.status(500).json({
            error: error.message
        })
    }
}

const KotaBaru = async (req, res) => {
    try {
        const { rows : get } = await pool.query(`SELECT * FROM dd1 
        WHERE kecamatan_yang_dilalui='Kota Baru'`)
        res.json(get)
        
    } catch (error) {
        console.log(error.message)
        return res.status(500).json({
            error: error.message
        })
    }
}

const Jelutung = async (req, res) => {
    try {
        const { rows : get } = await pool.query(`SELECT * FROM dd1 
        WHERE kecamatan_yang_dilalui='Jelutung'`)
        res.json(get)
        
    } catch (error) {
        console.log(error.message)
        return res.status(500).json({
            error: error.message
        })
    }
}

const AlamBarajo = async (req, res) => {
    try {
        const { rows : get } = await pool.query(`SELECT * FROM dd1 
        WHERE kecamatan_yang_dilalui='Alam Barajo'`)
        res.json(get)
       
    } catch (error) {
        console.log(error.message)
        return res.status(500).json({
            error: error.message
        })
    }
}

const DanauSipin = async (req, res) => {
    try {
        const { rows : get } = await pool.query(`SELECT * FROM dd1 
        WHERE kecamatan_yang_dilalui='Danau Sipin'`)
        res.json(get)
        
    } catch (error) {
        console.log(error.message)
        return res.status(500).json({
            error: error.message
        })
    }
}

module.exports = {
    searchRuasJalan,
    Telanaipura,
    Palmerah,
    JambiSelatan,
    JambiTimur,
    PasarJambi,
    Pelayangan,
    DanauTeluk,
    KotaBaru,
    Jelutung,
    AlamBarajo,
    DanauSipin
}