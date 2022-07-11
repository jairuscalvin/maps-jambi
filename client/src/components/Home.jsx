import * as React from 'react'
import InputLabel from '@mui/material/InputLabel'
import MenuItem from '@mui/material/MenuItem'
import FormHelperText from '@mui/material/FormHelperText'
import FormControl from '@mui/material/FormControl'
import Select from '@mui/material/Select'
import { useFormik } from 'formik'
import * as yup from 'yup';
import axios from 'axios';
import { useState } from 'react'

export default function Home() {
    const [kecamatan, setKecamatan] = React.useState('')
    const [error, setError] = useState(null)
    const [success, setSuccess] = useState(null)

    const handleChange = (event) => {
      setKecamatan(event.target.value)
    }

    // const handleLoadValue = async (res, {kecamatan}) => {
    //     const result = await axios
    //     .post(`http://localhost:5000/home/${kecamatan}`)
    //     .catch((err) =>{
    //         if(err && err.response) {
    //             setError(err)
    //             setSuccess(null)
    //         }
    //     })
    //     console.log(kecamatan)
    //     if(result) {
    //         setError(null);
    //         res.json(result)
    //     }
    // }
    console.log(kecamatan)
    // handleLoadValue()

    return (
      <div>
        <FormControl sx={{ m: 1, minWidth: 120 }}>
          <InputLabel id="demo-simple-select-helper-label">Kecamatan</InputLabel>
          <Select
            labelId="demo-simple-select-helper-label"
            id="demo-simple-select-helper"
            value={kecamatan}
            label="Kecamatan"
            onChange={handleChange}
          >
            <MenuItem value="">
              <em>---Pilih---</em>
            </MenuItem>
            <MenuItem value={'kec-telanaipura'}>Kec. Telanaipura</MenuItem>
            <MenuItem value={'kec-jambiselatan'}>Kec. Jambi Selatan</MenuItem>
            <MenuItem value={'kec-jambitimur'}>Kec. Jambi Timur</MenuItem>
          </Select>
          <FormHelperText>Pilih Kecamatan</FormHelperText>
        </FormControl>
        <FormControl sx={{ m: 1, minWidth: 200 }}>
          {/* {handleLoadValue.value} */}
        </FormControl>
      </div>
    )
}