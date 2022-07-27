const pool = require('../db')
const axios = require('axios')
const multer = require('multer')
const path = require('path')    
const fs = require('fs');

const searchRuasJalan = async (req, res) => {
    try {
        const search = req.params.searchjalan
        const { rows : get } = await pool.query(`SELECT * FROM dd1 WHERE nama_ruas LIKE INITCAP('%${search}%')`)
        res.json(get)

    } catch (error) {
        console.log(error.message)
        return res.status(500).json({
            error: error.message
        })
    }
}

const doubleSearch = async (req, res) => {
    try {
        const kec = req.params.searchkecamatan
        const jln = req.params.searchjalan
        const { rows : get } = await pool.query(`SELECT * FROM dd1 WHERE kecamatan_yang_dilalui LIKE '%${kec}%' AND nama_ruas LIKE INITCAP('%${jln}%')`)
        res.json(get)

    } catch (error) {
        console.log(error.message)
        return res.status(500).json({
            error: error.message
        })
    }
}

const getAll = async (req, res) => {
    try {
        const curent = req.query.curent || 1
        const limit = req.query.limit || 10
        const orderby = req.query.orderby || "no_ruas"
        const asc = req.query.asc || 'ASC'
        let skip = (curent - 1) * limit
        const kec = req.query.kec || ''
        const jalan = req.query.jalan || ''
        const getAll = await pool.query(`
        SELECT * FROM dd1 
        WHERE kecamatan_yang_dilalui LIKE '%${kec}%' AND nama_ruas LIKE INITCAP('%${jalan}%')`)
        let total = getAll.rowCount

        const get = await pool.query(`
        SELECT * FROM dd1 
        WHERE kecamatan_yang_dilalui LIKE '%${kec}%' AND nama_ruas LIKE INITCAP('%${jalan}%')
        ORDER BY ${orderby} ${asc} LIMIT ${limit} OFFSET ${skip}`)
        const data = get.rows
        
        if(data.length <1) {
            console.error('ERROR');
        }
        // console.log(`curent : ${curent} | limit : ${limit}`)
        // console.log(`skip : ${skip}`)
        res.status(200).json({
            message: "Successfully get data",
            data: data,
            total_data: total,
            curent_page: curent,
            limit_page: limit,
        })
    } catch (error) {
        console.log(error.message)
        return res.status(500).json({
            error: error.message
        })
    }
}

const multerStorage = multer.diskStorage({
    destination: (req, file, cb) => {
        cb(null, path.join(__dirname, "../../public/images"))
    },

    filename: (req, file, cb) => {
        const dateTimestamp = Date.now()
        const ext = path.extname(file.originalname)
        const originalName = file.originalname
        cb(null, `image_${dateTimestamp}_${originalName}`)
    },
})

const multerFilter = async (req, file, cb) => {
    if (!file.originalname.match(/\.(PNG|png|jpg|JPG|jpeg)$/)) {
            return cb(new Error('Upload png/jpg/jpeg image only'))
        } else {
        cb(null, true)
    }
}

const upload = multer({
    storage: multerStorage,
    fileFilter: multerFilter
})

exports.delete = multer({
    storage: multerStorage
})

const postImage = async (req, res) => {
    try {
        const {deskripsi, no_dd1} = req.body
        const destination = req.file.destination
        const filename = req.file.filename
        const path = req.file.path
    
        const upload = await pool.query(`INSERT INTO gambar (gambar, deskripsi, no_dd1) VALUES ('${filename}', '${deskripsi}', '${no_dd1}')`)
        if (upload) {
            res.status(200)
                .json({
                    message: "Success upload data",
                    data: upload
            })
        }
    } catch (error) {
        console.log(error.message)
        return res.status(500).json({
            error: error.message
        })
    }
}

const getImage = async (req, res) => {
    try {
        const nodd1 = req.query.nodd1
        console.log(nodd1)
    
        const getPicture = await pool.query(`
            SELECT t1.no, t1.nama_ruas, t2.gambar, t2.deskripsi, t2.created_at
            FROM dd1 as t1
            INNER JOIN gambar as t2
            ON t1.no = t2.no_dd1
            WHERE t1.no = '${nodd1}'
        `)
        // const filtered = get.filter(r => r.id === no_dd1)
        // const found = get.find(r => r.id === no_dd1)
    
        // console.log("filtered : " + JSON.stringify(filtered))
        // console.log("found : " + JSON.stringify(found))
        res.json({
            message:"success",
            data: getPicture})
    } catch (error) {
        console.log(error.message)
        return res.status(500).json({
            error: error.message
        })
    }
}

