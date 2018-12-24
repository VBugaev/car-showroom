import React, { Fragment } from 'react';
import {
    Input,
    InputGroup,
    TabPane,
    Row,
    Col
} from 'reactstrap';
import './tabs.css';
import dayjs from 'dayjs';
import ReactTable from 'react-table';
import "react-table/react-table.css";


export class StatisticsTab extends React.Component {
    constructor(props) {
        super(props);
        this.state = {
            totalPrice: null,
            brandPrice: null
        }
    }

    getStat = () => {
        fetch('http://localhost:3000/api/stat')
            .then(r => r.json())
            .then(data => {
                this.setState({
                    totalPrice: data["TotalMarketPrice"]
                 });
            });
    }

    componentDidUpdate = () => {
        this.getStat();
    }

    componentDidMount = () => {
      this.getStat();
    }
    
    render() {
        const { state, props } = this;
        return  (<TabPane tabId={props.tabId} className="tabs-wrapper">
                    <Col sm="12">
                        <Row className="item">
                            <Col sm={12}><h1 className="display-4">Total revenue: {+state.totalPrice} &#8381;</h1></Col>
                        </Row>
                        <Row>
                            
                        </Row>
                    </Col>
                </TabPane>
            );
    }
}
 export default StatisticsTab;

