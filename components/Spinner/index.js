import { ClipLoader } from 'react-spinners';

export default (props) => (
    <div className="m-auto">
        <ClipLoader
            sizeUnit="px"
            size={100}
            color={'#000000'}
            loading={props.isLoading}
        />
    </div>
);