const deleteImage = async (req, res) => {
    const no_dd1 = req.params
    const {filename} = getImage()
    let filePath = '../../public/images/'+filename
    console.log(filePath)
    // try {
    //     // const deleted = await pool.query(`DELETE FROM gambar WHERE no_dd1='${no_dd1}`)
    //     fs.unlink(filePath, )
    //     if (deleted){
    //         res.status(200).json('Successully Deleted')
    //     } else {
    //         res.status(400).json('Failed to delete')
    //     }
    // } catch (error) {
    //     console.log(error.message)
    //     return res.status(500).json({
    //         error: error.message
    //     })
    // }
}

const Telanaipura = async (req, res) => {
    try {
        const curent = req.query.curent || 1
        const limit = req.query.limit || 10
        let skip = (curent - 1) * limit

        const countAll = await pool.query(`SELECT * FROM dd1 
        WHERE kecamatan_yang_dilalui='Telanaipura'`)

        const get = await pool.query(`SELECT * FROM dd1 
        WHERE kecamatan_yang_dilalui='Telanaipura' LIMIT ${limit} OFFSET ${skip}`)

        let total = countAll.rowCount
        const data = get.rows

        res.status(200).json({
            message: "Successfully get data",
            data: data,
            total_data: total,
            curent_page: curent,
            limit_page: limit,
        })
             
    } catch (error) {
        console.log(error.message)
        return res.status(500).json({
            error: error.message
        })
    }
}

const Palmerah = async (req, res) => {
    try {
        const curent = req.query.curent || 1
        const limit = req.query.limit || 10
        let skip = (curent - 1) * limit

        const countAll = await pool.query(`SELECT * FROM dd1 
        WHERE kecamatan_yang_dilalui='Palmerah'`)

        const get = await pool.query(`SELECT * FROM dd1 
        WHERE kecamatan_yang_dilalui='Palmerah' LIMIT ${limit} OFFSET ${skip}`)

        let total = countAll.rowCount
        const data = get.rows

        res.status(200).json({
            message: "Successfully get data",
            data: data,
            total_data: total,
            curent_page: curent,
            limit_page: limit,
        })
        
    } catch (error) {
        console.log(error.message)
        return res.status(500).json({
            error: error.message
        })
    }
}

const JambiSelatan = async (req, res) => {
    try {
        const curent = req.query.curent || 1
        const limit = req.query.limit || 10
        let skip = (curent - 1) * limit

        const countAll = await pool.query(`SELECT * FROM dd1 
        WHERE kecamatan_yang_dilalui='Jambi Selatan'`)

        const get = await pool.query(`SELECT * FROM dd1 
        WHERE kecamatan_yang_dilalui='Jambi Selatan' LIMIT ${limit} OFFSET ${skip}`)

        let total = countAll.rowCount
        const data = get.rows

        res.status(200).json({
            message: "Successfully get data",
            data: data,
            total_data: total,
            curent_page: curent,
            limit_page: limit,
        })
        
    } catch (error) {
        console.log(error.message)
        return res.status(500).json({
            error: error.message
        })
    }
}

const JambiTimur = async (req, res) => {
    try {
        const curent = req.query.curent || 1
        const limit = req.query.limit || 10
        let skip = (curent - 1) * limit

        const countAll = await pool.query(`SELECT * FROM dd1 
        WHERE kecamatan_yang_dilalui='Jambi Timur'`)

        const get = await pool.query(`SELECT * FROM dd1 
        WHERE kecamatan_yang_dilalui='Jambi Timur' LIMIT ${limit} OFFSET ${skip}`)

        let total = countAll.rowCount
        const data = get.rows

        res.status(200).json({
            message: "Successfully get data",
            data: data,
            total_data: total,
            curent_page: curent,
            limit_page: limit,
        })
        
    } catch (error) {
        console.log(error.message)
        return res.status(500).json({
            error: error.message
        })
    }
}

const PasarJambi = async (req, res) => {
    try {
        const curent = req.query.curent || 1
        const limit = req.query.limit || 10
        let skip = (curent - 1) * limit

        const countAll = await pool.query(`SELECT * FROM dd1 
        WHERE kecamatan_yang_dilalui='Pasar Jambi'`)

        const get = await pool.query(`SELECT * FROM dd1 
        WHERE kecamatan_yang_dilalui='Pasar Jambi' LIMIT ${limit} OFFSET ${skip}`)

        let total = countAll.rowCount
        const data = get.rows

        res.status(200).json({
            message: "Successfully get data",
            data: data,
            total_data: total,
            curent_page: curent,
            limit_page: limit,
        })
        
    } catch (error) {
        console.log(error.message)
        return res.status(500).json({
            error: error.message
        })
    }
}

