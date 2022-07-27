import * as React from 'react'
import { FormControl, Button, Card, CardContent, CircularProgress, Grid, InputLabel, Select, MenuItem, FormHelperText, TextField, Typography, CardActions } from "@mui/material";
import '../Assets/Css/surveyPges.css'

export default function Survey() {
    return (
        <>
            <div className="bg"></div>
            <div className="container">
                <Card sx={{ minWidth: 275, minHeight: 700 }}>
                    <form>
                        <CardContent>
                            <div className='header'>
                                <img className='image' src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRBTSjYPw6rpaXszcvB0scAmF-WJqk7lt5Y8A&usqp=CAU"></img>
                                <div className='opening'>
                                    <Typography sx={{ fontSize: 15, height: 20 }} color="text.primary">
                                        DEPARTEMEN PEKERJAAN UMUM DAN PERUMAHAN RAKYAT
                                    </Typography>
                                    <Typography sx={{ fontSize: 15 }} color="text.primary">
                                        DIREKTORAT JENDRAL BINA MARGA
                                    </Typography>
                                </div>
                                <Typography className='judul' color="text.primary">
                                    Formulir Survey Kondisi Jalan Aspal Per 200 Meter
                                </Typography>
                            </div>
                            <div className='body'>
                                <div className='body-head-left'>
                                    <div className='body-container'>
                                        <FormControl sx={{ m: 1, minWidth: 120 }}>
                                            <InputLabel id="demo-simple-select-helper-label">No Ruas</InputLabel>
                                            <Select
                                                labelId="demo-simple-select-helper-label"
                                                id="demo-simple-select-helper"
                                                value=""
                                                label="No Ruas"
                                            >
                                                <MenuItem value="">
                                                    <em>None</em>
                                                </MenuItem>
                                                <MenuItem value={10}>01 910 123</MenuItem>
                                                <MenuItem value={20}>01 910 123</MenuItem>
                                                <MenuItem value={30}>01 910 123</MenuItem>
                                            </Select>
                                            <FormHelperText>Nomor Ruas</FormHelperText>
                                            <TextField
                                                variant="standard"
                                                label="Nama Ruas"

                                                inputProps={{ style: { color: "black" } }}
                                                InputLabelProps={{ style: { color: "black" } }}
                                                name="Nama Ruas"
                                            />
                                            <div className='STA'>
                                                <TextField
                                                    variant="standard"
                                                    label="Dari STA"

                                                    inputProps={{ style: { color: "black" } }}
                                                    InputLabelProps={{ style: { color: "black" } }}
                                                    name="Dari STA"
                                                />
                                                <TextField
                                                    variant="standard"
                                                    label="Ke STA"

                                                    inputProps={{ style: { color: "black" } }}
                                                    InputLabelProps={{ style: { color: "black" } }}
                                                    name="Ke STA"
                                                />
                                            </div>
                                        </FormControl>
                                    </div>
                                </div>
                                <div className='body-head-middle'>
                                    <div className='half-container' style={{ borderBottom: "2px solid black" }}>
                                        <FormControl sx={{ m: 1, minWidth: 350 }}>
                                            <InputLabel id="demo-simple-select-helper-label">Propinsi</InputLabel>
                                            <Select
                                                labelId="demo-simple-select-helper-label"
                                                id="demo-simple-select-helper"
                                                value=""
                                                label="Propinsi"
                                            >
                                                <MenuItem value="">
                                                    <em>None</em>
                                                </MenuItem>
                                                <MenuItem value={10}>Kota Jambi</MenuItem>
                                                <MenuItem value={20}>Jambi Timur</MenuItem>
                                                <MenuItem value={30}>Jambi Selatan</MenuItem>
                                            </Select>
                                            <FormHelperText>Pilih Propinsi</FormHelperText>
                                        </FormControl>
                                    </div>
                                    <div className='half-container flex'>
                                        <Typography variant="body2">
                                            PPTK : BINSAR F.G BUTAR BUTAR, ST
                                        </Typography>
                                        <Typography variant="body2">
                                            PAKET : BIAYA SURVEY KONDISI JALAN
                                        </Typography>
                                        <Typography variant="body2">
                                            No Kontrak : 19/SP/SKJS-BM/DPUPR/APBD/2021
                                        </Typography>
                                    </div>
                                </div>
                                <div className='body-head-right'>
                                    <div className='body-container'>
                                        <Typography variant="body2">
                                            well meaning and kindly.
                                        </Typography>
                                    </div>
                                </div>
                            </div>
                        </CardContent>
                        <CardActions>
                            <Button size="small">Learn More</Button>
                        </CardActions>
                    </form>
                </Card>
            </div>
        </>
    )
}