import * as React from 'react'
import { useState } from 'react'
import InputLabel from '@mui/material/InputLabel'
import MenuItem from '@mui/material/MenuItem'
import FormHelperText from '@mui/material/FormHelperText'
import FormControl from '@mui/material/FormControl'
import Select from '@mui/material/Select'
import TextField from '@mui/material/TextField';
import Box from '@mui/material/Box';
import Table from '@mui/material/Table';
import TableBody from '@mui/material/TableBody';
import TableCell from '@mui/material/TableCell';
import TableContainer from '@mui/material/TableContainer';
import TableHead from '@mui/material/TableHead';
import TableRow from '@mui/material/TableRow';
import Typography from '@mui/material/Typography';
import Paper from '@mui/material/Paper';
import VisibilityIcon from '@mui/icons-material/Visibility';
import Tooltip from '@mui/material/Tooltip';
import '../Assets/Css/SearchBar.css'
import '../Assets/Css/homePages.css'
import { useEffect } from 'react';
import { Button } from '@mui/material';
import ClipLoader from "react-spinners/ClipLoader";
import Checkbox from '@mui/material/Checkbox';
import Pagination from '@mui/material/Pagination';
import Stack from '@mui/material/Stack';
import Modal from '@mui/material/Modal';
import Tab from '@mui/material/Tab';
import Tabs from '@mui/material/Tabs';
import IconButton from '@mui/material/IconButton';
import PhotoCamera from '@mui/icons-material/PhotoCamera';

