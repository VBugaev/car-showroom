import Link from 'next/link';
import { Container, Row, Col, Form, FormGroup, Input, Button } from 'reactstrap';
import '../pageStyles/login.css';


export default () => (
    <Container className="login-page-wrapper">
        <Row className="login-form-wrapper">
            <Col className="d-flex flex-column justify-content-center" sm="12" md={{ size: 4, offset: 4 }}>
                <h1 className="display-4 align-middle text-center mb-5">Sign up the client</h1>
                <Form>
                    <FormGroup>
                        <Input type="text" name="name" placeholder="Enter name" />
                    </FormGroup>
                    <FormGroup>
                        <Input type="text" name="surname"  placeholder="Enter surname" />
                    </FormGroup>
                    <FormGroup>
                        <Input type="text" name="patronymic"  placeholder="Enter patronymic" />
                    </FormGroup>
                    <FormGroup>
                        <Input type="phone" name="phone" id="loginPhone" placeholder="Enter phone" />
                    </FormGroup>
                    <FormGroup>
                        <Input type="password" name="password" id="loginPassword" placeholder="Enter password" />
                    </FormGroup>
                    <Button outline color="primary" size="lg" block>Register</Button>
                    <Link href="/login">
                        <a className="btn btn-outline-secondary btn-lg btn-block">Go back</a>
                    </Link>
                </Form>
            </Col>
        </Row>
    </Container>
)