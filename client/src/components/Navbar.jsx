import { AppBar, Box, Button, Container, Toolbar, Typography } from '@mui/material'
import Stack from '@mui/material/Stack';
import { Link, useNavigate } from 'react-router-dom'

import '../Assets/Css/NavCss.css'

export default function Navbar() {

    const navigate = useNavigate()

    return(
        <Box>
            <AppBar position='static' color='transparent'>
                <Container>
                    <Toolbar>
                        <Typography variant='h4'>
                            <Link to="/" 
                                className='logo-Left hover'>
                                Kota
                            </Link>
                        </Typography>
                        <Typography variant='h4' sx={{ flexGrow:1 }}>
                            <Link to="/" 
                                className='logo-Right hover'>
                                Jambi
                            </Link>
                        </Typography>
                        <Typography variant='h6' sx={{ flexGrow:1 }}>
                            <Link to="" style={{ textDecoration: "none", color: "black", marginRight: "5rem" }}>About</Link>
                            <Link to="" style={{ textDecoration: "none", color: "black", marginRight: "5rem" }}>News</Link>
                            <Link to="" style={{ textDecoration: "none", color: "black" }}>Place</Link>
                        </Typography>

                        <Stack direction="row" spacing={3}>
                            <Button 
                                variant="outlined" 
                                color="primary" 
                                onClick={() => navigate("/register")}>Register</Button>

                                
                            <Button 
                                variant="contained" 
                                onClick={() => navigate("/login")}>Login</Button>
                        </Stack>

                    </Toolbar>
                </Container>
            </AppBar>
        </Box>
    )
}