export default function Home() {

  //-----FILTERS-----//
  const [kecamatan, setKecamatan] = React.useState('')
  const [jalan, setJalan] = React.useState('')
  const [loading, setLoading] = useState(false);
  const [orderby, setOrderby] = React.useState('')
  const [asc, setAsc] = React.useState('')
  const [total, setTotal] = React.useState('')

  //-----PAGINATION-----//
  const label = { inputProps: { 'aria-label': 'Checkbox demo' } };
  const [curent, setCurent] = React.useState('' || 1)
  const [limit, setLimit] = React.useState('' || 10)
  let page_count = Math.ceil(total / limit)

  //-----DATA-----//
  const [allData, setAllData] = React.useState('')
  const [showDetails, setShowDetails] = React.useState('')

  //-----MODAL-----//
  const [value, setValue] = React.useState('1');
  const [open, setOpen] = React.useState(false);
  const handleOpen = (event) => {
    setShowDetails(event)
    if (showDetails) {
      setOpen(true)
    } else {
      setOpen(false)
    }
  }
  const handleClose = () => setOpen(false);

  const getAll = async () => {
    // console.log(`curent : ${curent} | limit : ${limit} | orderby : ${orderby} | asc : ${asc}`)

    try {
      const getData = await fetch(`http://localhost:5000/home?orderby=${orderby}&asc=${asc}&limit=${limit}&curent=${curent}`)
      const data = await getData.json()
      setAllData(data.data)
      setTotal(data.total_data)

    } catch (error) {
      console.log(error)
    }
  }

  const handleChangeKecamatan = async (event) => {
    if (event.target.value === 'pilih') {
      setKecamatan('')
      getAll()
    } else {
      setKecamatan(event.target.value)
      const getData = await fetch(`http://localhost:5000/home?kec=${event.target.value}&orderby=${orderby}&asc=${asc}&limit=${limit}&curent=${curent}`)
      const data = await getData.json()
      setAllData(data.data)
      setTotal(data.total_data)
    }
  }

  const handleRuasJalan = async (event) => {
    if (kecamatan.length > 0 && event.target.value === 0) {
      getAll()
    } else {
      try {
        setJalan(event.target.value)
        const getData = await fetch(`http://localhost:5000/home?kec=${kecamatan}&jalan=${event.target.value}&orderby=${orderby}&asc=${asc}&limit=${limit}&curent=${curent}`)
        const data = await getData.json()
        setAllData(data.data)
        setTotal(data.total_data)
      } catch (error) {
        console.log(error)
      }
    }
  }

  const handleReset = () => {
    setKecamatan('')
    setJalan('')
    getAll()
    setCurent('')
  }

  const paginationHandle = (event) => {
    // setCurent(value.target.innerText)
    // console.log(value.target.dataset.testid)
    if (event.target.dataset.testid === "NavigateBeforeIcon") {
      setCurent(curent - 1)
    }
    else if (event.target.dataset.testid === "NavigateNextIcon") {
      setCurent(curent + 1)
    } else {
      setCurent(event.target.innerText)
    }
  }

  const style = {
    position: 'relative',
    top: '50%',
    left: '50%',
    transform: 'translate(-50%, -50%)',
    maxWidth: 1200,
    height: "auto",
    bgcolor: 'background.paper',
    border: '2px solid #000',
    boxShadow: 24,
    p: 4,
    overflowX: "scroll"
  };

  const handleChange = (event, newValue) => {
    setValue(newValue);
  };

  useEffect(() => {
    getAll()

    setTimeout(() => {
      setLoading(false)
    }, 10000)
  }, [curent])

  return (
    <>
      <div className="bg"></div>
      <div className="container">
        <div className="homeBody">
          <Box sx={{maxHeight:"100px"}}>
            <FormControl sx={{ m: 1, minWidth: 200, justifyContent: "center", alignContent: "center" }}>
              <InputLabel id="demo-simple-select-helper-label">Kecamatan</InputLabel>
              <Select
                labelId="demo-simple-select-helper-label"
                id="demo-simple-select-helper"
                label="Kecamatan"
                value={kecamatan}
                onChange={handleChangeKecamatan}
              >
                <MenuItem value="pilih" onChange={handleChangeKecamatan}>
                  <em>---Pilih---</em>
                </MenuItem>
                <MenuItem value={'Telanaipura'} onChange={handleChangeKecamatan}>Kec. Telanaipura</MenuItem>
                <MenuItem value={'Palmerah'} onChange={handleChangeKecamatan}>Kec. Palmerah</MenuItem>
                <MenuItem value={'Jambi Selatan'} onChange={handleChangeKecamatan}>Kec. Jambi Selatan</MenuItem>
                <MenuItem value={'Jambi Timur'} onChange={handleChangeKecamatan}>Kec. Jambi Timur</MenuItem>
                <MenuItem value={'Pelayangan'} onChange={handleChangeKecamatan}>Kec. Pelayangan</MenuItem>
                <MenuItem value={'Pasar Jambi'} onChange={handleChangeKecamatan}>Kec. Pasar Jambi</MenuItem>
                <MenuItem value={'Danau Teluk'} onChange={handleChangeKecamatan}>Kec. Danau Teluk</MenuItem>
                <MenuItem value={'Kota Baru'} onChange={handleChangeKecamatan}>Kec. Kota Baru</MenuItem>
                <MenuItem value={'Jelutung'} onChange={handleChangeKecamatan}>Kec. Jelutung</MenuItem>
                <MenuItem value={'Alam Barajo'} onChange={handleChangeKecamatan}>Kec. Alam Barajo</MenuItem>
                <MenuItem value={'Danau Sipin'} onChange={handleChangeKecamatan}>Kec. Danau Sipin</MenuItem>
              </Select>
              <FormHelperText>Pilih Kecamatan</FormHelperText>
            </FormControl>
            <FormControl sx={{ m: 1, minWidth: 100 }}>
              <TextField
                label="Jalan.."
                id="outlined-basic"
                variant="outlined"
                value={jalan}
                onInput={handleRuasJalan}
              // onChange={searchDouble}
              // onBlur={blur}
              >
              </TextField>
              <FormHelperText>Tulis Nama Ruas Jalan</FormHelperText>
              {/* {resultData.length <= 1 && (
                <FormHelperText>Tulis Nama Ruas Jalan</FormHelperText>
              )}
              {resultData.length >= 0 && (
                <div className="dataResult" onMouseLeave={leave}>
                  {Array.from(resultData).map(value => {
                    return (
                      <a className="dataItem" key={value.no} target="_blank">
                        <p
                          onClick={() => selectValue(value.nama_ruas)}
                        >
                          Jl.{value.nama_ruas}, Kecamatan {value.kecamatan_yang_dilalui}
                        </p>
                      </a>
                    )
                  })}
                </div>
              )} */}
            </FormControl>
            <FormControl sx={{ m: 1, minWidth: 70, minHeight: 50, justifyContent: "center", alignContent: "center" }}>
              <div className="resetButton">
                <button onClick={handleReset}>
                  Reset
                </button>
              </div>
            </FormControl>
          </Box>
        </div>

        {/* <div style={{ margin: '10px 50px 40px 50px', height: '68vh', width: '134vh', display: 'flex', justifyContent: 'center', alignContent: 'center', alignItems: 'center', border: 'solid black 1px', borderRadius: '5px', background: "#756859" }}>
          <Map
            mapboxAccessToken={"pk.eyJ1IjoiamFpcnVzY2FsdmluIiwiYSI6ImNsNWtrbTZqMzBiMnMzb3BqMDI2bHlxb2IifQ.6t_OCZJV4hpBJo1PgJPnfA"}
            initialViewState={{
              longitude: 103.607254,
              latitude: -1.609972,
              zoom: 11.5,
              pitch: 50
            }}
            style={{ width: 1000, height: 500, border: 'solid black 1px', borderRadius: '5px' }}
            mapStyle="mapbox://styles/mapbox/streets-v9"
          >
            <Marker
              longitude={103.607254}
              latitude={-1.609972}
              offsetTop={{ 40: 2 }}>
              <img
                src="https://png.pngtree.com/png-vector/20210303/ourmid/pngtree-maps-pointer-with-circle-shadow-png-image_2983412.jpg"
                width={8 * 5}
                height={8 * 5}
              />
            </Marker>
          </Map>
        </div>
        <hr></hr> */}


        <div style={{ padding: "20px 50px" }}>
          <TableContainer component={Paper}>
            <Table aria-label="customized table">
              <TableHead style={{ backgroundColor: "Highlight" }}>
                <TableRow>
                  <TableCell><Checkbox {...label} /></TableCell>
                  <TableCell>No Ruas</TableCell>
                  <TableCell>Nama Jalan</TableCell>
                  <TableCell>Kecamatan Yang Dilalui</TableCell>
                  <TableCell style={{ textAlign: "center" }}>Action</TableCell>
                </TableRow>
              </TableHead>
              {loading ? (
                <ClipLoader size={30} loading={loading} style={{ display: "flex", justifyContent: "center" }} />
              ) : (
                <>
                  {allData.length === 0 ? (
                    <TableBody>
                      <TableRow>
                        Cant find any data..
                      </TableRow>
                    </TableBody>
                  ) : (
                    allData.map(element => (
                      <TableBody>
                        <TableRow key={element.no} style={{ backgroundColor: "aliceblue" }}>
                          <TableCell style={{ width: "50px" }}><Checkbox {...label} /></TableCell>
                          <TableCell >{element.no_ruas}</TableCell>
                          <TableCell >{element.jl}{element.nama_ruas}</TableCell>
                          <TableCell >{element.kecamatan_yang_dilalui}</TableCell>
                          <TableCell style={{ justifyContent: "center" }}>
                            <Tooltip placement="right" title="Show">
                              <Button onClick={() => handleOpen(element)}>
                                <VisibilityIcon />
                              </Button>
                            </Tooltip>
                          </TableCell>
                        </TableRow>
                      </TableBody>
                    ))
                  )}
                </>
              )}
            </Table>
            <Stack spacing={2}>
              <Pagination
                color="primary"
                style={{
                  display: "flex",
                  justifyContent: "center"
                }}
                count={page_count}
                onChange={paginationHandle}
              />
              <Typography>Page {curent}  |  Showing {limit} of {total} data</Typography>
            </Stack>
          </TableContainer>
        </div>
      </div>

      {/* ---------------------{ M O D A L }---------------------*/}
      <Modal
        open={open}
        onClose={handleClose}
        aria-labelledby="modal-modal-title"
        aria-describedby="modal-modal-description"
      >
        <Box sx={style}>
          <Tabs
            value={value}
            onChange={handleChange}
            variant="scrollable"
            scrollButtons="auto"
            aria-label="scrollable auto tabs example"
          >
            <Tab label="DDI" value={1} />
            <Tab label="Ruas" value={2} />
          </Tabs>
          <Typography id="modal-modal-title" variant="h6" component="h2">
            Text in a modal
          </Typography>
          {/* <Typography id="modal-modal-description" sx={{ mt: 2 }}>
            Duis mollis, est non commodo luctus, nisi erat porttitor ligula.
          </Typography> */}
          <Table aria-label="customized table" >
            <TableHead style={{ backgroundColor: "Highlight" }}>
              <TableRow>  
                <TableCell style={{ width: "40px" }}>No</TableCell>
                <TableCell>Nomor Ruas</TableCell>
                <TableCell>Nama Ruas Jalan</TableCell>
                <TableCell>Kecamatan Yang Dilalui</TableCell>
                <TableCell>Panjang Ruas(km)</TableCell>
                <TableCell>Lebar(m)</TableCell>
                <td style={{ maxWidth: "100%", float: "left", marginTop: "25px" }}>
                  <td style={{ width: "100%", display: "flex", justifyContent: "center" }}>Panjang Tiap Jenis Permukaan (%)</td>
                  <hr style={{ height: "2px", borderWidth: "0", color: "black", backgroundColor: "black" }}></hr>
                  <TableRow style={{ display: "flex", float: "left", textAlign: "center" }}>
                    <td style={{ minWidth: "100px" }}>Hotmix</td>
                    <td style={{ minWidth: "100px" }}>Aspal/Penetrasi</td>
                    <td style={{ minWidth: "100px" }}>Perkerasan Beton</td>
                    <td style={{ minWidth: "100px" }}>Tefroid/Kerikil</td>
                    <td style={{ minWidth: "100px" }}>Tanah/Belum Tembus</td>
                  </TableRow>
                </td>
                <TableCell style={{ minWidth: "100%" }}>
                  <td style={{ width: "100%", display: "flex", justifyContent: "center" }}>Panjang Tiap Kondisi (%)</td>
                  <hr style={{ height: "1.5px", borderWidth: "0", color: "black", backgroundColor: "black" }}></hr>
                  <TableRow style={{ display: "flex", float: "left" }}>
                    <td style={{ minWidth: "90px", }}>
                      <td style={{ width: "100%", display: "flex", justifyContent: "center" }}>Baik</td>
                      <hr style={{ height: "1.5px", borderWidth: "0", color: "black", backgroundColor: "black" }}></hr>
                      <TableRow style={{ display: "flex", float: "left", width: "100%" }}>
                        <td style={{ minWidth: "70px", textAlign: "center" }}>%</td>
                        <td style={{ minWidth: "70px", textAlign: "center" }}>KM</td>
                      </TableRow>
                    </td>
                    <td style={{ minWidth: "90px", }}>
                      <td style={{ width: "100%", display: "flex", justifyContent: "center" }}>Sedang</td>
                      <hr style={{ height: "1.5px", borderWidth: "0", color: "black", backgroundColor: "black" }}></hr>
                      <TableRow style={{ display: "flex", float: "left", width: "100%" }}>
                        <td style={{ minWidth: "70px", textAlign: "center" }}>%</td>
                        <td style={{ minWidth: "70px", textAlign: "center" }}>KM</td>
                      </TableRow>
                    </td>
                    <td style={{ minWidth: "90px", }}>
                      <td style={{ width: "100%", display: "flex", justifyContent: "center" }}>Rusak Ringan</td>
                      <hr style={{ height: "1.5px", borderWidth: "0", color: "black", backgroundColor: "black" }}></hr>
                      <TableRow style={{ display: "flex", float: "left", width: "100%" }}>
                        <td style={{ minWidth: "70px", textAlign: "center" }}>%</td>
                        <td style={{ minWidth: "70px", textAlign: "center" }}>KM</td>
                      </TableRow>
                    </td>
                    <td style={{ minWidth: "90px", }}>
                      <td style={{ width: "100%", display: "flex", justifyContent: "center" }}>Rusak Berat</td>
                      <hr style={{ height: "1.5px", borderWidth: "0", color: "black", backgroundColor: "black" }}></hr>
                      <TableRow style={{ display: "flex", float: "left", width: "100%" }}>
                        <td style={{ minWidth: "70px", textAlign: "center" }}>%</td>
                        <td style={{ minWidth: "70px", textAlign: "center" }}>KM</td>
                      </TableRow>
                    </td>
                  </TableRow>
                </TableCell>
                <TableCell>LHR</TableCell>
                <TableCell style={{ minWidth: "100%" }}>
                  <td style={{ width: "100%", display: "flex", justifyContent: "center" }}>Akses Ke Jalan</td>
                  <hr style={{ height: "2px", borderWidth: "0", color: "black", backgroundColor: "black" }}></hr>
                  <TableRow>
                    <td>N/P/K</td>
                  </TableRow>
                </TableCell>
                <TableCell>Keterangan</TableCell>
                <TableCell style={{ textAlign: "center" }}>Action</TableCell>
              </TableRow>
            </TableHead>
            {showDetails.length === 0 ? (
              <TableBody>
                <TableRow>
                  Cant find any data..
                </TableRow>
              </TableBody>
            ) : (
              <TableBody>
                <TableRow style={{ backgroundColor: "aliceblue" }}>
                  <TableCell>{showDetails.no}</TableCell>
                  <TableCell>{showDetails.no_ruas}</TableCell>
                  <TableCell>{showDetails.jl}{showDetails.nama_ruas}</TableCell>
                  <TableCell>{showDetails.kecamatan_yang_dilalui}</TableCell>
                  <TableCell>{showDetails.panjang_ruas}</TableCell>
                  <TableCell>{showDetails.lebar}</TableCell>
                  <TableCell style={{ padding: "0px", height: "100%", width: "100%" }}>
                    <TableRow style={{ minWidth: "310px", height: "91px", display: "flex", alignItems: "center", textAlign: "center" }}>
                      <td style={{ minWidth: "100px" }}>{showDetails.hotmix}</td>
                      <td style={{ minWidth: "100px" }}>{showDetails.aspal}</td>
                      <td style={{ minWidth: "100px" }}>{showDetails.perkerasan_beton}</td>
                      <td style={{ minWidth: "100px" }}>{showDetails.kerikil}</td>
                      <td style={{ minWidth: "100px" }}>{showDetails.tanah}</td>
                    </TableRow>
                  </TableCell>
                  <TableCell style={{ padding: "0px", height: "100%", width: "100%" }}>
                    <TableRow style={{ minWidth: "310px", height: "91px", display: "flex", alignItems: "center", textAlign: "center" }}>
                      <td style={{ minWidth: "70px", paddingLeft: "20px" }}>{showDetails.kon_baik_deg}</td>
                      <td style={{ minWidth: "70px" }}>{showDetails.kon_baik_km}</td>
                      <td style={{ minWidth: "70px" }}>{showDetails.kon_sedang_deg}</td>
                      <td style={{ minWidth: "70px" }}>{showDetails.kon_sedang_km}</td>
                      <td style={{ minWidth: "70px" }}>{showDetails.kon_r_ringan_deg}</td>
                      <td style={{ minWidth: "70px" }}>{showDetails.kon_r_ringan_km}</td>
                      <td style={{ minWidth: "70px" }}>{showDetails.kon_r_berat_deg}</td>
                      <td style={{ minWidth: "70px" }}>{showDetails.kon_r_berat_km}</td>
                    </TableRow>
                  </TableCell>
                  <TableCell>{showDetails.lhr}</TableCell>
                  <TableCell style={{ paddingLeft: "30px" }}>{showDetails.akses}</TableCell>
                  <TableCell style={{ paddingLeft: "50px" }}>{showDetails.keterangan ? showDetails.keterangan : "-"}</TableCell>
                  <TableCell style={{ display:"flex", justifyContent: "center" }}>
                    <Tooltip placement="top" title="Upload">
                      <IconButton color="primary" aria-label="upload picture" component="label">
                        <input hidden accept="image/*" type="file" />
                        <PhotoCamera />
                      </IconButton>
                    </Tooltip>
                    <Tooltip placement="right" title="Show">
                      <Button>
                        <VisibilityIcon />
                      </Button>
                    </Tooltip>
                  </TableCell>
                </TableRow>
              </TableBody>
            )}
          </Table>
        </Box>
      </Modal>
    </>
  )
}