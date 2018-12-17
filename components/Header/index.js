import {
  Navbar,
  Row,
  NavbarBrand,
  Nav,
  NavItem,
  NavLink } from 'reactstrap';

import './header.css';

const Header = (props) => (
  <Row className="header-wrapper">
    <Navbar color="dark" dark expand="md" className="w-100">
      <NavbarBrand href="/">{props.title}</NavbarBrand>
      <Nav className="ml-auto" navbar>
      <NavItem>
        <NavLink href="/login">
          Sign out
        </NavLink>
     </NavItem>
   </Nav>
    </Navbar>
  </Row>
);

export default Header;

// <Row>
// <Col xs="12">
// <Navbar color="light" light expand="md">
// <NavbarBrand href="/">Car showroom</NavbarBrand>
// <Nav className="ml-auto" navbar>
//   <NavItem>
//     <NavLink href="/login">
//       <Link href="/login">Sign out</Link>
//     </NavLink>
//   </NavItem>
// </Nav>
// </Navbar>
// </Col>
// </Row>