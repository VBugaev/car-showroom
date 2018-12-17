import { Container, Row, Col, Form, FormGroup, Input, Button } from 'reactstrap';
import Link from 'next/link';
import '../pageStyles/login.css';


export default () => (
    <Container className="page-wrapper">
        <Row className="login-form-wrapper">
            <Col className="d-flex flex-column justify-content-center" sm="12" md={{ size: 4, offset: 4 }}>
                <h1 className="display-4 align-middle text-center mb-5">Car showroom</h1>
                <Form>
                    <FormGroup>
                        <Input type="phone" name="phone" id="loginPhone" placeholder="Enter phone" />
                    </FormGroup>
                    <FormGroup>
                        <Input type="password" name="password" id="loginPassword" placeholder="Enter password" />
                    </FormGroup>
                    <Link href="/main">
                        <a className="btn btn-outline-primary btn-lg btn-block">Sign in</a>
                    </Link>
                    {/* <Button outline color="primary" size="lg" block>Sign in</Button> */}
                    <Link href="/register">
                        <a className="btn btn-outline-success btn-lg btn-block">Sign up</a>
                    </Link>
                </Form>
            </Col>
        </Row>
    </Container>
)