const Pelayangan = async (req, res) => {
    try {
        const curent = req.query.curent || 1
        const limit = req.query.limit || 10
        let skip = (curent - 1) * limit

        const countAll = await pool.query(`SELECT * FROM dd1 
        WHERE kecamatan_yang_dilalui='Pelayangan'`)

        const get = await pool.query(`SELECT * FROM dd1 
        WHERE kecamatan_yang_dilalui='Pelayangan' LIMIT ${limit} OFFSET ${skip}`)

        let total = countAll.rowCount
        const data = get.rows

        res.status(200).json({
            message: "Successfully get data",
            data: data,
            total_data: total,
            curent_page: curent,
            limit_page: limit,
        })

    } catch (error) {
        console.log(error.message)
        return res.status(500).json({
            error: error.message
        })
    }
}

const DanauTeluk = async (req, res) => {
    try {
        const curent = req.query.curent || 1
        const limit = req.query.limit || 10
        let skip = (curent - 1) * limit

        const countAll = await pool.query(`SELECT * FROM dd1 
        WHERE kecamatan_yang_dilalui='Danau Teluk'`)

        const get = await pool.query(`SELECT * FROM dd1 
        WHERE kecamatan_yang_dilalui='Danau Teluk' LIMIT ${limit} OFFSET ${skip}`)

        let total = countAll.rowCount
        const data = get.rows

        res.status(200).json({
            message: "Successfully get data",
            data: data,
            total_data: total,
            curent_page: curent,
            limit_page: limit,
        })
        
    } catch (error) {
        console.log(error.message)
        return res.status(500).json({
            error: error.message
        })
    }
}

const KotaBaru = async (req, res) => {
    try {
        const curent = req.query.curent || 1
        const limit = req.query.limit || 10
        let skip = (curent - 1) * limit

        const countAll = await pool.query(`SELECT * FROM dd1 
        WHERE kecamatan_yang_dilalui='Kota Baru'`)

        const get = await pool.query(`SELECT * FROM dd1 
        WHERE kecamatan_yang_dilalui='Kota Baru' LIMIT ${limit} OFFSET ${skip}`)

        let total = countAll.rowCount
        const data = get.rows

        res.status(200).json({
            message: "Successfully get data",
            data: data,
            total_data: total,
            curent_page: curent,
            limit_page: limit,
        })
        
    } catch (error) {
        console.log(error.message)
        return res.status(500).json({
            error: error.message
        })
    }
}

const Jelutung = async (req, res) => {
    try {
        const curent = req.query.curent || 1
        const limit = req.query.limit || 10
        let skip = (curent - 1) * limit

        const countAll = await pool.query(`SELECT * FROM dd1 
        WHERE kecamatan_yang_dilalui='Jelutung'`)

        const get = await pool.query(`SELECT * FROM dd1 
        WHERE kecamatan_yang_dilalui='Jelutung' LIMIT ${limit} OFFSET ${skip}`)

        let total = countAll.rowCount
        const data = get.rows

        res.status(200).json({
            message: "Successfully get data",
            data: data,
            total_data: total,
            curent_page: curent,
            limit_page: limit,
        })
        
    } catch (error) {
        console.log(error.message)
        return res.status(500).json({
            error: error.message
        })
    }
}

const AlamBarajo = async (req, res) => {
    try {
        const curent = req.query.curent || 1
        const limit = req.query.limit || 10
        let skip = (curent - 1) * limit

        const countAll = await pool.query(`SELECT * FROM dd1 
        WHERE kecamatan_yang_dilalui='Alam Barajo'`)

        const get = await pool.query(`SELECT * FROM dd1 
        WHERE kecamatan_yang_dilalui='Alam Barajo' LIMIT ${limit} OFFSET ${skip}`)

        let total = countAll.rowCount
        const data = get.rows

        res.status(200).json({
            message: "Successfully get data",
            data: data,
            total_data: total,
            curent_page: curent,
            limit_page: limit,
        })
       
    } catch (error) {
        console.log(error.message)
        return res.status(500).json({
            error: error.message
        })
    }
}

const DanauSipin = async (req, res) => {
    try {
        const curent = req.query.curent || 1
        const limit = req.query.limit || 10
        let skip = (curent - 1) * limit

        const countAll = await pool.query(`SELECT * FROM dd1 
        WHERE kecamatan_yang_dilalui='Danau Sipin'`)

        const get = await pool.query(`SELECT * FROM dd1 
        WHERE kecamatan_yang_dilalui='Danau Sipin' LIMIT ${limit} OFFSET ${skip}`)

        let total = countAll.rowCount
        const data = get.rows

        res.status(200).json({
            message: "Successfully get data",
            data: data,
            total_data: total,
            curent_page: curent,
            limit_page: limit,
        })
        
    } catch (error) {
        console.log(error.message)
        return res.status(500).json({
            error: error.message
        })
    }
}

module.exports = {
    getAll,
    searchRuasJalan,
    doubleSearch,
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
    DanauSipin,
    postImage,
    upload,
    getImage,
    deleteImage,
}