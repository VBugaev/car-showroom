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
            totalOrdersCount: null,
            brandsPrices: []
        }
    }

    getStat = () => {
        fetch('http://localhost:3000/api/stat')
            .then(r => r.json())
            .then(updData => {
                fetch('http://localhost:3000/api/statbrands')
                    .then(r => r.json())
                    .then(data => {
                        this.setState({
                            brandsPrices: data || [],
                            totalPrice: updData["TotalMarketPrice"],
                            totalOrdersCount: updData["OrdersCount"]
                        });
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
        return (<TabPane tabId={props.tabId} className="tabs-wrapper">
            <Col sm="12">
                <Row className="item">
                    <Col sm={12}><h1 className="display-4">Total revenue: {+state.totalPrice} &#8381;</h1></Col>
                </Row>
                <Row className="item">
                    <Col sm={12}><h1 className="display-4">Total orders purchased: {+state.totalOrdersCount}</h1></Col>
                </Row>
                <Row className="item">
                    <Col sm={12}><h1 className="display-4">Metrics by brands</h1></Col>
                    <ReactTable
                        style={{ marginTop: '10px' }}
                        className="col-sm-12"
                        showPagination={false}
                        minRows={0}
                        data={state.brandsPrices}
                        columns={[
                            {
                                Header: "Brand",
                                accessor: 'Brand'
                            },
                            {
                                Header: "Orders purchased",
                                accessor: 'OrdersCount'
                            },
                            {
                                Header: "Revenue",
                                accessor: 'TotalMarketPrice'
                            }
                        ]}
                    />
                </Row>
            </Col>
        </TabPane>
        );
    }
}
export default StatisticsTab;

